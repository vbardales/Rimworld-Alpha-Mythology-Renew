---
localization: complete
translation_en: complete
translation_fr: complete
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythology
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
visibility: public
local_path: C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew
git_root: C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew
git_isolation: standalone; removed from parent index and ignored there
remote: origin https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
maintainer: Codex task dedicated to AlphaMythologyRenew; maintain this STATUS.md as work progresses
stage: preTest
workflow_stage: preTest
settings_audit: complete
audit_at: 2026-10-01
audit_revision: bedc666 (French text as of 990f571; Preview files modified by another session, uncommitted)
automated_tests: passed; static contracts (339 assertions, 7 negative cases) and 13 settings-rule unit tests
xml_tests: passed
functional_tests: unverified; not run in game
licence: silent
licence_at: 2026-09-12; upstream master 53a5518008821188009bbf996b7120ad9593cb5f and Workshop description reviewed; no project redistribution grant found
upstream_mod_remotes:
  - https://github.com/juanosarg/AlphaMythology
showcase: directly inspected; committed Preview 896 x 504 (564630 bytes), ModIcon 128 x 128 (21666 bytes)
remaining:
  - unverified (in game, belongs to done -> tested): settings window, both routes (Mod options and hidden MainButtons via RIMMSQOL), real effect on wild spawns, persistence after restart and reload, EN and FR layout
  - unverified: English and French in-game translation acceptance, including optional integrations and wisp inspection/gizmos
  - unverified (in game): the wisp inspection text with the new plural keys, English and French; `Tests/Check-Translations.py` not run (no Python here)
  - unverified (in game): the three animal-mod patches written 2026-10-01 (`AnimalProsthetics2Patch.xml`, `DogsMatePatch.xml`, `BetterCrossbreedingPatch.xml`): applied to stand-in definitions by the unit tests only; no Pickle pass mounts ADS 2, Dogs mate or Better Crossbreeding yet, and no scenario asserts the surgery list, the group or the cross
  - unverified (reds with no green replay on disk; cause not re-established by this audit, the STATUS history calls some of them suite defects): the 2026-09-26 full run failed hydra, stymphalian, wisp ranged attacks, salamander egg, chimera milk, the 25-creature spawn check and the wild draw scenario; only the phoenix ones were replayed. Baseline EN/FR not re-run on the current revision
  - unverified: manual gameplay and save migration
  - unverified: optional legacy integrations with their providers
  - publication: 0.1.0 pre-publication (creates the private item and its About/PublishedFileId.txt) NOT yet sent; no Workshop item exists
  - parent: removal is staged in parent index; parent ignore edit is uncommitted alongside unrelated user work
updated: 2026-09-26
---

This task manages this standalone mod repository and keeps this status current.
The folder has its own .git and origin. The parent monorepo no longer tracks its
files in the index and ignores /AlphaMythologyRenew/. Existing parent history is
preserved. Parent changes have not been committed together with unrelated work.
The initial standalone snapshot includes the local working files, with provenance
from parent commit 4d30c6822034b6822124449ca1f170188d7f3e53; no unrelated monorepo
history is imported. Build intermediates remain inside the ignored local .build/.

## Title and description

Keep Alpha Mythology Renew (unofficial): Renew denotes the port and (unofficial)
matches the current disclosure. No additional suffix is needed.
Mod/About/About.xml links the original source and ends with a separate
Source code on GitHub link to this public port repository.
Publication policy confirmed by the user: silent = public. GitHub visibility
was changed to public and verified on 2026-09-12; licence classification stays silent.

## TODO — définir et justifier le statut `silent`

Checklist à reprendre à chaque nouvel audit. Une case cochée signifie que la
vérification a été faite, pas qu'une autorisation a été obtenue. Si une source
nécessaire n'a pas été examinée, indiquer cette limite et garder la conclusion
provisoire. Ne jamais déduire `silent` du seul champ GitHub `license: null`.

- [x] Identifier le mod original, son auteur, son dépôt et son item Workshop.
- [x] Dater l'audit et enregistrer le commit exact du dépôt original examiné.
- [x] Examiner l'arborescence complète : LICENSE/LICENCE, COPYING, README,
  About.xml, mentions dans les sources et documents de redistribution.
- [x] Distinguer les licences du mod de celles des dépendances et contenus tiers.
- [x] Lire la description Workshop et ses mentions de droits ou de réutilisation.
- [x] Récupérer toutes les pages de commentaires accessibles, vérifier le total
  et les doublons : 602/602 commentaires uniques lors de cet audit.
- [x] Rechercher les déclarations sur les permissions, portages, republications,
  réutilisations, refus et retraits ; identifier l'auteur et lire le contexte.
- [x] Examiner les discussions du mod : fil Bug Reports, 30/30 réponses.
- [x] Consigner les déclarations pertinentes avec date, lien direct et portée :
  la réponse du 21 août 2022 concerne une retexture, pas explicitement ce port complet.
- [x] Distinguer une licence, une permission limitée, un refus explicite et
  l'absence de déclaration trouvée. Un projet de refonte ou le refus de répondre
  aux demandes de mise à jour ne suffit pas à établir un refus de redistribution.
- [x] Consigner les limites : commentaires supprimés/privés et accords privés
  inconnus ; l'audit du dépôt porte sur le snapshot indiqué, pas tout son historique.
- [x] Reporter les preuves et la conclusion dans STATUS.md ; garder LICENSE et
  Mod/LICENSE comme notices tant qu'aucune licence applicable n'est identifiée.
- [x] Appliquer la règle de visibilité de l'utilisateur : **`silent` = public**.
  Conserver la mention `(unofficial)` et le lien vers le dépôt du port.
- [ ] Lors du prochain audit ou avant publication Workshop, actualiser les sources
  et les commentaires ; examiner toute politique générale de l'auteur ou autre
  déclaration applicable nouvellement signalée, puis réévaluer la classification.

Critère de décision : retenir `silent` lorsque les sources examinées ne donnent
ni licence/autorisation explicite applicable à la redistribution du port complet,
ni interdiction explicite applicable. Ce constat reste limité aux sources et à la
date documentées. Une permission ambiguë ou limitée doit être signalée, jamais
transformée en autorisation générale. Une nouvelle preuve peut changer le statut.

## Licence verification — 2026-09-12

Sources: https://github.com/juanosarg/AlphaMythology/tree/53a5518008821188009bbf996b7120ad9593cb5f
and https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793 .
The complete upstream default-branch tree (not truncated), About/About.xml,
project and source text were checked. GitHub reports license: null. No project
LICENSE/COPYING or redistribution grant was found. The only LICENSE is in the
bundled Lib.Harmony.2.3.1.1 package and applies to that dependency, not this mod.
The reviewed Workshop description contains credits but no project licence grant.
Thus silent means no explicit project licence found in these reviewed sources;
it is not a licence or permission, nor proof about private author agreements.
LICENSE and Mod/LICENSE remain identical disclosure notices, not an MIT grant.
Third-party sound attribution is preserved in ATTRIBUTION.md. Remake timing is
not used to infer licensing or permission.

### Workshop comments audit — 2026-09-12

Retrieved all 602 currently exposed main-page comments in seven batches: 602
unique comment IDs, including 163 comments attributed to Sarg Bjornson. Searched
the corpus for redistribution, reuse and permission statements and reviewed author
responses and relevant conversational context. Also reviewed the Bug Reports
thread's 30 replies across both pages. Deleted/private comments are outside scope.

One relevant statement was found: on 21 August 2022, Sarg responded to a request
to make a retexture with permission conditional on the game's EULA and a refusal
to endorse it. This is not silence about all derivative work; its context is a
retexture, not an explicit licence for republishing the complete mod as this port.
Response: https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793#c3428948355375415583
Question: https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793#c3428948355374816701
No explicit full-mod redistribution grant or prohibition was found in the reviewed
comments. Classification stays silent for this port, with this qualification;
visibility remains public under the user's rule.

The author's July 2026 statement concerns a future remake and removal of comments
asking for 1.6 updates; it is not classified as a redistribution prohibition.
Bug Reports supplies historical reproduction cases, not an automated test suite:
https://steamcommunity.com/workshop/filedetails/discussion/1821617793/3130541756142153070/
Local raw audit files are kept under ignored .build/workshop-audit/.

## Validation

Readiness recheck on 2026-09-12: the C# source and shipped DLL are present and
tracked. All three custom classes are referenced by the intended XML definitions;
the phoenix egg and bleeding damage defs used by the code exist. XML checks and
Release compilation were rerun successfully and the shipped DLL rebuilt.
Stage is preTest; this workflow label is independent of in-game testing. No gameplay execution has been validated.

- Local Check-Mod.ps1: PASS, 63 XML files, 25 creatures, unique defs, race references,
  XPath syntax, isolated namespace and publication notices.
- Release compilation: PASS, .NET SDK 8.0.424, zero warnings and zero errors.
- Upstream snapshot: no automated test suite, test project or CI workflow found;
  description mentions playtesting without a reproducible protocol. See TESTING.md.
- Twelve functional scenario groups in Tests/FUNCTIONAL.md remain NOT RUN, including save migration.
- Earlier local audit recorded 129 named defs and four parents resolving with VEF,
  no unknown fields, and 65 type names examined. These checks were not rerun in
  this repository-separation audit; ten optional legacy types still require providers.
- GitHub CI: PASS for initial code commit 37c56e1eab9ae8968e46d6cd43b75090c209f380,
  XML checks and compilation on Ubuntu, run
  https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew/actions/runs/34714005350 .
- Initial snapshot pushed to origin/main and remote SHA verified against local HEAD.

Three ported classes use AlphaMythologyRenew rather than Bastyon to avoid collisions.
All 25 original PawnKindDef names are preserved. No Workshop upload is claimed.

## Preview — 2026-09-12

Generated with built-in image_gen following ../STYLE_RIMWORLD.md. Source: Art/Preview-source.png; prompt: Art/PROMPT_ALPHA_MYTHOLOGY.md; reproducible text composition: Art/render-preview.cjs. Installed Mod/About/Preview.png: 896 x 504, 560866 bytes. Visual QA completed; minimum sampled text contrast 4.76:1. Griffin and Cerberus enclosure; English title and summary, unofficial label. Existing icon deletion left untouched.


Typography corrected to Segoe UI for title and supporting text, matching MoreStorylikeTraits and SoftWarmPrimitiveBedsRenew engraving templates. Re-rendered and visually checked.

## Test suite expansion — 2026-09-12

Tests/FUNCTIONAL.md now defines 12 functional scenario groups with reproducible
steps, expected outcomes and a result template; all remain NOT RUN.
Tests/Check-Mod.ps1 passes 302 static assertions covering metadata, definition
links, hatchers, custom worker bindings, phoenix egg fire resistance, notices,
PNG signatures and assembly packaging. Tests/Test-Validator.ps1 passes six negative
cases in an isolated temporary copy. CI runs both scripts and compilation.
These results do not establish runtime gameplay correctness. This does not determine the preTest workflow stage.

## TODO verification — 2026-09-12

- [x] Cross-check the completed silent checklist against the recorded source and
  Workshop audit evidence: 602 archived comments with 602 unique IDs; the earlier
  two-page Bug Reports audit covers 30 replies. No full comment re-read in this check.
- [x] Verify upstream master still resolves to the audited commit
  53a5518008821188009bbf996b7120ad9593cb5f and GitHub visibility remains PUBLIC.
- [x] Verify LICENSE and ATTRIBUTION copies match the versions shipped in Mod/.
- [x] Rerun static tests: 302 assertions PASS.
- [x] Confirm expanded-suite CI success for b86e4dcdcbaebc08c3adb8c2029d7214279f5d20:
  https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew/actions/runs/34715873368
- [x] Verify standalone Git isolation: parent index contains no mod files and the
  folder is ignored; 317 removals remain staged against the parent HEAD.
- [x] Correct stale icon-absence and nine-scenario statements. Local Preview is
  896 x 504 (560866 bytes); local ModIcon is 1254 x 1254 (1241845 bytes).
- [ ] Execute the 12 functional scenario groups and attach results/logs.
- [ ] Verify supported optional integrations and migration separately.
- [x] Commit and push preview artwork, overlay, metadata and icon sources: 97a3091 and cae4b3b on origin/main.
- [x] Optimize the shipped ModIcon to 128 x 128 (21666 bytes) and visually check at 128 px and 32 px on 2026-09-13.
- [ ] Commit the separation on the parent side without including unrelated work.
- [ ] Refresh the licence/comment audit before Workshop publication; this remains
  an open future checkpoint, not a failed check or a claim of author permission.

The Preview section above records the earlier artwork session; its statement
about an absent/deleted icon is superseded by the current file check here.

## Preview overlay recomposition — 2026-09-12

Current source: `Art/Preview.png`, copied unchanged from the existing text-free `Art/Preview-source.png`, which remains preserved. No replacement illustration was generated and no old source was overwritten. Final overlay: `Mod/About/Preview.png`. Existing title and summary retained; the actual unofficial status appears as `(unofficial)` on its dedicated line. Version 1.6 is read from the delivered About.xml supportedVersions.

Palette reference: `Art/preview-palette.json` only. The veil follows the extensive slate paving. The secondary ink is a light, still chromatic blue from that dominant stone family, rather than a pixel average. The vivid accent follows the warm orange-gold illumination on the griffin, strengthened in saturation for the rule and badge. Title and summary share the same primary ink. Palette values are not duplicated here.

Composition and parameters (moved 2026-09-29 to `../scripts/Render-Preview.cjs`, a shared script — this mod's `Art/render-preview.cjs` was one of ~50 near-identical per-mod copies found across the workspace; mod-specific text now lives in `Art/preview-copy.json`, the palette stays in `Art/preview-palette.json`), generating `Art/Preview-layout.html` from those two JSON files at 896 x 504. Actual Chrome platform fonts verified after document.fonts.ready: Segoe UI Semibold (title), Segoe UI regular (tag and summary), Segoe UI Bold (badge); no fallback. Layout uses the prescribed offsets, metrics, shadow and triangle coordinates.

Verification: `Art/verify-preview.py`; detailed results and actual font records in `Art/Preview-qa.json`; text-free rendered background in `Art/Preview-background-qa.png`; thumbnail in `Art/Preview-thumbnail-qa.png`. Minimum contrast across entire text bounding rectangles against the real rendered background: title 6.110:1, tag 4.682:1, summary 5.412:1; badge digits against its opaque accent 8.863:1. Visually checked at 896 x 504 and 268 pixels wide: title and version identifiable, rule visible, no clipping or overlap. Final PNG: 565367 bytes, below 900 KB. Nothing published. This recomposition supersedes the earlier overlay measurements above.

## ModIcon corner badge, Preview render pipeline generalized to `../scripts/`, tests added — 2026-09-29

A second corner badge (the trimmed, background-removed `Mod/About/ModIcon.png`, `Art/ModIcon-badge.png`) now
composites onto `Mod/About/Preview.png` next to the existing "1.6" triangle, on her direction, to reuse
across mods. What moved out of this mod's `Art/` into the shared `../scripts/`, all on her go:
- `Render-Preview.cjs` (mod-specific text externalized to `Art/preview-copy.json`; palette unchanged in
  `Art/preview-palette.json`). Refactored into pure functions (`parseArgs`, `pickHighestVersion`,
  `resolveIconBadgeCorner`, `escapeHtml`, `buildHtml`) plus a `render()` doing the Chrome/Playwright work;
  covered by `../scripts/Render-Preview.test.cjs` (`node:test`, built into Node 24, no new dependency):
  15 assertions, 0 failed.
- `Make-PreviewBadge.ps1` (the icon-detour/trim/composite tool) and its pure functions, split further into
  `PreviewBadgeLib.ps1` (`Remove-BorderBackground`, `Get-TrimmedByAlpha`, `Get-BadgeGeometry`) so
  `../scripts/Test-PreviewBadgeLib.ps1` can dot-source just the library, against synthetic in-memory
  bitmaps, no mod files touched: 14 assertions, 0 failed (plain PowerShell, matching
  `Tests/Test-Validator.ps1`'s style; this workspace's Pester is 3.4.0, not used here).

Re-rendered against the moved/refactored scripts after each step: `Mod/About/Preview.png` byte-identical
to before (592971 bytes, same per-element contrast ratios); `Art/ModIcon-badge.png` byte-identical
(`cmp`) to a fresh `-SaveTrimmedIconTo` run. Icon-badge corner is parameterized (`bottom-left` default,
`bottom-right`, `top-left`); checked by eye, not by an automated bounds/overlap test: `bottom-left` (kept)
and `bottom-right` both clear the scene and the "1.6" badge, `top-left` overlaps `.copy`'s title text at
this layout's `left:50px;top:54px` and is not usable as-is here. This mod's own copies of both scripts and
`Art/ModIcon-transparent.png`/`Art/ModIcon-trimmed.png` scratch files are gone; nothing under `Art/` or
`Mod/About/` in this repo references the deleted local copies.

## Preview title hierarchy update — 2026-09-12

Applied the revised STYLE_RIMWORLD.md title hierarchy in `Art/render-preview.cjs` and regenerated `Art/Preview-layout.html` and `Mod/About/Preview.png`. Alpha Mythology retains the 46 px primary ink; Renew is a direct title span at 0.65em (29.9 px), weight 600, using the secondary ink. Existing name, summary and separate unofficial tag preserved. `Art/Preview.png` remains the unchanged text-free illustration; `Art/Preview-source.png` is preserved, with no illustration replacement.

The single palette reference remains `Art/preview-palette.json`: blue slate paving supplies the veil and the light blue secondary family; the orange-gold illuminated griffin supplies the saturated accent. Warm orange contrasts distinctly with the dominant cool blue rather than repeating it. No palette change was necessary.

Verified actual platform fonts after document.fonts.ready: Segoe UI Semibold for both title spans, Segoe UI regular for tag and summary, Segoe UI Bold for badge; no fallback. `Art/verify-preview.py` now checks the reduced suffix separately. `Art/Preview-qa.json` records minimum real-background contrasts: main title 7.752:1, suffix 7.319:1, tag 4.682:1, summary 5.412:1, badge 8.863:1. Final image visually checked at 896 x 504 and in `Art/Preview-thumbnail-qa.png` at 268 px wide: reduced Renew remains readable, title and version identifiable, rule visible, no clipping or overlaps. Version 1.6 re-read from delivered About.xml. PNG size 564630 bytes. Nothing published. These results supersede previous overlay measurements.

## Current delivery status — 2026-09-12

Preview and metadata changes were committed and pushed in 97a3091; the icon and its source artwork followed in cae4b3b. Local HEAD and origin/main both resolve to cae4b3b27df3dab07ad5a3ce2150cce330da8ec7 at this check. The working tree was clean before this STATUS update. The delivered preview is 896 x 504, 564630 bytes; the icon remains 1241845 bytes and still requires the optimization recorded above.

Stage remains preTest. No additional gameplay, save migration, optional integration, parent-repository or licence audit checks were performed in this documentation update. Their pending items remain open; historical measurements above describe earlier revisions. No Workshop publication was performed.

## Icon optimization and stage clarification — 2026-09-13

Optimized Mod/About/ModIcon.png from 1254 x 1254 / 1241845 bytes to 128 x 128 / 21666 bytes (98.26% smaller). Resampled with Pillow Lanczos and saved as an optimized RGB PNG. The identical full-resolution original remains in Art/Icons/queue-alpha-mythology.png, verified by SHA-256 before resizing. Visually checked at native 128 px and at 32 px (Art/Icons/ModIcon-32-qa.png): face, wink, wings and tail remain identifiable with no clipping. This completes the icon optimization item; earlier icon dimensions and pending notes are historical.

User clarification: preTest is not tied to in-game tests. The stage is retained without inventing a new transition criterion. Gameplay, save migration and optional integration checks remain separately documented as unverified; they do not define this stage. Icon optimization and this STATUS update are local changes, not committed or pushed in this operation.

## Translation audit — 2026-09-13

Applied the new translation gate from the parent PUBLISHING.md and TRANSLATIONS.md
to local work based on ad6dc835c81e90735f9873d9db963d5a6147b8ef. Detailed inventory,
scope, dependency checks, commands and runtime acceptance cases are in
`Tests/TRANSLATIONS.md` and `Tests/TranslationInventory.json`.

All owned text mechanisms and English/French resources pass the static audit:
591 inventoried Def/patch fields, 590 French injections and 49 bilingual Keyed
pairs. The remaining inventoried field is the wisp's inspection prefix, replaced
as part of a fully parameterized sentence by a postfix scoped to MM_WillOWisp.
Missing egg-command and animal-role keys were restored; two English role tooltips
were absent upstream. Qilin and salamander role/tooltip mismatches were corrected.
The wisp birth message is now explicitly keyed, and its developer command is
localized. Six shared VEF keys supplement its English-only installed resources.

The shared DefInjected checker passes 590 paths, 0 errors, with VEF, MVCF and
Achievements assemblies and explicit provider targets; no path remained
unverified. Its unsupported AddModExtension operations were inspected directly
and add no owned prose. Achievement translations load only with their provider.
The translation coverage test and four negative cases pass. Existing checks pass
321 assertions and six negative cases. Release build passes with zero warnings
and errors; the shipped DLL is rebuilt. CI includes translation validation, but
these local edits have not been pushed or checked by a new remote CI run.

`localization`, `translation_en` and `translation_fr` are complete for this
inventory/resource gate. Historical stage preTest is retained. Neither language
has been tested in game; display, generated grammar, the new Harmony postfixes
and optional integration behavior remain unverified in `remaining`. Reset the
affected fields to unchecked after subsequent text/UI/Def/patch/resource changes
until revalidation. No Workshop publication or gameplay test was performed.

## Workflow audit — 2026-09-13

This section supersedes historical readiness conclusions, not historical results.
The user's supplied nine-transition workflow takes precedence over the parent
PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md, all read for
this audit. Stage names are literal workflow labels: `preOptions` means the
Preview, palette, English description and naming gate has passed; `options`
requires the settings audit. Gameplay is required only for `tested`.

Scope: standalone repository `C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew`,
distributed directory `Mod/`. The audit started at ad6dc835c81e90735f9873d9db963d5a6147b8ef
with 35 staged changed/added files. During read-only checks HEAD advanced to
9634a431ad553bc7bcd4c36ce693256af39d86e9, containing that translation work; the worktree
then became clean. This audit did not commit, stage, push or discard those changes.
The final revision above is the audited delivery. Only STATUS.md is edited by this
audit; isolated build outputs are under ignored `.build/audit-20260913/`.

| Transition | Result | Evidence / remaining criterion |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated | Own .git and Git root, configured GitHub origin; live `gh repo view` reports PUBLIC and `git ls-remote origin HEAD` returns the audited revision. README, ATTRIBUTION, CHANGELOG and licensing notices exist; distributed notice copies match. Names consistently identify the continuation without requiring literal folder/repository/package identity. |
| horsMonoRepo -> ModIcon generated | Validated for delivered implementation scope | Release build succeeds; shipped DLL reproduced byte-for-byte as explained below. PNG directly inspected, 128 x 128, 21666 bytes. Settings are assessed at their dedicated gate below. |
| ModIcon generated -> Preview generated | Validated | Direct inspection and Pillow decoding: PNG, 896 x 504, 564630 bytes, below 1 MB. High overhead view, tiled ground and legible subjects; no concrete camera defect found. |
| Preview generated -> preOptions | Validated | English About description and preview, Renew reduced and blue, separate unofficial tag; blue secondary #BEDFFF and orange accent #F5A126 visibly distinct. No connecting word needs reduction in this title. |
| preOptions -> options | Not verified | No owned settings page or shortcut. The relevance of historical spawn controls to the current port remains to be established; their omission is not a confirmed defect. settings_audit remains partial pending that assessment, not gameplay tests. |
| options -> l10n | Independent resource validation retained | 591 inventoried fields, 590 French injection paths, 49 bilingual Keyed pairs pass current checks. English Def source is valid native coverage. Future settings text must be audited when introduced. |
| l10n -> preTest | Partial independent verification | Required Harmony and VEF IDs/loadAfter match usage; VEF supplies MVCF. Achievements name gate matches the installed provider and its conditional language folder uses its package ID. Legacy optional providers' full type/reference/version compatibility is still unverified, not a confirmed defect. |
| preTest -> done | Independent test artifacts validated | Written F01-F12 preconditions/actions/expectations and bilingual acceptance cases; executable static XML and translation suites pass with negative cases. These are packaging/definition/resource tests, not C# gameplay execution. Global done remains unavailable because earlier gates are unresolved. |
| done -> tested | Not verified | No gameplay executed, no current Player.log review or bilingual UI interaction. New game, existing save, persistence, migration and provider matrix remain NOT RUN. No RIMMSQOL or other customization integration was tested. |

Licensing: retain the documented `silent` classification and public/unofficial
policy; this is not a permission grant. The archived corpus was directly counted:
602 comments, 602 unique IDs; the cited 2022 author response is present and its
retexture context remains qualified in the earlier audit. LICENSE grants no rights
to upstream content and the shipped copies match. The historical 2026-09-12
source-rights audit is retained, not represented as a fresh full online rights
investigation. No new contrary evidence was established here; refresh before
Workshop publication remains a separate checkpoint.

### Settings audit

Reviewed both owned C# files, all shipped Defs/patches and the upstream 1.5 DLL
archived under `.build/upstream-audit/`. The port contains no Verse.Mod subclass,
ModSettings implementation, SettingsCategory/DoSettingsWindowContents entry or
MainButtonDef. This proves absence of an empty page and shortcut, but alone does
not establish that no useful settings exist.

Candidate player use to assess: control wild appearances of the 25 added creatures,
including excluding an unwanted species without editing XML. The archived original
`MagicalMenagerie_Settings` exposes per-creature pawnSpawnStates and a commonality
multiplier (default 1, UI range 0.1-5, reset and Scribe persistence). Its
`AlphaMythology_BiomeDef_CommonalityOfAnimal_Patch` actually multiplies MM_ animal
commonality. The delivered port has fixed wildBiomes values and omits that settings
implementation; README only says the window was not carried over from Animal Ark.
That records a scope difference but does not settle whether configuration is needed
in this port. The original audit overstated this as a confirmed need and defect.
Historical settings alone do not require restoration. The absence of a page and
shortcut is established; whether that absence violates the access contract remains
unverified until the relevance assessment is complete. No implementation defect
or failed runtime test is established by these observations.

Inherited settings were also inspected in the installed VEF 1.6 assembly:
AnimalBehaviours_Settings exposes global asexual-reproduction, exploding-egg,
regeneration and other flags with default true and Scribe persistence. The port's
wisp postfix reads flagAsexualReproduction. These provider-wide controls are not
owned per-creature spawn controls. No request to duplicate all VEF controls or
expose combat constants is implied. Egg destroy/cancel and ranged-attack commands
are gameplay actions, not a substitute for the mod configuration page.

Next gate: resolve the omitted spawn controls with a documented relevance decision.
For retained useful settings, provide the mod-options entry and the same-settings
MainButtons shortcut hidden by default, then execute applicable defaults, bounds,
effect/application and serialization tests. A reasoned exclusion may support
not_applicable only if the full inventory establishes no relevant owned settings;
the already verified absence of page/shortcut then suffices under the user's rule.
No feature was created in this audit. Interactive FR/EN and RIMMSQOL checks belong
to the final gameplay gate, not this transition.

### Checks executed against the delivery

- `pwsh -NoProfile -File Tests/Check-Mod.ps1`: PASS, 321 assertions, 82 XML files,
  25 creatures; includes matching LICENSE/ATTRIBUTION copies.
- `pwsh -NoProfile -File Tests/Test-Validator.ps1`: PASS, all six deliberate
  regressions rejected in temporary copies.
- Bundled Python running `Tests/Check-Translations.py --self-test`: PASS,
  591 fields, 590 injections, 49 EN/FR pairs and four negative cases. System
  `python` was absent; the bundled interpreter successfully completed the check.
- `../scripts/Check-DefInjected.ps1 -TransMod <Mod> -Targets <Mod>,<VEF>,<Achievements>
  -ExtraAssemblies <VEF.dll>,<MVCF.dll>,<AchievementsExpanded.dll>`: PASS,
  12502 defs indexed, 590 keys, zero errors and no unresolved-path report. Providers
  are installed Workshop 2023507013 and 2288125657, using their 1.6 assemblies.
  The checker explicitly does not implement PatchOperationAddModExtension; those
  shipped operations were read and add classes/data rather than owned prose.
- `dotnet build Source/AlphaMythologyRenew.csproj -c Release --no-restore --nologo
  -p:OutputPath=../.build/audit-20260913/bin/`: PASS, SDK 8.0.424, zero warnings/errors.
  Sandbox SDK access initially failed; the same build with local SDK access passed.
  Output was isolated to preserve the shipped assembly.
- A second isolated build with
  `-p:SourceRevisionId=ad6dc835c81e90735f9873d9db963d5a6147b8ef` reproduced the shipped
  DLL exactly: SHA-256 `13095401976479427F0307652AFCC34350AD53E939293AD91EDCD6B2B953CA74`.
  The default build differed only because it embeds the newly created commit ID;
  this is not stale implementation code and does not require replacing the DLL.
- Direct PNG inspection and Pillow format/dimension/byte checks were performed.
  No historical generation record or side-by-side gameplay screenshot was required.

Documentation correction after the audit: About.xml now locates README.md and
TESTING.md in the GitHub repository and identifies only ATTRIBUTION.md as included.
This metadata wording change does not affect code, Defs or in-game translations.
The settings finding above was also corrected from a defect to an unverified
relevance assessment; no settings restoration is mandated by this audit. An old
French checklist remains in this STATUS history; it was preserved as requested.
Neither observation invalidates the shipped license/attribution copies, the image
checks or the current English README/CHANGELOG. No optional recommendation is
being treated as a missing gameplay proof.

## Workflow audit — 2026-09-26

Revision audited: 3d88314fbeec0b037a884839f43689de1b4f2a90, working tree clean before this
audit (only STATUS.md, CHANGELOG.md, TESTING.md, .gitignore and docs/PROTOCOLS-READ.md edited by it).
Documents read: see `docs/PROTOCOLS-READ.md`. Session title: `Alpha Mythology Renew (unofficial) / preOptions`.

Result: **preOptions retained** (was preOptions). No transition earlier than `options` regressed;
`options` is still not reached.

- `options` blocked: `settings_audit: partial`. The port has no page and no shortcut (verified in
  sources 2026-09-13), but whether the omitted per-creature spawn controls of the original are wanted is
  still a decision for the owner, not a defect. Nothing was created by this audit.
- `localization`/`translation_*` stay `complete` for the static inventory; per MOD_SETTINGS.md they can
  only be *finalized* once the settings gate is settled, and any new settings text will reopen them.
- `l10n → preTest` and beyond: dependencies (Harmony, VEF) unchanged since 2026-09-13; not re-run here.
- Not rerun this session: Check-Mod, Test-Validator, translation checks, build (no code changed since).

Housekeeping done: `*.dds` and `Tests/Pickle/Evidence/`, `evidence/` added to `.gitignore` (no `.dds`
and no evidence was tracked or present on disk); CHANGELOG now opens with a planned (not yet sent) `## [0.1.0]`
(creation of a publishIdFile) under `## [unreleased]`; TESTING.md states which evidence to keep and the
new `tested` conditions (no `@wip`, every `@requires` pass run, no manual test left).
No Pickle suite exists yet (`Tests/Pickle/` absent): `tested` remains far off; no run was requested.

Upstream: `juanosarg/AlphaMythology` (default branch `master`, last push 2024-10-17, no licence) is a
public git repository; the port is based on its commit 53a5518. Any fix worth returning goes as a PR
there, only with the owner's agreement.

## Settings audit — 2026-09-26

Decision (Virginie, 2026-09-26): port the spawn controls of the original mod. Relevance: a player can
exclude an unwanted creature and scale the wild frequency of all 25 without editing XML.

Inventory and rationale: two options only, nothing cosmetic added.
- Wild spawn frequency multiplier: default 1, range 0.1 to 5 (step 0.05), slider plus restore-defaults
  button. Scope: global (player configuration, not per save). Applies immediately, to new spawns only.
- One switch per creature (25, listed from the mod's own pack, so a creature added later appears by itself):
  unchecked = never spawns in the wild. Default: all allowed. Animals already on the map or tamed stay.
- Mechanism: Harmony postfix on `BiomeDef.CommonalityOfAnimal` (`Source/Settings.cs`); pure rule in
  `Source/SpawnRules.cs`. Persistence: `ModSettings` with Scribe (`spawnMultiplier`, `blockedKinds`), a
  corrupt value is brought back into range on load.
- Access: Mod options -> Alpha Mythology Renew (unofficial), no other mod required. MainButtons shortcut
  `AMR_Settings`, `buttonVisible` false (neither visible nor greyed out, definition kept so RIMMSQOL can
  reveal it), same `Dialog_ModSettings` window.
- Excluded on purpose: the wisp/VEF reproduction flags (provider-wide, not this mod's) and combat constants.
- Text: 5 Keyed keys (`AMR_SettingsCategory`, `AMR_SpawnMultiplier`, `AMR_SpawnMultiplierTip`,
  `AMR_ResetDefaults`, `AMR_AllowedHeader`) in EN and FR; the shortcut label/description are Def fields,
  French through DefInjected (MainButtonDef).

Checks run on this working tree (pwsh 7 and Python from the Codex runtimes, TicketDispatcher's inventory):
- `Tests/Check-Mod.ps1`: PASS, 339 assertions (settings shortcut hidden, worker class, source contract).
- `Tests/Test-Validator.ps1`: PASS, 7 negative cases (new: visible shortcut is rejected).
- `Tests/UnitTests` (`dotnet run`): PASS, 13 checks of the pure rules (defaults, bounds, clamp, NaN, blocked).
- `Tests/Check-Translations.py --self-test`: PASS, 593 fields, 592 French injections, 54 EN/FR Keyed pairs.
- `scripts/Check-DefInjected.ps1` with VEF and MVCF: 592 keys checked, 0 errors. The Achievements paths
  could not be resolved this time (provider 2288125657 not installed here): unverified, unchanged since 2026-09-13.
- `dotnet build` Release: 0 warnings, 0 errors; shipped DLL rebuilt from these sources.

Not verified (in game, so for done -> tested): everything listed in `remaining` above. Reading the code does
not prove the window, the effect on real spawns, or the RIMMSQOL route. No RIMMSQOL or other customization
mod has been tested. No RimWorld was launched.

Stage: `options` (was preOptions). `settings_audit` stays `partial` because the runtime checks of
MOD_SETTINGS.md are pending; AUDIT.md states they do not block `options`. The two documents differ on this
point (MOD_SETTINGS.md would hold `l10n` until `complete`); AUDIT.md prevails as instructed, and Virginie
may want the wording aligned.
`l10n -> preTest` still open: optional legacy providers not verified (unchanged). No Pickle suite written yet.

## Pickle suite written — 2026-09-26

`Tests/Pickle`: 8 features, 16 scenarios, 24 local steps (`Source/Steps.cs`, DLL built into
`Mod/Pickle/Assemblies`), passes declared in `Tests/Pickle/README.md` and `TESTING.md`. Every feature line
naming this mod matches exactly one step (checked by script); the RIMMSQOL steps come from
`PickleTools/RimmsqolSteps`. **None has been played.** The two documents' gate for `preTest`
(AGENTS.md: settings gate `complete` or `not_applicable`) is not met while the settings runtime checks are
pending, so the stage stays `options`. Missing: passes for the optional integrations and for the declared
incompatibility with `sarg.magicalmenagerie`; the wisp, phoenix and legacy patches have no scenario yet.

## Licence refresh and dependency check — 2026-09-26

Licence sources, refreshed (partial, not a full re-read):
- Upstream `juanosarg/AlphaMythology`: default branch `master` still at the audited commit
  `53a5518008821188009bbf996b7120ad9593cb5f` (2024-10-17), `license: null`, no LICENSE/COPYING of the
  project (only the bundled Lib.Harmony one). Classification stays `silent`.
- Workshop page 1821617793, read through a summarizing fetch: 606 comments now against 602 archived on
  2026-09-12, so **4 new comments were not read**; last update shown 2024-10-16; no licence or permission
  statement in the description. The same summary says the page "was removed from Steam Community for violating
  guidelines but remains visible to the creator": **unverified** (a model summary, not the page text) and to be
  looked at by hand before any publication, since it bears on how the port is presented.
- Still open before publication: read the 4 new comments and confirm the page status. Not a defect.

Dependencies, checked in the sources (l10n -> preTest criterion):
- Harmony is a hard dependency: `Source/*.cs` patch with it (`TranslationPatches`, `Settings.cs`).
- VEF (`OskarPotocki.VanillaFactionsExpanded.Core`) is a hard dependency: 25 `VEF.AnimalBehaviours.AnimalStatExtension`
  and several `VEF.*` comps in the Defs; MVCF comes through VEF. `loadAfter` lists both; Workshop ids in
  `About.xml` (2009463077, 2023507013) match the ones staging uses.
- The nine optional patches are `PatchOperationFindMod` by mod name and load only when the provider is
  present; only Achievements has its own `LoadFolders` branch, keyed on `vanillaexpanded.achievements`. None is
  declared as a hard dependency. Whether their target nodes still exist in each provider is unverified.

### Upstream pull requests seen — 2026-09-26

`juanosarg/AlphaMythology` has two open pull requests by third parties, neither merged, and the author has not
answered them in the repository: #3 "Updated to 1.6" (Zaljerem, 2025-12-03, 73 files, 12423 additions, GiddyUp
patch commented out) and #2 "fix giddy up patch not being up to date with giddy-up 2" (dav9670, 2025-03-16,
1 file, targets Workshop 3246108162). Consequences, none acted on:
- Someone else has a 1.6 update of the original in the open; a PR of ours would duplicate #3. Comparing our
  1.6 changes against it is possible, and any comment or PR there is public: only with Virginie's agreement.
- Our `GiddyUpPatch.xml` could be compared with #2 (giddy-up 2), which would also inform the GiddyUp optional pass.

### Original Workshop page status — 2026-09-26

Virginie opened page 1821617793: it works, and she is subscribed. This contradicts the summarizing fetch's
"removed from Steam Community" remark, which is dropped as unfounded. Not checked: how the page looks logged
out (a subscriber may see an item others cannot); the 4 new comments (606 against 602) remain unread.

### Workshop comments read — 2026-09-26 (Claude in Chrome, page 1 of 13, newest first)

The 4 comments added since the 2026-09-12 archive are all of 22 September 2026, in one exchange: a user asking
for news after "almost a month", the author (Sarg Bjornson) answering "Yep" to it, and two more from users. On
30 August the author had answered "No news. It will take a long time" to a user asking for an updated version
"floating around". Also re-read on the same page: the author's 15 July 2026 statement (a future remake that
depends on other mods being released, and comments about 1.6 updates removed from now on). None of them grants
or forbids reuse: nothing changes the `silent` classification. The 602 previous comments were not re-read.
The remake announcement is context for this port (a supersession risk), not a licence fact.

## PUBLICATION.md drafted — 2026-09-26

`PUBLICATION.md` written (dependencies and DLC with their evidence, adult-content answer, description tail,
Steam change notes for 0.1.0 and 1.0.0, thank-you plan against `../WORKSHOP_COMMENTS.md`). Not final: gallery order
and images do not exist yet, the 25 creature textures were not all opened for the adult-content boxes, the Workshop
ids of the eight optional providers are unresolved, and whether to comment on the original's page is Virginie's
decision. Nothing was posted or sent.

## Optional providers located, gallery drafted, upstream linked — 2026-09-26

Providers, found with `scripts/Search-Workshop.sh -i About.xml` over the Workshop cache (8990 folders, only
`<name>` matched, so a renamed or differently spelled page would be missed: an absence is not proof):
- Found installed: A RimWorld of Magic (1201382956), Vanilla Cooking Expanded (2134308519; its Stews, Sushi and
  Canned Meals add-ons are separate pages), [XND] Nocturnal Animals (Continued) (2269731409), Vanilla Genetics
  Expanded (2801160906).
- Not found installed: Vanilla Achievements Expanded (id 2288125657 known from the earlier audit), Advanced Biomes
  (Continued), Giddy-up, Lord of the Rims - Elves (Continued), Nature's Pretty Sweet. Their ids and packageIds still
  have to be resolved before their passes and thanks lines can be written.
- So a pass could be written now for the four installed ones; the others need the mod installed or a page read.

Gallery: `docs/gallery-draft/` holds a Pickle feature (5 scenes), its steps (compiled against the 1.6 reference
assemblies, never played) and the studio pass map. It goes into `Tests/Pickle` only after the first run is done.

Upstream link: the local repository had only `origin`. A fetch-only remote `upstream`
(`https://github.com/juanosarg/AlphaMythology.git`, push URL set to `DISABLED`) was added and `master` fetched
shallowly (53a5518, the audited commit). The port's GitHub repository is not a fork of it (`isFork: false`), so a
pull request to the original would first need a fork: a public action, only with Virginie's agreement.

## Optional integrations checked, assets opened — 2026-09-26

Static check of the optional patches against the providers installed on this machine (read-only, nothing run):
- Ids resolved (Workshop search in Chrome for the ones not installed): A RimWorld of Magic 1201382956
  (`Torann.ARimworldOfMagic`), [XND] Nocturnal Animals (Continued) 2269731409 (`Mlie.XNDNocturnalAnimals`), Vanilla
  Cooking Expanded 2134308519 (`VanillaExpanded.VCookE`), Vanilla Genetics Expanded 2801160906
  (`VanillaExpanded.VGeneticsE`), Advanced Biomes (Continued) 3541022508 (`Mlie.AdvancedBiomes`), Nature's Pretty
  Sweet (Continued) 3542949511 (`Mlie.NaturesPrettySweet`), Lord of the Rims - Elves (Continued) 3548255064
  (`zal.lotrelves`), Giddy-Up 2 - Continued 3674332861 (`MemeGoddess.GiddyUp`). Vanilla Achievements Expanded
  2288125657 is not installed here. Alpha Biomes (1841354677) is installed but no patch targets it.
- Targets that exist: `RawMagicyte` in A RimWorld of Magic's v1.6 folder; `NocturnalAnimals.ExtendedRaceProperties` and
  `bodyClock` in the Continued DLL (1.6 folder present); `HediffCompProperties_WhileHavingThoughts` and `Thought_Hediff` in
  VEF 1.6; `GR_ExtractGenesFeline` in Vanilla Genetics Expanded (seen in its 1.4 folder, not confirmed for 1.6);
  `TKKN_Oasis` in Nature's Pretty Sweet (Continued) 1.6. Not opened: Advanced Biomes' and the Elves' biome nodes.
- **Suspected defect, not confirmed in game:** `NatureIsPrettySweetPatch.xml` is guarded by the name "Nature's Pretty
  Sweet" while the installed page is named "Nature's Pretty Sweet (Continued)". `PatchOperationFindMod` compares names
  (the Nocturnal patch's own comment says so and lists both spellings), so this patch would not apply. To be shown by
  scenario 10 (`docs/optional-passes-draft/`) and fixed in the patch, in `Mod/`, after the first run.
- The Giddy-Up patch is already rewritten for Giddy-Up 2 - Continued (guard on a def, new type names), so it is more
  current than upstream PR #2, which targets "Giddy-Up 2 Forked" (page 3246108162, titled OUTDATED). The patch's own
  comment says it was never seen in game.

Drafts, not in the tree: `docs/optional-passes-draft/` (two pass maps, one feature of 8 scenarios: every one asserts only
that the patch reached its target; the NPS one is expected to fail).

Assets opened: `Preview.png` and all 210 PNG textures of `Mod/Textures` as contact sheets, for the adult-content boxes
(see `PUBLICATION.md`): no nudity or sexual content, cartoon-scale violence only. Texts were not grepped for strong
language. Stray items noted: 4 `MM_Mechataur` textures with no matching creature, and
`MM_FenghuangEgg_a copy.png`, which turns out to be used (folder-loaded egg graphic): see BACKLOG.md.

## Unused textures — 2026-09-26

25 textures are referenced by no Def, patch, Integration file or C# source: 15 information cards, 4 Mechataur, 3
Catoblepas pack overlays, `MM_Firebreath`, `MM_GazeAttack`, and the original mod's logo. Their removal is one commit on
branch `cleanup/unused-textures` (`7fd51c9`, worktree `../AlphaMythologyRenew-cleanup`), **not merged**: `Mod/` is
frozen until the first Pickle run is done. Check-Mod (339) and the translation check pass on the branch. Kept:
`MM_FenghuangEgg_a copy.png`, used through its folder. Tracked in `BACKLOG.md`, which also records the owner's
direction on the patch guards (a library she proposed; not yet understood, no patch changed).

## Stage set to preTest — 2026-09-26, by Virginie's ruling (replaced on 2026-09-30, see the last audit section; kept as history)

Virginie decided that the settings run is not a precondition of `preTest`: `preTest` never asked for the tests to
pass, only for them to be written. Stage `options` -> `preTest`. The conflict between AGENTS.md ("enter preTest only
after both gates pass") and AUDIT.md (no in-game check for `options`, none for `done`) is resolved in favour of
AUDIT.md by her.

What holds, from this audit: dependencies declared and used (Harmony, VEF), optional integrations kept apart
(`PatchOperationFindMod`, one `LoadFolders` branch for Achievements), settings and shortcut in place, translations
complete for the static inventory, tests written (F01-F13, unit, XML, Pickle suite of 16 scenarios).

Carried into `preTest` as open, not as defects: `settings_audit` stays `partial` (window, effect on spawns,
persistence and RIMMSQOL are runtime checks of `done -> tested`); the Nature's Pretty Sweet name guard is suspected
not to apply to the installed "(Continued)" page; the optional integrations have no played scenario; the wisp, the
phoenix death and the legacy patches have no scenario; the first Pickle run (`20260926-111909-647-4d36`) is queued.
`preTest -> done` asks for tests written and offline tests green, which the current tree meets except for what the
items above still add; whether to call it `done` is left for the next audit, once the patch direction is settled.

## Tree changed under the queued run — 2026-09-26

On Virginie's instruction (Mod/ only, Tests/Pickle untouched), one merge commit, `78ee4b0`, brought into the tree what the run
`20260926-111909-647-4d36` will stage: the 25 unreferenced textures removed (`7fd51c9`) and the completed description tail
in `About.xml` (`4516a19`, the "IF I GO QUIET / AI-GENERATED / THANKS" sections of `PUBLICATION.md`, 4077 characters).
The run's label says `149c495`: **the revision it actually tests is `78ee4b0`** (no code, Def, patch or test changed since
149c495; only textures nothing references and the `About.xml` description). Check-Mod (339) and the negative cases pass
on it. The `cleanup/unused-textures` branch and its worktree are removed after the merge.

## Code review, achievements page, register plan — 2026-09-26

`/code-review` (high) of `Source/Settings.cs`, `Source/SpawnRules.cs`, `Tests/Pickle/Source/Steps.cs` and the features
returned three findings, none fixed yet because `Tests/Pickle/Source` is frozen for the queued run: (1) the restart reader
resets the settings in memory only and leaves x3 and a blocked `MM_Griffin` in the Config file, which the passes without a
seed (RIMMSQOL, studio, integrations, Giddy-Up) would load; fix by making the reader write the defaults back or by seeding
every pass; (2) the multiplier reweights a creature's share among wild animals and does not raise how many animals spawn, so
the label and tooltip overpromise; (3) no scenario runs an actual wild-animal draw, only the patched commonality. Vanilla
Achievements Expanded's page was read (authors Sarg Bjornson, Oskar Potocki, Smash Phil); see PUBLICATION.md.

## Suite grown after the first run was staged — 2026-09-26 evening

Run `20260926-111909-647-4d36` is playing the revision **78ee4b0**: read from the WSL staging while it ran, the staged companion
holds the 8 original features and the 18432-byte steps DLL, the mod has the old tooltip and no `Textures/Cards`. It therefore
covers 16 scenarios, not the suite as it now stands. After it, on Virginie's instruction ("we will just relaunch the tickets"),
the suite was extended and the review findings fixed in one commit on top: the restart reader writes the defaults back to
disk; the tooltip says the multiplier changes a creature's share among wild animals, not their number (EN and FR); a new
scenario in `02-settings` runs the game's own wild-animal draw 4000 times (multiplier 5: this mod's creatures appear;
all blocked: none); the gallery (09), integrations (10) and behaviour (11) drafts became features with their steps and pass
maps. The suite is now 11 features, 32 scenarios, 35 local steps (each feature line matched to exactly one step by script;
compiled; never played). Check-Mod (339) and the translation check pass. **The verdict of 4d36 does not cover the new
scenarios**: the minimal English pass must be filed again once 4d36 is done, and the other passes after it.

## First Pickle run read — 2026-09-26

Run `4d36` (minimal English, revision 78ee4b0, `exitReason: failed`): 14 scenarios, 9 passed, 3 failed, 2 skipped. What passed
is the first in-game evidence for this mod: it loads, the settings window opens through Mod options and shows the multiplier,
the restore button and the 25 creatures (capture opened and read), the shortcut is hidden then revealed and opens the same
window, the keys resolve in English, and settings survive a save load. The 3 failures are a suite defect (`ctx.Get` throws
when nothing was stored), fixed in the steps and not replayed; the 2 RIMMSQOL scenarios were skipped by requirement, not
passed. Line in `docs/runs/2026-09-26-78ee4b0-minimal-en.md`; evidence in `Tests/Pickle/Evidence/en/`. `settings_audit`
stays `partial`: the effect on spawns, French, restart and RIMMSQOL are not yet shown.

Requests filed on `bc00f57` (the tree of `Mod/` and `Tests/Pickle/` is frozen again until all four are `RUN_DONE`):
`20260926-215843-264-2401` minimal English (evidence `en2`), `-629-5a25` minimal French (`fr`), `-975-c039` restart pair
(`restart`), `-344-92ec` with RIMMSQOL (`rimmsqol`). Not filed yet: studio (gallery), optional integrations, Giddy-Up,
incompatibility; `Evidence/en` (run 4d36) is deleted once `en2` replaces it.

## Manual scenarios mapped to automation — 2026-09-26

`Tests/FUNCTIONAL.md` now opens with an automation map for F01 to F13 (AUDIT.md: no manual test left to validate for
`tested`). Written this evening, not played: feature 12 (F01, every creature at every life stage draws), 13 (F02 and F03, the
phoenix's eggs, hatching, egg commands in each language), 14 (F04, the recurring wound). F02's radius and egg roll became a
game-free `Source/PhoenixRules.cs` with 6 more unit checks (all pass). The shipped DLL was rebuilt for that refactor (behaviour
unchanged: same radii, same 30% chance of two eggs). The suite is now 14 features, 41 scenarios, 46 steps.
Findings while mapping: **`MM_ShutDownMechanoid` is offered by no race in this mod** (its only user was the Mechataur,
which the port does not ship): F05 cannot be tested and the recipe and `Recipe_ShutDown` are dead content, for the owner to
keep or remove. Proposed not applicable, awaiting the owner: F03's colonist execution, F06, F07 beyond spawning, F08, F09, F12;
F04's save-file persistence stays unverified (no Pickle step writes and reloads a save).
The four requests filed on `bc00f57` (see above) will stage this newer tree when played, since a request carries no SHA.

## F06 to F12 automated — 2026-09-26

On Virginie's instruction (F03's execution is VEF's, VEF being required; F09 and F12 to be done anyway) the remaining
manual scenarios are written as Pickle features 15 (combat: 10 ranged creatures, the tlilcoatl against an organic target, a
shield belt and a mechanoid), 16 (products: 6 egg layers, 2 milkables, the Kitsune's regeneration) and 17 (plants: the two
dead plants cut by a colonist, the kappa asked about a mature crop). They compile and every line matches a step (63 local
steps in all); none has been played and several rest on guesses about game APIs and VEF behaviour (the shield belt's
energy field by reflection, whether the Kitsune's comp heals others, the Tree Chopping Speed half of F12 not staged), so a
first run will settle which are suite defects and which are the port's. `Tests/FUNCTIONAL.md` map updated. The four queued
requests will play the newer suite at their turn.

Correction, same evening: F03's colonist execution is **applicable** (Virginie: VEF is a required dependency, so its designation and
job are always present and can be exercised; my "not applicable" was a misreading of her instruction). Feature 13 gained a
scenario that presses the port's own destroy command, checks that VEF's `VEF_DestroyItems` work giver offers the job, cancels
and checks it is no longer offered, requests again, has a colonist carry the job out and checks the egg is gone and no
phoenix hatched. Written, not played. The suite is 17 features and 70 local steps.

## Egg merge defect found in review and fixed — 2026-09-26

Reviewing the phoenix scenario before it ran showed a defect of the port's death worker: it spared from its own explosion the egg
object it had made, but when that egg merges into a stack already on the tile the object is absorbed and the merged stack is
not spared, so the parent's egg could be lost. `DeathActionWorker_ExplodeAndSpawnEggs` now spares the thing `TryPlaceThing`
reports the egg ended up in (`out lastResultingThing`); the shipped DLL is rebuilt, and feature 13's crowded-tile scenario now
asserts that the phoenix's own egg survives (whether the egg already there survives is reported, not asserted: it is not the
parent's to protect). Not played. A search for other orphaned defs (157 examined) found none.

## Coverage and clean-up after the second review — 2026-09-26

Feature 12 now spawns a creature in both genders wherever a life stage ships separate female graphics (the chimera today) and
draws the female body and dessicated data too, so a missing female texture no longer passes. `GallerySteps` no longer keeps its own
copies of the lookup, spawn and teardown: it uses `CreatureSteps` (75 lines instead of 130). Five rows were added to the shared
register `../WORKSHOP_COMMENTS.md` as `drafted` (A RimWorld of Magic, Advanced Biomes, Nature's Pretty Sweet, Lord of the Rims -
Elves, Giddy-Up 2 - Continued), on Virginie's word; that file carries other sessions' uncommitted edits, so it was not committed
from here, and its line endings were normalised while writing. Vanilla Genetics Expanded and Vanilla Achievements Expanded stay
out of it until she decides about Sarg Bjornson's pages.

## First full run read (en2, 41 green / 11 red / 17 skipped) — 2026-09-26

The run played the tree of its turn; 11 reds, read one by one:

- **Mod defect, mine**: the texture clean-up (7fd51c9) removed `MM_CatoblepasPack_*`, which the game loads by convention
  (body texture path + "Pack", the pack-animal overlay); no Def names it, so the orphan search missed it. Restored.
- **Suite defects, fixed**: the wild draw method `TryFindRandomPawnKind` does not exist in 1.6 (now `SpawnRandomWildAnimalAt`);
  eggs cannot have a faction (`SetFaction` removed); the salamander's egg uses VEF's exploding hatcher, not the vanilla one
  (check the shared `hatcherPawn` field); a merged egg stack made the phoenix's own egg look lost (count against the old stack
  as it was); a target killed by the hydra is no longer a living pawn (counted as affected); the chimera was milked while
  male (spawned female, `ActiveAndFull` required first); the wisp and Stymphalian bird need more than 300 ticks (warm-up 3.5 s,
  slow projectile): 600.
- Not yet re-run: they wait for the next request (four already queued play the current tree).

- Checked the other 24 textures removed in 7fd51c9 against convention loading (Cards, Mechataur, Firebreath/GazeAttack, logo): no path, suffix or Def reaches them; only the Pack overlay was wrongly removed.

## Four more passes filed — 2026-09-26

Revision bc60471 (the incompatibility probe scenario is now active, hypothesis: duplicate defs; the run settles the symptom). Requests: studio 20260926-231900-835-5bc7 (filter 09-publication-shots), optional integrations -902-...-d62d (10-integrations, avec-facultatifs), Giddy-Up -f431 (10-integrations, avec-giddyup), incompatibility -778c (11-behaviour-and-incompatibility). Evidence dirs studio, facultatifs, giddyup, incompat. If a filter plays nothing, the report says so (played vs discovered): refile with the suite name first.

- fr run (5a25) played the tree from before 4ab9496 (same reds as en2, plus: Ieltxu found no straight line of sight for its target — the cell finder now searches the whole ring; Minotaur/Hydra/Stymphalian: 300 ticks too short, now 600). Not diagnosed further until a run plays the fixed tree.

## Restart pair: a real settings defect found — 2026-09-26

Run c039 (restart): seq1 green, seq2 red ("0 creatures are blocked, expected 1", the multiplier of 3 was read). The list of blocked creatures was only assigned in `PostLoadInit`, which did not restore it when the settings file is read at start-up: blocked creatures were lost at every restart. The assignment now happens in `LoadingVars` too (Source/Settings.cs); DLL rebuilt, static checks and unit tests green. The restart pass must be refiled to prove it (the settings gate stays partial until then). Found only because the suite restarts the game: the in-process reload scenario could not show it.

- RIMMSQOL pass (92ec): 2 played, 2 green, 0 skipped (button listed hidden and not drawn; revealed it draws, enables and opens the same settings). It played the tree of its turn, after the fixes up to 4ab9496 at least; the exact staged SHA is not in the ticket log. Evidence kept: summary, junit, messages, Player.log (report.html removed).

## Treechop pass: a suite defect, not the mod — 2026-09-27

Run eef1: 5 green, 1 red ("a colonist can cut the basilisk's MM_BurnedBush and free the cell": "the cell still holds a plant"). Diagnosed: `FreeCell` excludes pawns, edifices and items but not plants (different ThingCategory); the cell it handed to the dead-bush scenario already carried a wild plant of the fixture, which of course survived the cut. `SpawnDeadPlant` now retries up to 20 times for a cell bare of any plant. Not the mod's defect. DLL rebuilt; needs a re-run to confirm.

## Evidence trimmed, backlog re-read — 2026-09-27

Deleted `Evidence/en` (superseded by en2, as already flagged). Trimmed `en2` and `fr` screenshots to the single @review capture (settings window in each language); the failure screenshots of defects since fixed proved nothing about the current tree. Removed `report.html` from en2, fr, treechop and both restart sequences (derivative of junit/messages, not in the list of what to keep). Own archive `pickle-reports-archive/0927-1008` (the treechop run, plants and harvesting) deleted after confirming its content was already in `Evidence/treechop`; the other archives in that folder belong to other mods and were left alone. BACKLOG.md re-read against the current state: several items marked done were stale (drafts already written straight into the features, all passes now filed) or partly done (settings runtime checks, wisp/phoenix/legacy scenarios); rewritten to say what is filed vs. read.

## Studio pass green, gallery framing tuned — 2026-09-27

Run 5bc7: 5/5 green. Opened the five pictures (BACKLOG item): the griffin, the hound and the phoenix read small at zoom 7 (a hero shot should fill more of the frame); the five-creature line-up only fit 3 of its 5 subjects (Cerberus, the unicorn, the phoenix) in view, the manticore and pegasus were off-frame to the right at zoom 13 offset 2 cells left of the middle animal, which does not match the group's actual span (x148 to x160). Tuned in `09-publication-shots.feature`: hero shots to zoom 4; the line-up to zoom 20 centred on the middle animal (offset 0 instead of 2). Not re-rendered: the next capture confirms these numbers, they are still a guess. `Evidence/studio` (5bc7) is superseded by that next capture once it lands; kept for now as the only proof the mechanism works at all.

## Facultatifs pass: stalled at load, missing dependency — 2026-09-27

Run d62d: stall, exit 3, no report ("Terminated"). Player.log: `TypeLoadException` on `AbilityUser.Verb_UseAbility`, `AbilityUser.Projectile_AbilityBase` and `HugsLib.ModBase`, then the "BadTexture" material spam that floods a hung load screen. A RimWorld of Magic needs HugsLib (818773962) as its own hard dependency; the pass map staged everything else but not it, so its assembly failed to resolve and the game never finished loading. Added to `wsl-deps.avec-facultatifs.map`, first in the order (a prerequisite of the consumer it precedes). Not the mod's defect. Needs a re-run to confirm.

## Other pass maps checked for the same HugsLib trap — 2026-09-27

After d62d's diagnosis, checked the other providers: Giddy-Up 2 - Continued (3674332861, f431) explicitly advertises being free of the HugsLib dependency, rebuilt end to end. Tree Chopping Speed Stat (2566231583, 8421) needs only Harmony, already staged as our own mod's dependency. The original Alpha Mythology's own requirements (778c) could not be checked: steamcommunity.com returned 429 (rate limit) both by WebFetch and earlier in this session; it is VEF-based like this port, so Harmony and VEF (both already staged for our own mod) are the likely floor, not confirmed. Not adding anything to `wsl-deps.incompat-magicalmenagerie.map` without evidence.

- Giddy-Up pass (f431): green. 1 played (the griffin becomes a mount), 7 skipped by requirement (the other providers' scenarios, correctly not played on this map). No defect, no HugsLib trap as expected.

## Incompatibility pass: the real symptom, and a missing Pickle step — 2026-09-27

Run 778c: 1 green, 2 red. Read both:
- The hypothesis in the scenario ("MM_" in a duplicate-def message) was wrong. The real symptom: both mods declare
  PawnKindDefs under the same defNames; the surviving instance loses a cross-reference in one of them, and
  `RimWorld.BiomeDef.CommonalityOfAnimal` (postfixed by this mod's own settings patch, hence it shows in the stack)
  throws a `NullReferenceException` the first time the wild-animal spawner ticks. Rewritten to assert that (STATUS
  comment in the feature has the detail).
- `an error matching {string} was logged` is documented in AUDIT.md and PickleTools/Headless/README.md as Pickle
  vocabulary, but the staged build (RimWorks.Pickle.Vanilla 4.9.1) has no such step ("Undefined step"): decompiling
  it shows only the negative `no errors were logged` and the warning-matching family. Not our defect to fix; wrote
  our own `Alpha Mythology Renew an error matching {string} was logged` (BehaviourSteps.ErrorMatching) against
  `Verse.Log.Messages`/`LogMessageType.Error` instead of waiting on it. DLL rebuilt.
- Collateral: "a dying phoenix leaves an egg in its flames" (not tagged `@allow-errors`) failed on the same
  exception, because the whole pass keeps the original mod loaded, not only the tagged scenario. That is this
  incompatibility's fallout, not a defect of the phoenix scenario or the death worker; left as is.
- Filed the next run narrower (`-Filter` the incompatibility scenario by name, not the whole feature file), so the
  phoenix and wisp scenarios of this feature are not incidentally caught by the collision again.

## Restart pair confirmed green after the settings fix — 2026-09-27

Run 53a2: seq1 1/1, seq2 1/1, both green (unlike c039 which found the defect). The blocked-creatures-lost-at-restart fix (f5e8956) is proven. `settings_audit` moves from partial to complete; `Evidence/restart` (c039, the failing run) deleted, superseded by `restart2`.

## Treechop pass confirmed green — 2026-09-27

Run 8421: 6/6, including both F12 Tree Chopping Speed Stat scenarios (the provider guard and the real VEF harvest path). The dead-plant-fixture fix (1ec236d) is proven. `Evidence/treechop` (eef1, the failing run) deleted, superseded by `treechop2`.

## Facultatifs pass: HugsLib was not the fix, A RimWorld of Magic isolated — 2026-09-27

Run 342d hung the machine 4h40 (no scenario ever started, "null texture passed to GUI.DrawTexture" looping), force-killed by Virginie, exit 143, no report. Player.log shows the SAME `TypeLoadException` on `AbilityUser.Verb_UseAbility` etc. as d62d, at the same point, even with HugsLib now staged first. That retracts the d62d diagnosis: HugsLib was not the missing piece. Something about A RimWorld of Magic's own `AbilityUser`/`AbilityUserAI` assemblies fails to resolve on this WSL machine regardless of what is staged with it — a stale or broken local Steam cache of Workshop 1201382956 is the leading suspect, not fixable from this repo. Split it out of `wsl-deps.avec-facultatifs.map` into its own `wsl-deps.avec-rwom.map`, so a third hang costs one isolated pass, not the other six providers (Nocturnal Animals, Vanilla Cooking, Vanilla Genetics, Advanced Biomes, Nature's Pretty Sweet, Elves), still untested. Filing the six-provider pass again; NOT resubmitting the RWoM pass without asking — it has already held the shared machine for hours twice on the same unresolved failure.

## Incompat re-run: my own filter mistake — 2026-09-27

Run 2a93: exit 8 (infrastructure-error), 0 scenarios played. Pickle's own exit was 2: a plain substring is read as a "Mod display name" pick (Headless/README.md filter table), not free text search — needs `::text` or `file::text`. My `-Filter 'the incompatibility warns about'` matched nothing. Refiled as `11-behaviour-and-incompatibility::the incompatibility warns about`.

## Resolve This Instead wired as a required dependency — 2026-09-27

Its own session (resolvethisinstead) confirmed the folder mountable (`ResolveThisInstead/Mod`, `nelim.resolvethisinstead`, declares Harmony and Use This Instead 3396308787 as its own hard dependencies) and its own load-order pass green across three mod-list passes today. One commit: `About.xml` modDependencies + loadAfter (no Workshop id yet, not published), `Tests/Check-Mod.ps1`'s dependency list, and `Tests/Pickle/wsl-ids.map` (new — resolves `nelim.resolvethisinstead path:ResolveThisInstead/Mod` and its own dependency `Mlie.UseThisInstead 3396308787`, staging is not recursive). Check-Mod passes (335 assertions). Not done: rewriting the 8 name guards to actually consume it — that waits on Virginie's choice of shape (BACKLOG.md), and the tree is unfrozen so this can land without blocking anything.

## Nature's Pretty Sweet name guard resolved via Resolve This Instead — 2026-09-27

The design settled by ResolveThisInstead/README.md: no patch rewrite. `PatchOperationFindMod` calls `ModLister.HasActiveModWithName`, which the library intercepts globally during loading; it only answers for a pair a consuming mod vouches for. Added `Mod/About/ResolveThisInstead.xml` vouching for the one confirmed pair (`tkkntkkn.nps` "Nature's Pretty Sweet" -> `Mlie.NaturesPrettySweet`), and a comment in `NatureIsPrettySweetPatch.xml` explaining the patch itself is untouched. The other seven name-guarded patches are not confirmed broken and got no entry (guessed data would be worse than none). Check-Mod: 336 assertions, 83 XML files. Untested in game: no pass yet stages both Resolve This Instead and Nature's Pretty Sweet together to see the alias actually fire; that is `wsl-deps.avec-facultatifs.map`'s job once it and `wsl-ids.map` are staged in the same run (5622 is already filed and in flight).

## Staging bug: wsl-ids.map cannot stage a path: dependency — 2026-09-27

Runs 5622 and f45e both failed staging (exit 1, no report): "nelim.resolvethisinstead (path:ResolveThisInstead/Mod) is in none of: ...", the launcher trying to download it as a Workshop id. Read `scripts/stage-pickle-wsl.sh`: `wsl-ids.map`'s loop only ever writes `STEAM[pid]` (a Workshop id lookup); only a wsl-deps.<pass>.map's own loop populates `LOCALDIR[pid]` for a `path:` entry, and only `LOCALDIR` makes `copy_steam` treat a dependency as a local folder. My own STATUS entry for 03d1a9d was wrong: wsl-ids.map cannot do what I asked of it. `nelim.resolvethisinstead` is a hard dependency in About.xml, staged via every pass' active-mods loop regardless of -DepMap, so every pass needs the `path:` line, including the bare one (no -DepMap): added a new default `Tests/Pickle/wsl-deps.map` for that, and the same two lines (Resolve This Instead by path, its own dependency Use This Instead by Workshop id, since staging is not recursive) to all seven existing per-pass maps. Deleted `wsl-ids.map` (it could not do the job). Not yet confirmed by a run.

## packageId shortened: renew dropped — 2026-09-27

`nelim.alphamythologyrenew` -> `nelim.alphamythology` (About.xml, both this mod and the Pickle companion test mod's own `.pickletests` suffix, Harmony instance ids in Settings.cs/TranslationPatches.cs, Check-Mod.ps1, Test-Validator.ps1, the two feature files that assert "mod ... is loaded"). The mod's title, its C# class name (AlphaMythologyRenewMod), the repository and folder name are unchanged — only the packageId. Rebuilt (Source and Pickle steps DLLs); Check-Mod (336 assertions), Test-Validator (7 negative cases including the renamed one), unit tests all green.

## Incompatibility pass confirmed green — 2026-09-27

Run 8663: 1/1. The incompatibility with sarg.magicalmenagerie behaves as declared (NRE in CommonalityOfAnimal, our own step). Superseded evidence (778c, 2a93) deleted.

## Facultatifs pass: staging fixed, but Vanilla Genetics Expanded broke the shared launch — 2026-09-27

Run 4092 confirms the staging fix (21 mods staged, including nelim.resolvethisinstead and mlie.usethisinstead) but 6 scenarios red, all the same cause: `GeneticRim.Core..cctor()` (Vanilla Genetics Expanded's own assembly) throws a `NullReferenceException` at load. Its Workshop page names one dependency, Vanilla Expanded Framework, which was staged; the crash is the provider's own, not ours. It tainted the other 5 scenarios of the shared launch (Nocturnal Animals, Vanilla Cooking, Advanced Biomes, Elves, Nature's Pretty Sweet), none of which is actually confirmed broken. Isolated Vanilla Genetics Expanded into `wsl-deps.avec-genetics.map`, same reasoning as A RimWorld of Magic. Refiling the five-provider pass and the genetics pass separately.

## Facultatifs pass (five providers) confirmed green — 2026-09-27

Run d961: 5/5 played green, 3 skipped by requirement (RWoM, Genetics, Giddy-Up, each in their own pass). Nocturnal Animals, Vanilla Cooking, Advanced Biomes, Elves, and Nature's Pretty Sweet all pass — the Resolve This Instead vouch file resolves the "Nature's Pretty Sweet" name guard in a real game, confirmed. GeneticRim's crash from 4092 does not recur, isolation worked. Superseded evidence (d62d, 342d, 4092) all deleted.

## Vanilla Genetics Expanded pass confirmed green in isolation — 2026-09-27

Run fb2d: 1/1 green, alone. Correction to the 4092 diagnosis: GeneticRim.Core does not crash on its own — it only crashed staged alongside the other five facultatifs providers in one launch, so the true cause is a load-order or cross-mod interaction among that set, not a defect intrinsic to Vanilla Genetics Expanded by itself. Neither is ours to fix; the isolated pass is the honest way to cover it. Seven of the eight optional-integration scenarios are now confirmed green (Nocturnal Animals, Vanilla Cooking, Vanilla Genetics, Advanced Biomes, Elves, Nature's Pretty Sweet, Giddy-Up); only A RimWorld of Magic remains, held pending Virginie's word (it hung the machine twice).

## The other seven name-guarded patches checked against installed names — 2026-09-27

SEARCHING.md now read; used it to close the "same weakness for every patch guarded by a display name" item rather than leave it a standing worry. Read each provider's own `About/About.xml` `<name>` (six from the local Steam Workshop cache, one — Vanilla Achievements Expanded, not installed here — from a web search) against what the patch hardcodes:

| Patch | Hardcoded | Installed name |
|---|---|---|
| AdvancedBiomesPatch | Advanced Biomes (Continued) | Advanced Biomes (Continued) |
| GeneticRimPatch | Vanilla Genetics Expanded | Vanilla Genetics Expanded |
| LordRingsElvesPatch | Lord of the Rims - Elves (Continued) | Lord of the Rims - Elves (Continued) |
| NocturnalAnimalsPatch | both spellings listed by hand | [XND] Nocturnal Animals (Continued) |
| RimworldOfMagicPatch | A RimWorld of Magic | A RimWorld of Magic |
| VanillaCookingExpandedPatch | Vanilla Cooking Expanded | Vanilla Cooking Expanded |
| AchievementsPatch | Vanilla Achievements Expanded | Vanilla Achievements Expanded (per a web search, not installed locally; the same search flagged the page as possibly pulled for a guideline violation — unverified, worth a second look before publication if this integration matters) |

All seven match: no vouch entry needed for any of them, confirming Nature's Pretty Sweet was the only actually-drifted guard, not a symptom of a wider problem.

## Correction: the Achievements Workshop-page flag was noise — 2026-09-28

Virginie: Steam flags/hides Workshop pages for administrative reasons often, not necessarily meaning the mod is gone or broken. Retracting the caveat in the table above as overblown; no action needed on Vanilla Achievements Expanded from that search result.

## Studio re-render (studio2, c928): mixed result — 2026-09-28

5/5 green. Compared pixel-for-pixel against the first capture (5bc7):
- Griffin, hound, phoenix (zoom 7 -> 4): the griffin and hound frames are IDENTICAL to the first capture, down to the flower clusters' exact positions. SetRootSize clamps to a floor near 7-8 in this game build; the retune was a no-op below it, not a mistake in the numbers themselves. The phoenix reads fine either way (its sprite is simply bigger).
- Five creatures (zoom 13 -> 20, offset 2 left -> 0): worse, not better. Dezooming that far revealed the meadow's own building (top-left corner) and three stray colonists (Jet, Larson, Morrison) at the bottom, and only 4 of 5 creatures read clearly (the unicorn is half-hidden in flowers). More subjects fit the frame at the cost of a cluttered, indoor-adjacent composition.
- Settings window: unchanged, still fine.

Not retuned again blind a third time: sent Virginie the five images to judge herself before spending another launch on a guess. `Evidence/studio` (5bc7) kept alongside `studio2` until she picks, since 5bc7's five-creature framing (only 3 subjects, but no clutter) may read better than studio2's despite fitting fewer.

## Gallery: one creature per picture, not a group shot — 2026-09-28

Virginie, after seeing studio2's crowded group photo: "un a un". Replaced the single "five creatures side by side" scenario with a Scenario Outline, one picture per remaining creature (unicorn, manticore, pegasus), spawned alone so none hides behind another's flowers or sprite. The hound and phoenix already had their own shot; the gallery grows from 5 to 7 pictures. Same zoom-4 hero framing as the others (its floor near 7-8 is now documented, not fought). Renumbered the captions 1-7. No C# change (the Outline pattern is already used elsewhere in this suite); rebuilt anyway to confirm. Not yet rendered.

## Studio3 (429e): one creature per picture, read — 2026-09-28

7/7 green. Opened the three new pictures: unicorn, manticore and pegasus each read cleanly alone, no group clutter. The unicorn is the weakest (a narrow white sprite seen from above, roughly 90 px tall at the zoom floor, low contrast against the grass); the manticore reads well; the pegasus is fine, with a corner of the meadow building at the left (harmless). The colonist "Miel" of the studio fixture stands in every picture, a small stray figure, acceptable. Creatures cannot be made larger in-game (the camera floor), so any further close-up is a crop, done outside the mod when the images are uploaded. Superseded `Evidence/studio` and `studio2` deleted; `studio3` keeps the seven pictures, which are the publication candidates themselves.

## Gallery: closer, and the settings picture cropped — 2026-09-28

Virginie: zoom much more on the creatures; crop picture 7 to the window. (1) `GallerySteps.Frame` now lowers `CameraDriver.config.sizeRange.min` (a public field) to the requested zoom before `SetRootSize`, so the floor found in c928 is no wall; the six creature shots ask for zoom 2.5 (about 216 px per cell against 77 at 7, so a creature of a cell and a half goes from ~100 px to ~300 px). Untested: whether the camera keeps the lowered range in its per-frame clamp. (2) `Tests/Crop-SettingsShot.ps1` crops the settings capture to the window (900 x 700 at 511,191 in a 1920x1080 picture, 24 px margin); run on studio3's picture 7, written beside it as `-cropped.png`, source untouched.

## The required library is now in the player-facing text — 2026-09-28

About.xml description says the mod requires Resolve This Instead and that Use This Instead is loaded through it; THANKS credits Use This Instead (Mlie, MIT) with a link. PUBLICATION.md: a dependency row for the library (it needs a public Workshop page before this mod's 1.0.0) and the Use This Instead note reworded. Check-Mod green (336).

## Gallery studio4 (4b81): the lowered camera floor works, framing then fixed — 2026-09-28

7/7 green, and the closer shots work: the unicorn is now ~450 px tall, the griffin fills the frame. The camera keeps the lowered `sizeRange` (the open question of the previous entry is answered). But the griffin is cut at the top: the "1 cell up" shift that kept the pointer off the animal is 216 px at this scale and pushes a tall sprite out of frame. Set to 0 cells up for the six creature shots (still 1 cell left, so the pointer at the screen centre does not sit on the animal). Not re-rendered yet.

## Rule: an upstream means a systematic pull request — 2026-09-28

Virginie, on learning that no PR exists toward juanosarg/AlphaMythology: one is needed, in the TODO, and in the docs "if upstream, then systematic PR". Done: `BACKLOG.md` item made required (was "Optional"), `PUBLICATION.md` gets a section, and the monorepo's `PUBLISHING.md` (section "Départ depuis le projet d'origine") carries the rule. Nothing public was done: no fork, no PR; both need her go.

## A RimWorld of Magic: the blocker identified, not yet played — 2026-09-28

Virginie asked whether the cause was identified. It is now. RWoM's About.xml lists, for 1.6, Harmony, HugsLib and **JecsLite - A RimWorld of Magic** (`zal.jecsliterwom`, Workshop 3312959701, installed locally). RWoM's 1.6 folder holds only TorannMagic.dll; `AbilityUser`, `AbilityUserAI` and `CompDeflector`, the assemblies of every TypeLoadException in d62d and 342d, are in JecsLite's `1.6/Assemblies`. So both hangs came from a missing hard dependency that no pass map staged (HugsLib, added after d62d, was real but not the missing one). This retracts my two earlier guesses (HugsLib; a stale Steam cache). `wsl-deps.avec-rwom.map` now stages JecsLite. Not resubmitted: it cost the shared machine 4h40 once, so the go is Virginie's. Process slip in passing: reading this I started a `grep` over every About.xml of the Workshop cache, the unbounded scan SEARCHING.md forbids; stopped within seconds, nothing left running.

### RWoM pass 3818 played with JecsLite — 2026-09-28

Run 3818 (`wsl-deps.avec-rwom.map`): 1 passed, 0 failed, 7 skipped of 8. No TypeLoadException, no hang: the missing dependency was JecsLite, as diagnosed. Passed: "A RimWorld of Magic adds magicyte to the creatures' butcher products". The 7 skips each need another mod (Nocturnal Animals, Vanilla Cooking Expanded, Vanilla Genetics Expanded, Advanced Biomes, Lord of the Rims elves, Nature's Pretty Sweet, Giddy-Up 2) and are proven only in the passes that load their own mod. Evidence: `Tests/Pickle/Evidence/rwom`.

## Upstream: fork made, shape of the pull request to decide — 2026-09-28

Virginie gave the go for the fork and the PR. Fork done: https://github.com/vbardales/AlphaMythology (from juanosarg/AlphaMythology, default branch only, nothing pushed to it). No PR opened yet, because reading the upstream showed the shape is a real choice, not a mechanical step:
- Upstream master has `1.4/` and `1.5/` only, with full C# source under `1.5/Source`; last push 2024-10-17. Open PR #3 (Zaljerem, "Updated to 1.6", 73 files) adds a `1.6/` folder that is essentially the 1.5 Defs copied over, plus a rebuilt DLL and its Source. PR #2 (dav9670) fixes the Giddy-Up patch. PR #1 was merged.
- Our Defs differ from #3's 1.6 Defs by 2 to 8 lines in about 40 files (obsolete XML fields, VEF type names), plus an egg file split, a removed dead recipe and `MMToggleableSpawnDef`, and our own settings window. Upstream already has its own spawn-toggle settings (`MagicalMenagerie_Settings`), so ours is a second system, under a different packageId, namespace and assembly.
- A PR of the whole port into master would collide with #3 on every path of `1.6/`, and would replace upstream's identity with ours.
- One real bug is shared: upstream's `DeathActionWorker_ExplodeAndSpawnEggs` spares the egg it made from the explosion, but not the stack it merged into (the defect fixed here in 4d36's follow-up, `Source/AlphaMythology.cs`, and proven by the phoenix scenario). A small, self-contained PR on master (1.5/Source) fixes it with `TryPlaceThing(..., out placed)`.
Nothing public sent beyond the fork.

## Upstream PR #1, prepared not sent — 2026-09-28

Virginie: the small PR first. Branch `fix-phoenix-egg-lost-in-stack` in a scratch clone of the fork (`C:/amfork`, sparse, one file), commit b44eb3c: `DeathActionWorker_ExplodeAndSpawnEggs` (1.5/Source) keeps the `out` result of `TryPlaceThing` and spares that in the explosion, 5 insertions and 2 deletions, file encoding and line endings kept (BOM, CRLF). Compiled alone against Krafs.Rimworld.Ref 1.5 (0 errors). Not pushed, no PR. The in-game evidence to cite is the phoenix feature of this port, filed as a022 (`13-phoenix`, default map): it has not been green since the fix, the earlier reds were suite defects fixed later, so the PR text waits on it. Promised to show her the text before it goes out.

- 2026-09-28, Virginie: wait for the in-game proof (a022, phoenix feature), then open the upstream PR; she reads the text once it is open. This replaces the earlier "show her the text before it goes out". The text must state only what a green run and the compile check prove.

## Studio5 (2a77): gallery framed, read — 2026-09-28

7/7 green. Read pictures 1 to 3: griffin, hound and phoenix now fill the frame with no cut (the upward shift at 0 fixed the griffin); the hound picture shows the fixture colonist Miel beside it. All seven sent to Virginie one by one for the order and the unicorn call (still hers). Picture 7 cropped to the window with `Tests/Crop-SettingsShot.ps1` (`-cropped.png` next to it). `Evidence/studio3` and `studio4` deleted, superseded. No AGENTS.md in this mod folder (dispatcher asked; nothing to compress).

## Gallery: creatures showed their back — 2026-09-28

Virginie: all pictures face north. Cause: `GenSpawn.Spawn` places a thing with Rot4.North (back to the camera) and the game is paused, so nothing turns it. `GallerySteps` now sets `pawn.Rotation = Rot4.South` after the spawn. Not verified in game: whether the wait of 30 ticks lets a wandering animal turn again. Studio pass refiled.

## French review file generated — 2026-09-30

Peer session (TicketDispatcher's counterpart in the "Rimworld - l10n" group) flagged TRANSLATIONS.md's new
French gender-agreement rule and systematic-review requirement (2026-09-30): `translation_fr` reset to
`unchecked`, this session moved to the l10n group, session title changed to `alphamythology / l10n`.

Per TRANSLATIONS.md section 3, wrote `Tests/Generate-FrenchReview.cjs`: reads the shipped Keyed and
DefInjected XML plus `Mod/Defs` (never by hand, so the columns cannot drift from the mod), writes
`FRENCH_REVIEW.md` at the mod root (outside `Mod/`, so Steam never receives it). One table per source
file/def type, columns Key or path / Original / English / French, in shipped order. This mod has no
source in another language (Sarg Bjornson wrote it in English): Original repeats English, stated once at
the top, per the section's instruction for mods with no foreign-language source.

DefInjected list-item paths (e.g. `MM_Ahuizotl.lifeStages.ahuizotl_puppy.label`,
`MM_ThreeHeadedDog.corePart.parts.Neck.parts.Head-0.parts.left_eye.customLabel`) needed resolving against
the actual `<li>` position in `Mod/Defs`. First attempt (position = order of first appearance among only
the *translated* siblings) undercounted: an untranslated sibling with no customLabel (e.g. a body part with
no distinguishing label) still occupies a real `<li>` slot, so position drifted and 185 of ~710 rows failed
to resolve. Fixed by deriving each `<li>`'s own identifier from its actual content — `customLabel` (spaces
to `_`), else `def`, else its `Class` attribute (`XxxCompProperties_Name` -> `XxxComp_Name`, for HediffComps
etc.), else its own `label` field (tools list items) — with a `-N` suffix for siblings that collapse to the
same identifier (three `<li><def>Head</def>` with no customLabel become `Head-0`/`Head-1`/`Head-2`, in
document order among just those three); position-based order is now only a fallback for lists whose `<li>`
carry none of those fields at all (`PawnKindDef.lifeStages`, which has no name of its own — matched
correctly here because only the named life stage exists once per position). Re-run: 0 of 626 rows
unresolved. Verified two of this mod's own DefInjected types that read as if they were "owned by another
mod" (`MVCF.ModDef`, `VEF.Weapons.ExpandableProjectileDef`) actually are local instances this mod defines
itself (`MM_MagicalMenagerie`, `MM_GazeAttack` and siblings) — both resolved from `Mod/Defs` directly, no
external mod's source needed.

`translation_fr` set to `partial` (was `unchecked`): the mechanical checks and `FRENCH_REVIEW.md` are done,
but per TRANSLATIONS.md this field cannot reach `complete` until Virginie herself reviews the French text
— no session ever marks its own French reviewed. `remaining` carries that as `unverified`. Nothing in
`Mod/` changed; no DLL rebuild needed.

## Audit — 2026-09-30

Revision `8d7e942`. The working tree carries another session's Preview regeneration (`Art/*`, `Mod/About/Preview.png`, `Art/echo.png`) and a rebuilt `Tests/Pickle/Mod/Pickle/Assemblies/AlphaMythologyRenew.PickleSteps.dll`; none of it is this audit's and this audit committed none of it.

Retained state (corrected later the same day, see the end of this section): `stage: showcase`, `workflow_stage: l10n`. The first pass of this audit kept `preTest` and was wrong.

Checks run, out of game: Check-Mod 336 assertions PASS; Test-Validator negative cases PASS; unit tests ALL PASSED. No RimWorld launched, no run filed.

Corrections: the front matter `packageId` said `nelim.alphamythologyrenew`, stale since the 2026-09-27 shortening; `About.xml` says `nelim.alphamythology`. No `About/PublishedFileId.txt` exists, so the 0.1.0 pre-publication is not sent and `CHANGELOG.md` keeps its 0.1.0 entry as planned. `.dds`: none tracked, `*.dds` already ignored, none on disk. Test evidence: none in git and already ignored; on disk it went from 196 MB to 38 MB (TESTING.md, "Evidence to keep").

New criteria for `done -> tested` (AUDIT.md, 2026-09-30): no scenario in `@wip` (none left); every conditional scenario has run (all `@requires` passes exist on disk: facultatifs5, genetics, giddyup, rimmsqol, rwom, treechop2); no manual test left to validate. Not met: the reds and the baseline re-run (see `remaining`), and the manual cases of `Tests/FUNCTIONAL.md`, not run.

Upstream: the original has a git repository (https://github.com/juanosarg/AlphaMythology, in `upstream_mod_remotes`). The fork `vbardales/AlphaMythology` exists and the phoenix-egg PR is prepared, not sent, pending the green phoenix run (2026-09-28 sections).

Correction, 2026-09-30, same day: TRANSLATIONS.md (version ebadb99, 2026-09-30, read in full) says only `complete` or justified `not_applicable` in all three fields permits entry into `preTest`. Here `translation_fr` is `partial`: the French review by Virginie is pending (`FRENCH_REVIEW.md` generated) and no agreeing French text was read for gender agreement (no `PAWN_gender` switch exists in `Mod/Languages/French`; whether any text needs one is not established, it takes a reading). `options -> l10n` therefore does not hold on the current TRANSLATIONS.md, and the first transition that fails fixes the state: `stage: showcase`, `workflow_stage: l10n` (was `preTest`, set on 2026-09-26). Session title: `alphamythology / l10n`. Nothing else changes: the automated checks, the `@requires` passes and the open reds stay in `remaining`. Work to go back up: Virginie's French review, plus a reading of the French for pawn agreement; then `preTest` is back.

## French review corrections applied — 2026-09-30

Virginie's review returned six corrections, all applied verbatim in `Mod/Languages/French`: `AMR_DevReproduceDesc` ("Déclencher immédiatement la reproduction asexuée."), `MM_ParalizingRanged` ("Attaquant paralysant à distance."), `MM_ParalyzingRangedDesc` ("paralysants"), `MM_NoRanged` and `MM_Ranged` ("la personne qui le guide", "les commandes de cette personne", agreement kept), `MM_Cerberus.description` (the jaws receive the implants), `AMR_AllowedHeader` ("ne sont pas affectés"). Her note: no string needs the neutral o-form, the agreements seen concern species and objects, not a variable colonist. `FRENCH_REVIEW.md` regenerated (0 unresolved rows), Check-Mod 336 assertions PASS. `translation_fr` stays `partial`: French files changed, so per TRANSLATIONS.md the changed texts need her second reading, and only she sets `complete`. The queued studio8 gallery run (8c3f, English) will stage this changed tree; the label's SHA 8d7e942 no longer describes it.

Second review pass, 2026-09-30: two micro-corrections applied (`MM_ParalizingRanged` without final period, `AMR_AllowedHeader` parenthesis in the plural, straight apostrophes kept as in the file), committed as `9a1c1c3`; `FRENCH_REVIEW.md` regenerated from `9a1c1c3` (0 unresolved rows) and committed right after, so the review names the commit that holds the French it shows. `translation_fr` stays `partial`: Virginie's reviewer said she will validate `complete` herself.

## Audit — 2026-10-01

Revision `c3edfb2`, clean tree, pushed. Protocol versions unchanged since the 2026-09-30 reading (AUDIT 7fd7475, TRANSLATIONS ebadb99, PUBLISHING e0411cc). Re-run out of game: Check-Mod 336 assertions PASS, Test-Validator negative cases PASS, unit tests ALL PASSED. No game launched.

French review: Virginie validated the French in chat on 2026-10-01 (corrections of 2026-09-30 applied, revision `9a1c1c3`, `FRENCH_REVIEW.md` generated from it). `translation_fr: complete` is written on her word; the session did not review the French itself.

Plural rule (TRANSLATIONS.md section 2, 2026-09-25), replayed as AUDIT.md step 12 asks: of the three keys that print a number, `AMR_SpawnMultiplier` ("x{0}") counts nothing, `AMR_AsexualHatched` takes a name, `AMR_AsexualReproductionProgress` counts days ("{1} days per cycle" / "{1} jours par cycle", 15 in the wisp's Def) with no `.One` or `.Many` form in either language. Defect: `localization` and `translation_en` go to `partial`, `translation_fr` stays `complete` on the text she read but will need the new French read after the fix.

Retained state: `stage: showcase`, `workflow_stage: l10n` (first failing transition: `options -> l10n`, the plural forms). Session title unchanged: `alphamythology / l10n`. The audit does not fix it. Work to go back to `preTest`: add the `.One`/`.Many` keys in English and French, make the code pick by the count, regenerate `FRENCH_REVIEW.md`, have the new French text read.

## Plural defect fixed — 2026-10-01

`AMR_AsexualReproductionProgress` now takes the cycle length as a finished phrase (`{1}`): `AMR_AsexualReproductionDays.One` ("{0} day" / "{0} jour") or `.Many` ("{0} days" / "{0} jours"), chosen in `Source/TranslationPatches.cs` by `days == 1` (the Def says 15; 0 cannot occur, so no `.Zero`). The Pickle step reads the template prefix up to the first `{`, unchanged. DLL rebuilt (0 warnings, 0 errors), Check-Mod 336 PASS, Test-Validator PASS, unit tests ALL PASSED. Code commit `e53da76`; `FRENCH_REVIEW.md` regenerated from it. Because a French file changed, `translation_fr` is back to `partial` until Virginie reads the three changed rows; `localization` and `translation_en` are `complete` again. `stage` stays `showcase` / `l10n` until then.

Review pass, 2026-10-01: `MM_Ahuizotl.description` retreat sentence reworded ("Cela rend la retraite difficile au corps à corps.") at `4056203`; `FRENCH_REVIEW.md` regenerated from it. `translation_fr` stays `partial` until Virginie reads the changed rows (this one and the three plural rows).

Review pass 3, 2026-10-01 (`fc4bd4b`): role labels without gender (`MM_DamageRangedPoison` "Attaque toxique à distance", `MM_ParalizingRanged` "Attaque paralysante à distance", `MM_Boomer` "Explose à la mort", `MM_Tank` "Première ligne"); `MM_Ahuizotl.labelPlural` "ahuizotls" and `MM_Kitsune.labelPlural` "kitsunes" (were singular); egg labels "(féc.)" / "(non féc.)", short like the English "(fert.)". `FRENCH_REVIEW.md` regenerated from it. `translation_fr` stays `partial` until Virginie reads the changed rows.

Review pass 4, 2026-10-01 (`990f571`): `MM_DamageRanged` "Combat à distance". Virginie confirmed the toxic, paralysing, Boomer and Tank labels. `FRENCH_REVIEW.md` regenerated from it.

## French review confirmed — 2026-10-01

Translation audit, dated line: reviewer Virginie, 2026-10-01, revision `990f571` (French text; `FRENCH_REVIEW.md` generated from it at `bedc666`), corrections requested: the six of 2026-09-30, two micro-corrections, plural keys, Ahuizotl sentence, gender-neutral role labels (`MM_DamageRangedPoison`, `MM_ParalizingRanged`, `MM_Boomer`, `MM_Tank`, `MM_DamageRanged`), `ahuizotls`/`kitsunes`, egg labels "(féc.)", all applied and re-read; confirmed in chat. `translation_fr: complete` on her word, written by the session that did not review it. `localization`, `translation_en`, `translation_fr` are all `complete`: `options -> l10n` holds, `l10n -> preTest` holds on the dependency check of 2026-09-26 (no dependency change since). Retained state `stage: preTest`, `workflow_stage: preTest`; session title `alphamythology / preTest`. `done` is not claimed: open reds and the animal-mod patches stay in `remaining`. Any later French change resets `translation_fr` to `unchecked`.

## Animal-mod patches written — 2026-10-01

On Virginie's order, the four integrations of PUBLISHING.md "Mods qui ajoutent des animaux" (Dogs mate added the same day): `Mod/Patches/AlphaMythology/AnimalProsthetics2Patch.xml` (22 animals in ADS_Cat1..3 by vanilla analogue, Hydra, Lesser Wyvern and Will-o'-Wisp left out), `DogsMatePatch.xml` (Cerberus, Erymanthian boar, Ceryneian hind, Pegasus join the Dog, Pig, Deer, Horse groups) and `BetterCrossbreedingPatch.xml` (the same four pairs, both directions, Random calf, class spelled `DZY.CrossBreeding`). Each header gives the source read (ADS 2 `Animal_Categories.xml`, Dogs mate `CompatibleSpecies/*.xml`, the Better Crossbreeding example of Funny Creatures Renew) and why each animal is in or out: a group is joined only where the animal's own description says it IS that species ("a three-headed dog", "a gargantuan wild hog", "an enormous deer", "a winged divine horse"), not where it looks like one. `About.xml` gains `loadBefore` ADS 2 and the three THANKS links; `PUBLICATION.md` rows added. Proof: `Tests/UnitTests/PatchTests.cs` applies the real patch files to stand-in definitions with a minimal engine and XPath 1.0 (47 checks pass, and three deliberate traps turned seven checks red); Check-Mod 339 assertions PASS. Not proven: any behaviour in game, and the choices of class and pairing are Virginie's to confirm. Nothing posted to the three mods.

## Tickets filed while waiting — 2026-10-01

Tree frozen at `153e7de` (no more change to `Mod/`, `Source/` or `Tests/` until every `RUN_DONE`). Six requests under this session: studio8 (8c3f, label SHA stale, plays this tree), baseline English (fa4b) and French (6a49) on `sans-facultatifs`, no filter, then the three animal-mod passes of `18-animal-mods`: ads2 (ea85), dogsmate (95c8), crossbreeding (17ec). New in the suite: `Features/18-animal-mods.feature`, `Source/AnimalPatchSteps.cs` (live data: surgeries by provider, `canCrossBreedWith`, the Better Crossbreeding extension), a plural assertion in the wisp step, three `wsl-deps` maps. Evidence dirs `base-en`, `base-fr`, `ads2`, `dogsmate`, `crossbreeding`, `studio8`. The seven reds of the 2026-09-26 baseline were suite defects fixed since (STATUS section "First full run read") and wait for the baseline replay; `en2` and `fr` go once the replay is read.

Achievements pass written, 2026-10-01 (owner chose option 1): last scenario of Features/18-animal-mods.feature (the tab and the eight achievements, by type name through a new step 	he def {string} of type {string} exists), map wsl-deps.avec-achievements.map (vanillaexpanded.achievements, 2288125657). Never played; request filed after the commit. The FUNCTIONAL.md table of what stays manual is awaiting her validation of the other rows.

Manual-test table validated, 2026-10-01: Virginie confirmed in chat the "What stays manual" table of `Tests/FUNCTIONAL.md` (F06 toggle, F07 offline values, F02 rare sample, F10 migration and reduced Animal Ark: not applicable or covered, disclosed; F11 Genetics and RimWorld of Magic: covered by their green passes; Achievements: its own pass, not yet played). Nothing counts as passed by this validation.

## Studio8 (ticket 8c3f) read — 2026-10-01

Tree `153e7de`-era (run played the tree of its turn). `exitReason: passed`, 7 played of 7 discovered, 7 green. Opened all seven pictures: the griffin, hound, phoenix, unicorn, manticore and pegasus now face south (head toward the camera), fill the frame and are not cut; the fixture colonist Miel stands beside the phoenix and the manticore, Miel and a second colonist show at the edge of the griffin and the settings pictures. The unicorn stays the weakest (narrow white sprite, about 90 px wide, low contrast); the pegasus sits among busy flowers. Picture 7 is the full screen with the game UI (colonist bar, Learning helper, bottom bar): the cropped copy `...-cropped.png` made with `Tests/Crop-SettingsShot.ps1` is the one for the page. The order and the unicorn call are still Virginie's. `Evidence/studio7` deleted (superseded), `report.html` of studio8 deleted.
