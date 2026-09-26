# Backlog - Alpha Mythology Renew (unofficial)

This mod's own backlog (the monorepo has its own). Ordered by what blocks the next stage. Opened 2026-09-26.

## Waiting for the first Pickle run (Mod/ and Tests/Pickle are frozen until `RUN_DONE`)

A request stages the working tree when it is played, so nothing below may touch `Mod/` or `Tests/Pickle/` before
request `20260926-111909-647-4d36` is done. Everything that does is prepared elsewhere.

- [ ] **Remove the unused textures.** Prepared, not merged: branch `cleanup/unused-textures` (worktree
  `../AlphaMythologyRenew-cleanup`, commit `7fd51c9`, 25 files: 15 cards, 4 Mechataur, 3 Catoblepas pack overlays,
  `MM_Firebreath`, `MM_GazeAttack`, the original logo). Check-Mod and the translation check pass on it. After
  `RUN_DONE`: merge, rebuild nothing (no code), re-run Check-Mod, then remove the worktree. The Mechataur textures hint
  at an unreleased creature of the original: if the owner wants it ported, keep them and drop them from the commit.
  Not removed on purpose: `MM_FenghuangEgg_a copy.png` (a folder-loaded egg graphic uses every file of its folder;
  its odd name is harmless, its rename is not needed).
- [ ] **Move the drafts into `Tests/Pickle/`**: `docs/gallery-draft/` (5 Workshop pictures) and
  `docs/optional-passes-draft/` (8 integration scenarios, two pass maps). Then rebuild the steps DLL and redo the
  step-text check.
- [ ] **File the other passes** once the first verdict is read: French, restart pair, RIMMSQOL, studio (gallery),
  optional integrations, Giddy-Up.

## Patch compatibility (decision pending)

- [ ] **Nature's Pretty Sweet patch is guarded by a mod name** ("Nature's Pretty Sweet") and the installed page is
  "Nature's Pretty Sweet (Continued)": `PatchOperationFindMod` compares names, so it is expected not to apply.
  Same weakness for every patch guarded by a display name (Advanced Biomes, Elves, Achievements, Cooking, Genetics,
  RimWorld of Magic, Nocturnal Animals lists both spellings by hand).
- [ ] **Owner's direction, 2026-09-26: go back to the library she proposed, built on Use This Instead** (UTI, Workshop
  3396308787, MIT, by Mlie), which re-resolves the compatible mods instead of hand-listed names. Its open rules file
  (`replacements.json.gz`, 2713 rules with old/new Workshop ids, names and packageIds) already links the original
  Nature's Pretty Sweet to its "(Continued)" page. Work happens in `../ModCompatResolver/` (README has the data and
  the four open design questions); this mod only consumes it. **No patch is changed until she has chosen the shape**
  (custom patch operation over a packageId alias set, live lookup in UTI, or both) and the mod's tree is unfrozen.
  Two traps found in the data: the Elves have two "Continued" pages (3383096916 and zal's 3548255064), and some rules
  have an empty `oldPackageId`.

## Before `tested` (see `STATUS.md`)

- [ ] Settings runtime checks (F13 and the Pickle suite): window, effect on wild spawns, persistence, RIMMSQOL.
- [ ] Passes for optional integrations and for the declared incompatibility with `sarg.magicalmenagerie`.
- [ ] Wisp, phoenix death and legacy patches have no scenario.
- [ ] No `@wip`, every `@requires` pass played, no manual test left.

## Before `prepublished` / `published` (see `PUBLICATION.md`)

- [ ] Gallery images opened and ordered; strong-language grep of the texts for the adult-content boxes.
- [ ] Register rows and drafts for the optional providers (ids resolved); decide whether to comment on the original's page.
- [ ] Resolve the description tail in `About.xml` (`IF I GO QUIET`, `AI-GENERATED`, `THANKS`).
- [ ] Optional: a pull request to `juanosarg/AlphaMythology` needs a fork first (public, owner's decision); their open
  PR #3 already proposes a 1.6 update, PR #2 targets a Giddy-Up fork marked outdated.

## Ideas

- [ ] **Mod Error Checker** (Workshop 2877266511, Taranchuk, 1.4 to 1.6): at startup it reports, with mod names, old
  assemblies with missing fields or methods and XML errors such as a missing thing class, worker class, comp class or
  sound file. Shown by Virginie on 2026-09-26. Possible use here: stage it in the optional-integration pass
  (`docs/optional-passes-draft/`) to catch a legacy patch naming a class that no longer exists in its provider, which
  `PatchOperationFindMod` alone never shows. Not evaluated: whether it can be staged headless in the WSL, and whether its
  output is readable from a Pickle report (`an error matching ... was logged` would be the way to assert it).
- [ ] **IExposable checker** (Workshop 3522689097, xylthixlm, 1.6, tiny audience: 7 subscribers on 2026-09-26): warns about
  `IExposable`, `ThingComp` and `HediffComp` classes whose fields are not all referenced in `ExposeData` (`[Unsaved]`
  silences a deliberate one). Shown by Virginie. Relevant here: this mod ships a saved custom hediff
  (`Hediff_BleedingWound.tickCounter`, saved) and a `ModSettings` class (`spawnMultiplier`, `blockedKinds`, both saved); a
  pass with it staged would show any field forgotten, and the save-migration scenario (never run) concerns exactly that hediff.
  Not evaluated: headless staging, and how its warnings appear in the log for a Pickle assertion.
- [ ] **Mod Compatibility Checker** (Workshop 3737125696, 秋羽雪绪0w0, 1.6, requires Harmony): an in-game window that scans
  enabled mods for conflicts, missing files and integrity, detects spam errors, exports the mod list, and can send errors
  to an AI through an API the player configures. Its author says most of it was written with Codex. Shown by Virginie. Not
  a resolver of renamed mods and not usable headless (window and API); at most a manual aid. Source:
  `github.com/TKELHCI/RimWorldMOD-ModCompatChecker`, not read.
