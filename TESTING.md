# Tests

Manual tests: NOT RUN. Use new disposable colony on RimWorld 1.6 with Harmony,
Vanilla Expanded Framework, Alpha Mythology Renew. No original Alpha.
Record game/dependency versions, actual outcomes, Player.log per case.

1. Load, spawn all 25 creature types. Check every facing, movement, feeding,
   corpse graphics, sounds; no missing textures, refs, classes, patch errors.
2. Kill adult phoenix normally: one explosion, one or two fertilized eggs protected
   from explosion; advance time to hatching. Repeat for chick and juvenile radii.
3. Apply bleeding-wound hediff, advance time, verify recurring damage; save/reload,
   verify resumes; remove hediff, verify damage stops.
4. (Shutdown recipe removed 2026-09-26: no race offered it.)
5. Exercise ranged attacks, milk/egg products, regeneration on matching
   creatures. Verify products, hatchers match XML definitions.
6. Add Giddy-Up 2 - Continued: ride griffin, pegasus, unicorn, manticore when mountability
   settings allow; check rider/saddle placement, modifiers.
7. Exercise each optional patch with provider absent and, where compatible
   provider exists, present. Legacy Achievements, GeneticRim, NocturnalAnimals
   remain unverified; guard passing without provider proves no runtime behaviour.
8. Save/reload colony with creatures, eggs, active bleeding wound: no losses or
   repeated errors. Migration from older Animal Ark untested: class names changed.
9. Load with newly reduced Animal Ark: no duplicate defs or shared C# type names.

Automated: `pwsh -File Tests/Check-Mod.ps1` (portable XML, inventory, namespace,
metadata checks); `dotnet build Source/AlphaMythologyRenew.csproj -c Release`.
Build compiles all three classes, zero warnings/errors. Run parent-workspace
Check-DefRefs with VEF 1.6, Check-XmlFields with VEF/MVCF and this DLL, and
Check-XmlClasses with RimWorld/VEF/MVCF/Giddy-Up lists. Check optional providers
separately. No automated in-game behaviour harness exists.

## Upstream audit — 2026-09-12

Reviewed https://github.com/juanosarg/AlphaMythology at commit
`53a5518008821188009bbf996b7120ad9593cb5f` (complete recursive tree, source).
No test project, suite, CI workflow, NUnit/xUnit/MSTest dependency, test
attributes found. Original About/About.xml and Workshop description
mention playtesting, give no reproducible test protocol to import.
Scoped to reviewed default-branch snapshot, not every historical branch.

Local verification 2026-09-12: Check-Mod.ps1 PASS (63 XML files, 25 creatures);
Release build PASS, zero warnings/errors, .NET SDK 8.0.424.
Manual gameplay, optional provider integration tests still pending.

Workshop follow-up (2026-09-12): Bug Reports thread contains historical manual
reproduction cases, despite no upstream automated suite. Add to manual regression
testing; none executed in this audit:

- Cut basilisk-created dead grass/bushes in minimal colony; confirm removal
  without work loop or missing harvesting SoundDef errors.
- Toggle tamed chimera automatic ranged attack; check setting respected, first alone, then
  with other ranged-animal mods.
- With Tree Chopping Speed Stat present, tamed Kappa harvests mature crops;
  check historical PawnWillingToCutPlant/ThinkNode null-reference error.
- Verify Tlilcoatl breath against organic pawns, mechanoids, shields per
  current damage definition; historical report claims physical damage.

Source: https://steamcommunity.com/workshop/filedetails/discussion/1821617793/3130541756142153070/
Reports to investigate, not confirmed defects in this port.

## Executable checks and acceptance protocol

Detailed manual steps, expected outcomes, evidence template:
[Tests/FUNCTIONAL.md](Tests/FUNCTIONAL.md). All 12 scenario groups remain NOT RUN.

Run from repository root with PowerShell 7 and .NET SDK 8:

```powershell
pwsh -NoProfile -File Tests/Check-Mod.ps1
dotnet build Source/AlphaMythologyRenew.csproj -c Release --nologo
pwsh -NoProfile -File Tests/Test-Validator.ps1
```

Check-Mod validates metadata/dependencies, unique defs, race links, hatch targets
and durations, laid-egg references, two custom worker bindings, phoenix egg
fire resistance, notice parity, PNG signatures/preview size, assembly packaging.
Test-Validator verifies rejection of six deliberate regressions in temporary
copy: wrong package ID, missing race, dangling hatch target, wrong death worker,
flammable phoenix egg, mismatched licence notice. Never mutates real mod.
Both run in CI alongside compilation. Current baseline passes 321 assertions.
Static integration/packaging checks, not execution of RimWorld or C#
behaviour tests. Cannot prove DLL load compatibility, optional provider types,
full texture coverage, patch application, save migration, gameplay correctness.

Translation gate, bilingual acceptance cases documented in
[Tests/TRANSLATIONS.md](Tests/TRANSLATIONS.md). Run
`scripts/Check-Translations.ps1` (shared, see Tests/TRANSLATIONS.md) after text, Def, patch, UI or
language-resource edits. Not run by this repository's CI (script lives in protocols repository). Reset affected translation
fields in STATUS.md to `unchecked` until audit and resource checks pass again.

## Evidence to keep

Reports (`Tests/Pickle/Evidence/`, `evidence/`) gitignored, live on disk only. Keep,
per scenario, latest report for revision now in repository, plus older one
only if sole proof of check latest run did not repeat. Delete rest as
soon as newer report replaces it; report about superseded build proves nothing.
Screenshots may be minified (only `@review` captures actually opened and
judged, reduced size). Never delete report a `STATUS.md` field still points to:
repoint first. History is one text line per run in `docs/runs/`, never folders.

Kept on disk as of 2026-10-05 (first listed 2026-09-30, 38 MB then; every `report.html` and every `messages.ndjson` over 1 MB removed, duplicate summary and captures):

| Folder | What it proves | Delete when |
|---|---|---|
| `initial-en`, `initial-fr` | initial full pass of 2026-10-10 (84 scenarios, `sans-facultatifs`, EN and FR): 49 passed, 5 red each, every red replayed green; report and messages removed | next full pass on newer revision replaces them |
| `replay-egg`, `replay-kitsune`, `replay-restart` | green replays of 2026-10-10: feature 11, egg destruction, Stymphalian (one launch), Kitsune FR, restart pair | next full pass has them green |
| `facultatifs5`, `genetics`, `giddyup`, `rwom`, `rimmsqol`, `treechop2` | one optional-provider pass each (`@requires` scenarios) | same pass replayed |
| `incompat4` | declared incompatibility with `sarg.magicalmenagerie` still behaves as declared | other mod changes |
| `restart3` | settings persistence across restart (seq1, seq2), green 41a1 | replayed |
| `ads2b`, `dogsmate2`, `crossbreeding`, `achievements2` | one animal-mod pass each, green | same pass replayed |
| `studio8` | seven gallery pictures (originals); `Art/gallery/` holds published versions | gallery uploaded |
| `gallery3` | sanctuary series of 2026-10-12, 9 of 9 green (originals of nine candidates in `Art/Gallery/`) | gallery uploaded |

## Conditions for `tested`

- No scenario left in `@wip`: repaired and replayed, or deleted with justification.
- Every conditional scenario (`@requires:<packageId>`) had its pass, on map that loads
  that mod, report read (suite and scenario names checked).
- No manual test left to validate: each automated and green, or listed as not
  applicable with reason. `@review` captures still looked at.

## Settings

`dotnet run --project Tests/UnitTests/UnitTests.csproj -c Release` runs game-free settings rules
(`Source/SpawnRules.cs`: defaults, bounds, clamping, blocked creature). Check-Mod.ps1 asserts
settings contract (hidden shortcut, worker class, persistence fields), Test-Validator.ps1 proves
visible shortcut rejected. Window, effect on real spawns, persistence across restart, RIMMSQOL route
need running game, belong to `done -> tested` (scenario F13 in Tests/FUNCTIONAL.md).

## Patch tests: the animal-mod integrations without the game (2026-10-01)

`Tests/UnitTests/PatchTests.cs`, run by same command as settings rules (`dotnet run --project Tests/UnitTests/UnitTests.csproj -c Release`),
applies three real patch files (`AnimalProsthetics2Patch.xml`, `DogsMatePatch.xml`, `BetterCrossbreedingPatch.xml`) to small stand-ins of other mods' definitions
and checks result. `PUBLISHING.md` suggests Python with `lxml`; this suite is C#, so uses **`System.Xml.XPath`** (`XDocument.XPathSelectElements`) instead.

- **Why as good as `lxml`, or better.** Xpath evaluated with XPath 1.0 semantics, as game does: game calls
  `XmlDocument.SelectNodes`, the .NET XPath 1.0 engine, used here, whereas `ElementTree` knows only subset. Predicate such as
  `[@Name="A" or "B"]`, true for every node because `"B"` non-empty string, behaves here as in game: test ("ADS 2: the trap predicate...")
  proves it.
- **What engine covers.** Minimal reader of operations these patches use: `PatchOperationSequence`, `PatchOperationFindMod`, `PatchOperationConditional`,
  `PatchOperationAdd`, `PatchOperationAddModExtension`, active mods as list of display names for `FindMod`. Any other operation class throws
  `unknown operation` instead of being skipped, so new patch kind cannot slip through untested: add to `Apply` first.
- **What it does not cover** (Pickle passes do): real mods' load order, what they do with lists at game start, `MayRequire` attributes, game's own
  merging of abstract parents. Green here says patch writes what it means to write on document shaped like target's; not that target is shaped
  like that. Shapes read from providers' own files (Dogs mate's `sarg.magicalmenagerie.xml`, ADS 2's `Animal_Categories.xml`, Better Crossbreeding's DLL).
- **Cases.** ADS 2: Cat3 animal in all three lists, Cat2 in two, Cat1 in one, three left out on purpose absent, existing users kept, other recipe untouched,
  document unchanged without `ADS_Cat1`. Dogs mate: boar joins `Pig`, groups Dogs mate's own patch fills not touched, unnamed group untouched, document
  unchanged without groups. Better Crossbreeding: pairs on both races and outcomes on mother, existing `canCrossBreedWith` list extended not
  duplicated, capital-B `DZY.CrossBreeding.Extension`.
- **Proof tests can fail.** Each trap put back in copy of patch (bare `Add` on `<race>`, predicate without `@Name=`, wrong class spelling)
  and test turned red before trusted.

## Passes (declared 2026-09-26, rewritten 2026-10-10)

Pickle suite in [Tests/Pickle](Tests/Pickle/README.md): 19 features, 68 scenarios, written; passes below played
on 2026-10-05 revision except where noted (evidence in `Tests/Pickle/Evidence/`, one line per run in `docs/runs/`).
Three families, as AUDIT.md asks:

1. **Without optional mods** (default map `wsl-deps.map`): minimal English and minimal French, one pass per language, plus
   restart pair (`07-restart-write` then `08-restart-read`, one launch chain). Three more passes with own map: game's translation
   report (`wsl-deps.translation.map`, French only: game writes no report for English), gallery
   (`wsl-deps.sanctuary.map`, owner's captures), studio pass (`wsl-deps.studio.map`, superseded by sanctuary one).
2. **With optional mods, one pass per exclusive combination**: `avec-facultatifs` (Advanced Biomes, Elves, Nature's Pretty Sweet,
   Nocturnal Animals, Vanilla Cooking Expanded), `avec-genetics`, `avec-giddyup`, `avec-rwom`, `avec-treechop`, `avec-achievements`,
   `avec-ads2`, `avec-dogsmate`, `avec-crossbreeding`, `avec-rimmsqol` (settings shortcut). Every `@requires:<packageId>` of
   suite mounted by one of these maps.
3. **One pass per declared incompatibility**: `incompat-magicalmenagerie` (original mod, still incompatible as declared).

Not tested on purpose (`AUDIT.md`: mod does not change it): behaviour of vanilla and other mods left as they are.