# Translation audit and acceptance

Audited on 2026-09-13 against local changes based on
`ad6dc835c81e90735f9873d9db963d5a6147b8ef`. This implements the translation gate in
the parent workspace's PUBLISHING.md and TRANSLATIONS.md.

## Inventory and ownership

`TranslationInventory.json` records 591 source fields, their English text, source
XML paths and resolved injection paths. Coverage includes all 25 races and pawn
kinds, juvenile/sex/plural labels, tools and verbs, bodies and nested body parts,
damage/death messages, hediff stages and treatment labels, thoughts, surgery,
plants, leather, eggs, projectiles, MVCF metadata and the optional achievement tab
and eight achievements. English remains the native Def fallback. French supplies
590 DefInjected entries; the remaining field is the wisp's `customString`, whose
entire inspection sentence is replaced by a scoped translation postfix.

All nine optional patches were read. Achievements adds owned prose; its 17
translations load only with `vanillaexpanded.achievements`. Other patches add
references, enum values, filters, stats or provider classes, rather than owned
sentences. `PatchOperationAddModExtension` is not implemented by the shared path
checker: those patches were reviewed directly and introduce no additional owned
DefInjected text. Their gameplay compatibility is still unverified.

The original three C# workers expose no owned UI sentences. The new translation
postfix contains four translated UI keys. VEF translates the four egg-command
keys and the 34 distinct AnimalStatExtension keys. Two stat descriptions,
`MM_UtilityHealthDesc` and `MM_UtilityTemperatureDesc`, were missing even from the
upstream English file and now have English/French resources. Qilin and salamander
incorrectly used a long description as their short role and a ranged-damage
tooltip for their fire melee ability; both now use the shock-troop role and its
fire tooltip. No combat values were changed.

The wisp's birth message is configured as `AMR_AsexualHatched`, with a complete
parameterized sentence in each language. The inspection postfix retains VEF's
visibility and enabled state, reads the existing counter and interval, and
localizes the entire percentage/cycle sentence. It also localizes VEF's developer
reproduction command. Both postfixes check `MM_WillOWisp`; reproduction logic and
save fields remain VEF-owned. A binding change logs an explicit technical error.

Six shared VEF keys are deliberately supplied in both languages: the exploding
egg warning and the body-clock heading, explanation and three enum values. The
installed VEF has only English resources. Its English wording is retained and
French is supplied here; these shared keys also affect other consumers while
this mod is active. VEF's actual `Translate()` calls and dynamically constructed
body-clock keys were inspected in the installed 1.6 assembly. Optional providers'
own UI is not claimed to have been independently translated or tested.

Vanilla `EggProgress` was checked in Core English and the installed French language
archive. Vanilla combat-log RulePackDef references and implied meat/corpse labels
continue to use the game's grammar and translated race/tool labels; this mod adds
no custom grammar packs. IDs, enum values, def references, paths, technical logs,
save keys and mod names in patch gates are not prose. About metadata and repository
documents are outside the in-game gate.

## Reproducible checks

```powershell
python Tests/Check-Translations.py --self-test
pwsh -File Tests/Check-Mod.ps1
pwsh -File Tests/Test-Validator.ps1
dotnet build Source/AlphaMythologyRenew.csproj -c Release --nologo
```

The translation check passes 591 audited fields, 590 French injections and 49
English/French Keyed pairs. It compares against current Defs/patches and direct
C# consumers, checks duplicates, empty values, stale entries, parameters and
markup, and requires review when inventoried English changes. Four isolated
negative cases reject missing keys, missing injections, damaged parameters and
new unaudited text. This is regression coverage for the reviewed mechanisms, not
a substitute for auditing new custom XML fields or new UI code.

The shared checker `../scripts/Check-DefInjected.ps1` passed all 590 injection
paths with **0 errors and no unverified paths or unknown types**. It used installed
RimWorld 1.6 Core/DLCs and the following explicit third-party targets/assemblies:

- Workshop `2023507013`: VEF; `1.6/Assemblies/VEF.dll` and `MVCF.dll`.
- Workshop `2288125657`: Vanilla Achievements Expanded;
  `1.6/Assemblies/AchievementsExpanded.dll`.
- This repository's `Mod/` directory.

Invocation: `-TransMod <Mod> -Targets <Mod>,<VEF>,<Achievements>
-ExtraAssemblies <VEF.dll>,<MVCF.dll>,<AchievementsExpanded.dll>`.
Local raw outputs and dependency decompilations are under ignored `.build/`.
The checker resolved list handles against the actual reflected types, including
body-part labels, duplicate horn tools, hediff comp classes and thought stages.
The 17 achievement paths were also checked with their provider assembly present.

Static mod checks pass 321 assertions across 82 XML files and 25 creatures. All
six existing validator negative cases pass. Release compilation passes without
warnings or errors; the shipped DLL is rebuilt. CI now includes the translation
check and its negative cases. No remote CI run is claimed for these local edits.

## In-game acceptance — NOT RUN

Repeat each case in English and French, recording mod versions, screenshots and
translation/load errors from Player.log. Check both a fresh game and an existing
save. These checks remain in STATUS.md `remaining`; static completion is readiness
for preTest, not an assertion of runtime success.

1. Inspect all 25 creatures and their juvenile/sex variants: names, descriptions,
   role values/tooltips, body clocks, attacks and body-part health labels. Check
   generated corpse/meat labels and combat-log grammar.
2. Inspect every custom hediff at each severity and treatment/permanent state;
   trigger damage/death messages and the fenghuang thought/health effect.
3. Inspect plants, both leathers, every egg, projectiles and shutdown surgery.
   Queue and cancel phoenix egg destruction; inspect a salamander egg with
   exploding eggs enabled and disabled.
4. Inspect a wild, juvenile and adult player-owned wisp. Toggle asexual
   reproduction, check the percentage and cycle duration, use the developer
   reproduction action and trigger a birth message. Verify another mod's
   reproduction component is unaffected by the postfixes.
5. Load with and without Vanilla Achievements Expanded. With it, inspect the tab
   and all eight achievements. Without it, check for absent-target injection
   errors. Exercise other supported optional integrations separately, including
   the ieltxu's nocturnal behavior and provider-owned UI.
6. Check for raw keys, English fallback, broken parameters/tags, clipped labels
   and awkward French grammar. Record findings before claiming runtime validation.
