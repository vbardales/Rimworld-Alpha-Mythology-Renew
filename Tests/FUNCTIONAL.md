# Functional acceptance scenarios

Execution status: **NOT RUN** for every scenario below. A successful build or static
check does not change this status. Use a disposable colony and copies of saves.

## Test setup and evidence

Record the tested Git commit, RimWorld build, DLCs, Harmony/VEF versions, language,
mod order, and optional provider versions. Baseline: Core + required DLCs if any,
Harmony, Vanilla Expanded Framework, this mod; exclude original Alpha Mythology
and Animal Ark initially. Enable developer mode, start a temperate forest map,
and keep a backup before each destructive case. Use normal game actions to kill,
operate or hatch; debug deletion does not exercise death callbacks.

For each case record PASS / FAIL / BLOCKED, actual result, save name, screenshots
when useful, and Player.log. Clear the displayed log between cases but retain a
copy of the full log. A missing provider is BLOCKED, never PASS. Compare behaviour
against the checked-out XML and current dependency behaviour, not only old reports.

## Scenarios

### F01 — Startup and all 25 creatures

1. Start the baseline game and create the test colony. Inspect the startup log.
2. Enumerate all PawnKindDef entries in Mod/Defs; spawn each of the 25 kinds once.
3. For each, inspect the info panel, four facings, movement, feeding, sounds and corpse.
4. Record a per-creature result; spawn babies where their life stages differ.

Expected: all 25 kinds spawn, with no missing graphics, unresolved defs/classes,
patch errors or exceptions. Behaviour matches race diet and movement definitions.

### F02 — Phoenix rebirth, each life stage

1. Spawn baby, juvenile and adult MM_Phoenix on separate clear test areas.
2. Place expendable targets at measured distances around each phoenix.
3. Kill each through damage. Record explosion count, affected area and egg count.
4. Repeat enough times to observe both one and two eggs; not observing the rare
   outcome in a small sample is inconclusive, not automatically a failure.
5. Incubate eggs at a valid temperature through their configured hatch duration.

Expected: one death explosion; intended radii 3.9 / 4.9 / 5.9 cells by life stage;
one or two fertilized eggs survive their parent's explosion and hatch as phoenixes.
Also repeat on a crowded tile containing an existing egg stack: confirm placement
or merging does not lose eggs or leave them vulnerable to the explosion.

### F03 — Phoenix egg controls

1. Select a fertilized phoenix egg; inspect destroy/cancel commands and icons.
2. Request destruction, cancel it, then request it again and let a pawn execute it.
3. Repeat once in English and once in French, allowing documented English fallback.

Expected: commands display readable labels, icons resolve, cancellation preserves
the egg, execution removes the designated egg without an exception or a phoenix.
Unresolved localization keys are a failure to record, not an accepted fallback.

### F04 — Recurring bleeding and persistence

1. Apply MM_BleedingWound to a healthy test pawn and record damage over time.
2. Save partway through an interval; reload and observe continued periodic damage.
3. Remove the hediff and continue simulation; compare with a control pawn.

Expected: periodic MM_UncontrollableBleeding damage while the hediff remains active;
no exception on load and no continued damage from this hediff after removal.
Current code uses a 65-tick interval (counter triggers after exceeding 64).
Other blood-loss conditions must be distinguished from this periodic damage.

### F05 — Shutdown recipe

1. Identify a race offering MM_ShutDownMechanoid in the loaded defs; spawn a valid
   patient and prepare a capable operator. If none offers it, record BLOCKED and
   investigate reachability rather than claiming the recipe was tested.
2. Confirm the operation targets the brain; perform it through the surgery bill.
3. Inspect patient death, operator/colony thoughts and the log.

Expected: one death, no null-reference exception, and execution consequences
consistent with OrganHarvesting and the pawns' beliefs. On a patient with no brain,
no invalid body-part selection should be offered.

### F06 — Ranged attacks and automatic-fire toggle

1. Tame a chimera and another ranged creature; provide valid hostile targets.
2. Toggle automatic attacks off/on, then test explicit target commands separately.
3. Repeat with creatures in a manhunter pack and an unreachable target.

Expected: the automatic-fire toggle is respected, attacks/projectiles resolve,
and no recurring exceptions or severe sustained slowdown occur. Record which
behaviour comes from VEF. Repeat with other ranged-animal providers separately.

### F07 — Production, regeneration and trainability

1. For every race with egg/milk production, allow one normal production cycle.
2. Confirm product type, count, hatch target and valid incubation temperature.
3. Put an injured pawn near a Kitsune; compare healing with a pawn outside its range.
4. Check taming and training options against each race's trainability definition.

Expected: products and regeneration match the loaded defs; no missing products,
unexpected hatch species or training options inconsistent with the definitions.

### F08 — Basilisk vegetation regression

1. Let a basilisk create dead grass and a dead bush in a crop area.
2. Order a colonist to cut each plant, then sow the cleared cells.
3. Repeat on the minimal mod list before testing additional plant mods.

Expected: plants can be removed and cells reused; no endless cutting job and no
missing harvesting SoundDef error. Historical Workshop reproduction case.

### F09 — Tlilcoatl damage regression

1. Record the loaded projectile's damage type and intended immunities.
2. Attack an organic target, a mechanoid and a shielded target under equal conditions.
3. Compare damage/effects to those definitions; save the combat log.

Expected: damage and shield interaction match current definitions. Do not treat an
old Workshop complaint as proof of a current defect or assume all poison types
share the same immunity rules.

### F10 — Save/reload and Animal Ark coexistence

1. Save a colony containing every creature kind, eggs and an active bleeding wound.
2. Exit to desktop, restart with the same mod list and reload; compare counts/state.
3. Separately enable the reduced Animal Ark and repeat startup/spawn checks.
4. Attempt migration only on a COPY of an older Animal Ark save; retain the original.

Expected for a native save: no missing pawns/items or lost hediff state. Reduced
Animal Ark must introduce no duplicate defs/classes. Migration is a separate result:
namespace-related failures must be recorded and do not count as native-save failure.

### F11 — Optional integrations matrix

Run once with all optional providers absent, then one provider at a time with its
own dependencies. Record exact versions. Include Giddy-Up 2 Continued, legacy
Achievements/GeneticRim/NocturnalAnimals where compatible versions exist, and each
other provider named in Mod/Patches. Do not combine them until individual runs pass.

Expected without providers: no unresolved optional type/def or patch error.
With Giddy-Up: griffin, pegasus, unicorn and manticore mounting, saddle placement
and bonuses agree with provider settings. For other providers verify the actual
feature changed by each patch; a passing XML guard alone is insufficient.

### F12 — Kappa harvesting compatibility regression

1. Test a tamed Kappa harvesting mature crops with the baseline mod list.
2. Add Tree Chopping Speed Stat (if a compatible version exists) and repeat.

Expected: harvesting jobs complete without PawnWillingToCutPlant/ThinkNode
null-reference exceptions. Record the provider-dependent result separately.

## Result record (copy once per scenario, and per creature/provider as needed)

- Scenario / variant:
- Date / tester / Git commit:
- RimWorld / DLC / dependency versions / language:
- Save and exact mod order:
- Steps actually executed:
- Expected result:
- Actual result:
- PASS / FAIL / BLOCKED:
- Player.log / screenshot / save paths:
- Issue and retest reference:

Release acceptance requires the baseline cases to pass, documented outcomes for
supported optional providers, and explicit disclosure of untested migration paths.

## F13 - Settings (NOT RUN)

Preconditions: new colony with this mod, VEF and Harmony; a second run with RIMMSQOL for step 6.
1. Mod options -> Alpha Mythology Renew (unofficial): the window opens with multiplier 1 and all 25 creatures checked.
2. Set the multiplier to 5, then to 0.1: label and tooltip follow; the value never leaves 0.1-5.
3. Uncheck one creature, spawn wild animals in a biome that hosts it (dev mode, "Spawn a wild animal" pressure or many days): it never appears; others still do.
4. Restore defaults: multiplier 1, all checked. Close, reopen: values kept. Restart the game: values kept.
5. Confirm no MainButton is visible or greyed out on a clean configuration.
6. With RIMMSQOL, reveal the shortcut: it opens the same window with the same values; hide it again, restart, visibility kept.
7. Repeat 1-4 in English and French: no raw key, no clipping of the header and checkbox rows.
8. Player.log during all of the above: no error from this mod.
