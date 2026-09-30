#!/usr/bin/env node
// Generates FRENCH_REVIEW.md at the mod root from the shipped XML (TRANSLATIONS.md section 3,
// "Systematic French review by Virginie"). Reads, never writes: Keyed English/French, DefInjected
// French, and Mod/Defs to resolve each DefInjected path's original English value.
//
// This mod has no non-English source: Original == English (stated once at the top of the output,
// per TRANSLATIONS.md's instruction for mods with no foreign-language source).
//
// DefInjected list-item resolution: RimWorld's translation-report generator assigns a readable
// identifier to each <li> of a list (e.g. "lifeStages.ahuizotl_puppy.label") in the SAME order the
// <li> elements appear in the Def's own XML. This script rebuilds that order per (defName, list
// path) by first scanning ALL DefInjected paths sharing that prefix, in file order, and mapping each
// distinct identifier to a positional index (0, 1, 2, ...) — then indexes into the Def's actual <li>
// list at that position. A path this cannot resolve (defName not found locally — e.g. MVCF.ModDef,
// VEF.Weapons.ExpandableProjectileDef, both owned by other mods, not shipped here) is marked
// "(not resolvable here: def owned by <folder>, not in this repo)" rather than guessed.
'use strict';
const fs = require('fs');
const path = require('path');
const { execFileSync } = require('child_process');

const ROOT = path.join(__dirname, '..');
const rel = (...p) => path.join(ROOT, ...p);

// ---------- tiny XML tree parser (enough for RimWorld Def/LanguageData XML: elements, attrs, text) ----------

function parseXml(text) {
  text = text.replace(/^﻿/, '').replace(/<\?xml[^>]*\?>/, '').replace(/<!--[\s\S]*?-->/g, '');
  let i = 0;
  function skipWs() { while (i < text.length && /\s/.test(text[i])) i++; }
  function parseNode() {
    skipWs();
    if (text[i] !== '<') return null;
    const openMatch = /^<([\w.:-]+)((?:\s+[\w.:-]+="[^"]*")*)\s*(\/)?>/.exec(text.slice(i));
    if (!openMatch) throw new Error(`XML parse failure near: ${text.slice(i, i + 60)}`);
    const [full, tag, attrsRaw, selfClose] = openMatch;
    i += full.length;
    const node = { tag, attrs: {}, children: [], text: '' };
    for (const m of attrsRaw.matchAll(/([\w.:-]+)="([^"]*)"/g)) node.attrs[m[1]] = m[2];
    if (selfClose) return node;
    let textBuf = '';
    for (;;) {
      if (i >= text.length) throw new Error(`Unclosed <${tag}>`);
      if (text[i] === '<') {
        if (text.startsWith(`</${tag}>`, i)) { i += tag.length + 3; break; }
        const child = parseNode();
        if (child) node.children.push(child);
      } else {
        textBuf += text[i]; i++;
      }
    }
    node.text = textBuf;
    return node;
  }
  const roots = [];
  skipWs();
  while (i < text.length) {
    const n = parseNode();
    if (n) roots.push(n);
    skipWs();
  }
  return roots;
}

function unescapeXml(s) {
  return s.replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&apos;/g, "'").replace(/&amp;/g, '&');
}

// element children only (ignore stray text between tags)
const elChildren = (node) => node.children;

// ---------- Keyed ----------

function loadKeyed(file) {
  if (!fs.existsSync(file)) return new Map();
  const [root] = parseXml(fs.readFileSync(file, 'utf8'));
  const map = new Map();
  for (const c of elChildren(root)) map.set(c.tag, unescapeXml(c.text).trim());
  return map;
}

// ---------- DefInjected: ordered [path, frenchText][] per file ----------

function loadDefInjectedOrdered(file) {
  const [root] = parseXml(fs.readFileSync(file, 'utf8'));
  return elChildren(root).map((c) => [c.tag, unescapeXml(c.text).trim()]);
}

// ---------- Defs index: defType -> defName -> element ----------

function walk(dir, out) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, entry.name);
    if (entry.isDirectory()) walk(p, out);
    else if (entry.isFile() && entry.name.toLowerCase().endsWith('.xml')) out.push(p);
  }
}

function buildDefIndex(defsDir) {
  const files = [];
  walk(defsDir, files);
  const index = new Map(); // defType -> Map(defName -> element)
  for (const f of files) {
    let roots;
    try { roots = parseXml(fs.readFileSync(f, 'utf8')); } catch { continue; }
    const defsRoot = roots.find((r) => r.tag === 'Defs') || { children: roots };
    for (const def of elChildren(defsRoot)) {
      const defNameEl = def.children.find((c) => c.tag === 'defName');
      if (!defNameEl) continue;
      const defName = unescapeXml(defNameEl.text).trim();
      if (!index.has(def.tag)) index.set(def.tag, new Map());
      index.get(def.tag).set(defName, def);
    }
  }
  return index;
}

// ---------- list-item identifier derivation ----------
//
// RimWorld's translation-report generator names a <li> after its own <customLabel> (spaces -> '_')
// when present, else its own <def> value verbatim; siblings that collapse to the same name (e.g.
// three <li><def>Head</def>... with no customLabel) get a numeric "-N" suffix, in document order
// among just those duplicates. A <li> with neither field (no translatable content at all, e.g. a
// PawnKindDef.lifeStages entry) contributes no identifier and is invisible to this scheme.

function identifierFor(li) {
  const customLabel = li.children.find((c) => c.tag === 'customLabel');
  if (customLabel) { const t = unescapeXml(customLabel.text).trim(); if (t) return t.replace(/\s+/g, '_'); }
  const defTag = li.children.find((c) => c.tag === 'def');
  if (defTag) { const t = unescapeXml(defTag.text).trim(); if (t) return t; }
  // Comps (e.g. tools' surprise-attack lists, HediffComps): li Class="XxxCompProperties_Name" ->
  // identifier "XxxComp_Name" (the runtime class prefix, not the XML Properties class).
  if (li.attrs.Class) { const t = li.attrs.Class.replace(/CompProperties_/, 'Comp_'); if (t) return t; }
  // tools list items (no def/customLabel at all): their own <label>, spaces -> '_'.
  const labelTag = li.children.find((c) => c.tag === 'label');
  if (labelTag) { const t = unescapeXml(labelTag.text).trim(); if (t) return t.replace(/\s+/g, '_'); }
  return null;
}

function resolveListChild(lis, seg) {
  const groups = new Map();
  for (const li of lis) {
    const id = identifierFor(li);
    if (id == null) continue;
    if (!groups.has(id)) groups.set(id, []);
    groups.get(id).push(li);
  }
  if (groups.has(seg) && groups.get(seg).length === 1) return groups.get(seg)[0];
  const m = /^(.*)-(\d+)$/.exec(seg);
  if (m) {
    const arr = groups.get(m[1]);
    if (arr && arr[Number(m[2])]) return arr[Number(m[2])];
  }
  if (groups.has(seg)) return groups.get(seg)[0];
  return null;
}

// ---------- resolve a dotted DefInjected path against the Defs index ----------

function resolveEnglish(defType, allPathsForThisDefType, targetPath, defIndex) {
  const segments = targetPath.split('.');
  const defName = segments[0];
  const byName = defIndex.get(defType);
  const defEl = byName && byName.get(defName);
  if (!defEl) return { ok: false, reason: `def not found locally (defType ${defType}, defName ${defName})` };

  // Fallback for lists whose <li> carry no def/customLabel at all (e.g. PawnKindDef.lifeStages):
  // order of first appearance of each identifier, among this SAME defName's own paths only.
  const orderByPrefix = new Map();
  for (const p of allPathsForThisDefType) {
    if (!p.startsWith(defName + '.')) continue;
    const segs = p.split('.');
    for (let d = 1; d < segs.length; d++) {
      const parentPrefix = segs.slice(0, d).join('.');
      const ident = segs[d];
      if (!orderByPrefix.has(parentPrefix)) orderByPrefix.set(parentPrefix, []);
      const arr = orderByPrefix.get(parentPrefix);
      if (!arr.includes(ident)) arr.push(ident);
    }
  }

  let node = defEl;
  let prefixSoFar = defName;
  for (let d = 1; d < segments.length; d++) {
    const seg = segments[d];
    const directHits = elChildren(node).filter((c) => c.tag === seg);
    if (directHits.length >= 1) { node = directHits[0]; prefixSoFar += '.' + seg; continue; }
    const lis = elChildren(node).filter((c) => c.tag === 'li');
    if (lis.length === 0) return { ok: false, reason: `no child '${seg}' and no <li> list under '${prefixSoFar}'` };
    let picked = resolveListChild(lis, seg);
    if (!picked) {
      // Content-based match failed (li's have no def/customLabel at all, or none matches): fall
      // back to positional order-of-first-appearance among this defName's own DefInjected rows.
      const order = orderByPrefix.get(prefixSoFar) || [];
      const idx = order.indexOf(seg);
      if (idx >= 0 && idx < lis.length) picked = lis[idx];
    }
    if (!picked) return { ok: false, reason: `cannot place list identifier '${seg}' under '${prefixSoFar}' (${lis.length} <li> found, none matched by content or position)` };
    node = picked;
    prefixSoFar += '.' + seg;
  }
  // Leaf: either the node itself has plain text (element leaf), or it's a <li> whose own text is the value.
  const text = unescapeXml(node.text).trim();
  if (text) return { ok: true, value: text };
  return { ok: false, reason: `resolved node under '${prefixSoFar}' has no direct text (nested structure, not a simple leaf)` };
}

// ---------- main ----------

const defIndex = buildDefIndex(rel('Mod/Defs'));

const enKeyed = loadKeyed(rel('Mod/Languages/English/Keyed/AlphaMythology.xml'));
const frKeyed = loadKeyed(rel('Mod/Languages/French/Keyed/AlphaMythology.xml'));
const enKeyedVEF = loadKeyed(rel('Mod/Languages/English/Keyed/VEF.xml'));
const frKeyedVEF = loadKeyed(rel('Mod/Languages/French/Keyed/VEF.xml'));

const defInjectedDirs = fs.readdirSync(rel('Mod/Languages/French/DefInjected'), { withFileTypes: true })
  .filter((d) => d.isDirectory()).map((d) => d.name).sort();

let unresolved = 0;
let out = '';
out += '# French review — Alpha Mythology Renew (unofficial)\n\n';
let revision = 'unknown (git rev-parse failed)';
let dirty = false;
try {
  revision = execFileSync('git', ['rev-parse', '--short', 'HEAD'], { cwd: ROOT, encoding: 'utf8' }).trim();
  dirty = execFileSync('git', ['status', '--porcelain', '--', 'Mod/Languages', 'Mod/Defs'], { cwd: ROOT, encoding: 'utf8' }).trim().length > 0;
} catch { /* leave defaults */ }
out += `Generated by \`Tests/Generate-FrenchReview.cjs\` from revision \`${revision}\`${dirty ? ' (with uncommitted changes under Mod/Languages or Mod/Defs — regenerate after committing)' : ''}.\n\n`;
out += 'No source in another language: this mod has no non-English source text (Sarg Bjornson wrote it in ' +
  'English). **Original = English** for every row below; the "Original" column repeats the English text ' +
  'rather than being left empty, per TRANSLATIONS.md section 3.\n\n';
out += 'Grammar tokens and `{PAWN_gender ? ... : ... : ...}` switches are left verbatim, exactly as shipped. ' +
  'A row this script could not resolve against `Mod/Defs` carries `?` and the reason, in a fifth column.\n\n';

function tableFor(title, rows) {
  let s = `## ${title}\n\n`;
  s += '| Key or path | Original | English | French |\n|---|---|---|---|\n';
  for (const r of rows) {
    const doubt = r.doubt ? ` | ?: ${r.doubt}` : '';
    s += `| \`${r.key}\` | ${r.en} | ${r.en} | ${r.fr}${doubt} |\n`;
  }
  return s + '\n';
}

// --- Keyed ---
{
  const rows = [];
  for (const [k, en] of enKeyed) {
    const fr = frKeyed.has(k) ? frKeyed.get(k) : null;
    rows.push({ key: k, en: en.replace(/\|/g, '\\|'), fr: (fr ?? '**MISSING**').replace(/\|/g, '\\|'), doubt: fr == null ? 'French key missing' : null });
    if (fr == null) unresolved++;
  }
  out += tableFor('Keyed — `Mod/Languages/*/Keyed/AlphaMythology.xml`', rows);
}
{
  const rows = [];
  for (const [k, en] of enKeyedVEF) {
    const fr = frKeyedVEF.has(k) ? frKeyedVEF.get(k) : null;
    rows.push({ key: k, en: en.replace(/\|/g, '\\|'), fr: (fr ?? '**MISSING**').replace(/\|/g, '\\|'), doubt: fr == null ? 'French key missing' : null });
    if (fr == null) unresolved++;
  }
  out += tableFor('Keyed — `Mod/Languages/*/Keyed/VEF.xml` (this mod\'s own override of a shared VEF key)', rows);
}

// --- DefInjected, one table per def type ---
for (const defType of defInjectedDirs) {
  const file = rel('Mod/Languages/French/DefInjected', defType, 'AlphaMythology.xml');
  const ordered = loadDefInjectedOrdered(file);
  const allPaths = ordered.map(([p]) => p);
  const rows = [];
  for (const [p, fr] of ordered) {
    const res = resolveEnglish(defType, allPaths, p, defIndex);
    if (res.ok) {
      rows.push({ key: p, en: res.value.replace(/\|/g, '\\|'), fr: fr.replace(/\|/g, '\\|') });
    } else {
      unresolved++;
      rows.push({ key: p, en: '**(unresolved)**', fr: fr.replace(/\|/g, '\\|'), doubt: res.reason });
    }
  }
  out += tableFor(`DefInjected — \`${defType}\``, rows);
}

out += `---\n\n${unresolved} row(s) with an unresolved or missing English value (see \`?\` column above).\n`;

fs.writeFileSync(rel('FRENCH_REVIEW.md'), out);
console.log(`wrote FRENCH_REVIEW.md, ${unresolved} unresolved row(s)`);
