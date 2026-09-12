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
4. On a valid patient, perform the shutdown recipe and check the intended death and
   execution thought, without exceptions. Check the brain is the offered surgery part.
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
