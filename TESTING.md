# Tests

Manual tests: NOT RUN. Use a new disposable colony on RimWorld 1.6 with Harmony,
Vanilla Expanded Framework and Alpha Mythology Renew. Do not load original Alpha.
Record game and dependency versions, actual outcomes and Player.log for each case.

1. Load and spawn all 25 creature types. Check every facing, movement, feeding,
   corpse graphics and sounds; no missing textures, refs, classes or patch errors.
2. Kill an adult phoenix normally: one explosion, one or two fertilized eggs protected
   from that explosion; advance time to hatching. Repeat for chick and juvenile radii.
3. Apply the bleeding-wound hediff, advance time, verify recurring damage; save/reload
   and verify it resumes; remove the hediff and verify the damage stops.
4. (The shutdown recipe was removed on 2026-09-26: no race offered it.)
5. Exercise ranged attacks, milk/egg products and regeneration on the corresponding
   creatures. Verify products and hatchers match their XML definitions.
6. Add Giddy-Up 2 - Continued: ride griffin, pegasus, unicorn and manticore when allowed
   by its mountability settings; check rider/saddle placement and modifiers.
7. Exercise each optional patch with its provider absent and, where a compatible
   provider exists, present. Legacy Achievements, GeneticRim and NocturnalAnimals
   remain unverified; a guard passing without the provider proves no runtime behaviour.
8. Save/reload a colony with creatures, eggs and an active bleeding wound: no losses or
   repeated errors. Migration from older Animal Ark is untested because class names changed.
9. Load with the newly reduced Animal Ark: no duplicate defs or shared C# type names.

Automated: `pwsh -File Tests/Check-Mod.ps1` (portable XML, inventory, namespace,
metadata checks); `dotnet build Source/AlphaMythologyRenew.csproj -c Release`.
The build compiles all three classes, zero warnings/errors. Run parent-workspace
Check-DefRefs with VEF 1.6, Check-XmlFields with VEF/MVCF and this DLL, and
Check-XmlClasses with RimWorld/VEF/MVCF/Giddy-Up lists. Optional providers must be
checked separately. No automated in-game behaviour harness exists.

## Upstream audit — 2026-09-12

Reviewed https://github.com/juanosarg/AlphaMythology at commit
`53a5518008821188009bbf996b7120ad9593cb5f` (complete recursive tree and source).
No test project, test suite, CI workflow, NUnit/xUnit/MSTest dependency or test
attributes were found. The original About/About.xml and Workshop description
mention playtesting, but provide no reproducible test protocol to import.
This is scoped to the reviewed default-branch snapshot, not every historical branch.

Local verification on 2026-09-12: Check-Mod.ps1 PASS (63 XML files, 25 creatures);
Release build PASS with zero warnings/errors using .NET SDK 8.0.424.
Manual gameplay and optional provider integration tests remain pending.

Workshop follow-up (2026-09-12): the Bug Reports thread contains historical manual
reproduction cases, despite the absence of an upstream automated suite. Add these
to manual regression testing; none has been executed in this audit:

- Cut basilisk-created dead grass/bushes in a minimal colony; confirm removal
  without a work loop or missing harvesting SoundDef errors.
- Toggle a tamed chimera's automatic ranged attack and check that the setting is
  respected, first alone and then with other ranged-animal mods.
- With Tree Chopping Speed Stat present, have a tamed Kappa harvest mature crops;
  check for the historical PawnWillingToCutPlant/ThinkNode null-reference error.
- Verify Tlilcoatl breath against organic pawns, mechanoids and shields according
  to the current damage definition; a historical report claims physical damage.

Source: https://steamcommunity.com/workshop/filedetails/discussion/1821617793/3130541756142153070/
These are reports to investigate, not confirmed defects in this port.

## Executable checks and acceptance protocol

Detailed manual steps, expected outcomes and evidence template:
[Tests/FUNCTIONAL.md](Tests/FUNCTIONAL.md). All 12 scenario groups remain NOT RUN.

Run from the repository root with PowerShell 7 and .NET SDK 8:

```powershell
pwsh -NoProfile -File Tests/Check-Mod.ps1
dotnet build Source/AlphaMythologyRenew.csproj -c Release --nologo
pwsh -NoProfile -File Tests/Test-Validator.ps1
```

Check-Mod validates metadata/dependencies, unique defs and race links, hatch targets
and durations, laid-egg references, the two custom worker bindings, phoenix egg
fire resistance, notice parity, PNG signatures/preview size and assembly packaging.
Test-Validator verifies rejection of six deliberate regressions in a temporary
copy: wrong package ID, missing race, dangling hatch target, wrong death worker,
flammable phoenix egg, and mismatched licence notice. It never mutates the real mod.
Both run in CI alongside compilation. The current baseline passes 321 assertions.
These are static integration/packaging checks, not execution of RimWorld or C#
behaviour tests. They cannot prove DLL load compatibility, optional provider types,
full texture coverage, patch application, save migration or gameplay correctness.

The translation gate and bilingual acceptance cases are documented in
[Tests/TRANSLATIONS.md](Tests/TRANSLATIONS.md). Run
`python Tests/Check-Translations.py --self-test` after text, Def, patch, UI or
language-resource edits. This check also runs in CI. Reset affected translation
fields in STATUS.md to `unchecked` until the audit and resource checks pass again.

## Evidence to keep

Reports (`Tests/Pickle/Evidence/`, `evidence/`) are gitignored and live on disk only. Keep,
per scenario, the latest report for the revision now in the repository, plus an older one
only if it is the sole proof of a check the latest run did not repeat. Delete the rest as
soon as a newer report replaces it; a report about a superseded build proves nothing.
Screenshots may be minified (only the `@review` captures that were actually opened and
judged, at reduced size). Never delete a report a `STATUS.md` field still points to:
repoint it first. History is one text line per run in `docs/runs/`, never folders.

Kept on disk as of 2026-10-05 (first listed 2026-09-30, 38 MB then; every `report.html` and every `messages.ndjson` over 1 MB removed, they duplicate the summary and the captures):

| Folder | What it proves | Delete when |
|---|---|---|
| `final-en`, `final-fr` | the final baseline (79 scenarios, `PLAIN`, EN and FR on `sans-facultatifs`): 50 passed each, the two reds of the day answered by `fix-en8` and `fix-en10`; report and messages over 1 MB removed | the next full pass on a newer revision replaces them |
| `fix-en8`, `fix-en10` | the green replays of the hind milk (a84d) and of the shield belt vs the poison breath (9d00) that the baselines had red | the next full pass has them green |
| `facultatifs5`, `genetics`, `giddyup`, `rwom`, `rimmsqol`, `treechop2` | one optional-provider pass each (`@requires` scenarios) | the same pass is replayed |
| `incompat4` | the declared incompatibility with `sarg.magicalmenagerie` still behaves as declared | the other mod changes |
| `restart3` | settings persistence across a restart (seq1, seq2), green 41a1 | replayed |
| `ads2b`, `dogsmate2`, `crossbreeding`, `achievements2` | one animal-mod pass each, green | the same pass is replayed |
| `studio8` | the seven gallery pictures (originals); `Art/gallery/` holds the published versions | the gallery is uploaded |

## Conditions for `tested`

- No scenario left in `@wip`: repaired and replayed, or deleted with its justification.
- Every conditional scenario (`@requires:<packageId>`) has had its pass, on a map that loads
  that mod, and its report was read (suite and scenario names checked).
- No manual test left to validate: each is automated and green, or listed as not
  applicable with its reason. `@review` captures are still looked at.

## Settings

`dotnet run --project Tests/UnitTests/UnitTests.csproj -c Release` runs the game-free rules of the
settings (`Source/SpawnRules.cs`: defaults, bounds, clamping, blocked creature). Check-Mod.ps1 asserts
the settings contract (hidden shortcut, worker class, persistence fields) and Test-Validator.ps1 proves a
visible shortcut is rejected. The window, its effect on real spawns, persistence across restart and the
RIMMSQOL route need a running game and belong to `done -> tested` (scenario F13 in Tests/FUNCTIONAL.md).

## Patch tests: the animal-mod integrations without the game (2026-10-01)

`Tests/UnitTests/PatchTests.cs`, run by the same command as the settings rules (`dotnet run --project Tests/UnitTests/UnitTests.csproj -c Release`),
applies the three real patch files (`AnimalProsthetics2Patch.xml`, `DogsMatePatch.xml`, `BetterCrossbreedingPatch.xml`) to small stand-ins of the other mods' definitions
and checks the result. `PUBLISHING.md` suggests Python with `lxml`; this suite is C#, so it uses **`System.Xml.XPath`** (`XDocument.XPathSelectElements`) instead.

- **Why it is as good as `lxml`, or better.** What matters is that the xpath is evaluated with XPath 1.0 semantics, as the game does: the game calls
  `XmlDocument.SelectNodes`, which is the .NET XPath 1.0 engine, the one used here, whereas `ElementTree` only knows a subset. A predicate such as
  `[@Name="A" or "B"]`, true for every node because `"B"` is a non-empty string, behaves here as it does in the game: a test ("ADS 2: the trap predicate...")
  proves it.
- **What the engine covers.** A minimal reader of the operations these patches use: `PatchOperationSequence`, `PatchOperationFindMod`, `PatchOperationConditional`,
  `PatchOperationAdd` and `PatchOperationAddModExtension`, with the active mods as a list of display names for `FindMod`. Any other operation class throws
  `unknown operation` instead of being skipped, so a new kind of patch cannot slip through untested: add it to `Apply` first.
- **What it does not cover** (the Pickle passes do): the real mods' load order, what they do with the lists at game start, `MayRequire` attributes, and the game's own
  merging of abstract parents. A green here says the patch writes what it means to write on a document shaped like the target's; it does not say the target is shaped
  like that. The shapes were read from the providers' own files (Dogs mate's `sarg.magicalmenagerie.xml`, ADS 2's `Animal_Categories.xml`, Better Crossbreeding's DLL).
- **Cases.** ADS 2: a Cat3 animal in all three lists, Cat2 in two, Cat1 in one, the three left out on purpose absent, existing users kept, another recipe untouched,
  document unchanged without `ADS_Cat1`. Dogs mate: the boar joins `Pig`, the groups Dogs mate's own patch fills are not touched, an unnamed group is untouched, document
  unchanged without the groups. Better Crossbreeding: the pairs on both races and the outcomes on the mother, an existing `canCrossBreedWith` list extended and not
  duplicated, the capital-B `DZY.CrossBreeding.Extension`.
- **Proof the tests can fail.** Each trap was put back in a copy of the patch (a bare `Add` on `<race>`, the predicate without `@Name=`, the wrong class spelling)
  and the test turned red before it was trusted.

## Passes (declared 2026-09-26, rewritten 2026-10-10)

The Pickle suite is in [Tests/Pickle](Tests/Pickle/README.md): 19 features, 68 scenarios, written; the passes below have been played
on the 2026-10-05 revision except where noted (evidence in `Tests/Pickle/Evidence/`, one line per run in `docs/runs/`).
Three families, as AUDIT.md asks:

1. **Without the optional mods** (default map `wsl-deps.map`): minimal English and minimal French, one pass per language, plus the
   restart pair (`07-restart-write` then `08-restart-read`, one launch chain). Three more passes with their own map: the translation
   report of the game (`wsl-deps.translation.map`, French only: the game writes no report for English), the gallery
   (`wsl-deps.sanctuary.map`, the owner's captures) and the studio pass (`wsl-deps.studio.map`, superseded by the sanctuary one).
2. **With the optional mods, one pass per exclusive combination**: `avec-facultatifs` (Advanced Biomes, Elves, Nature's Pretty Sweet,
   Nocturnal Animals, Vanilla Cooking Expanded), `avec-genetics`, `avec-giddyup`, `avec-rwom`, `avec-treechop`, `avec-achievements`,
   `avec-ads2`, `avec-dogsmate`, `avec-crossbreeding`, and `avec-rimmsqol` (the settings shortcut). Every `@requires:<packageId>` of the
   suite is mounted by one of these maps.
3. **One pass per declared incompatibility**: `incompat-magicalmenagerie` (the original mod, still incompatible as declared).

Not tested on purpose (`AUDIT.md`: the mod does not change it): the behaviour of vanilla and of other mods left as they are.
