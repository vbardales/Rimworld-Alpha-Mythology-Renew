# Backlog - Alpha Mythology Renew (unofficial)

This mod's own backlog (the monorepo has its own). Ordered by what blocks the next stage. Opened 2026-09-26.

## First Pickle runs and their fallout (`Mod/` and `Tests/Pickle` are no longer frozen: the tree moves at every fix)

- [x] **Remove the unused textures.** (Caveat: a texture can be loaded by convention with no Def naming it, e.g. the "Pack" overlay of a pack animal; check before removing.) DONE 2026-09-26, merged in 78ee4b0 (was: prepared on a branch): branch `cleanup/unused-textures` (worktree
  `../AlphaMythologyRenew-cleanup`, commit `7fd51c9`, 25 files: 15 cards, 4 Mechataur, 3 Catoblepas pack overlays,
  `MM_Firebreath`, `MM_GazeAttack`, the original logo). Check-Mod and the translation check pass on it.
  The 3 Catoblepas pack overlays were wrongly removed (the game loads them by convention, no Def names them): found
  by the first full run (en2) and restored 2026-09-26 (4ab9496). The Mechataur textures hint at an unreleased
  creature of the original: if the owner wants it ported, keep them and drop them from any future removal commit.
  Not removed on purpose: `MM_FenghuangEgg_a copy.png` (a folder-loaded egg graphic uses every file of its folder;
  its odd name is harmless, its rename is not needed).
- [x] **Move the drafts into `Tests/Pickle/`**: done directly when the features were written (`docs/gallery-draft/`,
  `docs/scenarios-draft/`, `docs/optional-passes-draft/` were never created; their content is in
  `Tests/Pickle/Mod/Pickle/Features/09` through `11`).
- [x] **File the other passes**: French (5a25), restart pair (c039, then 53a2 after the settings fix), RIMMSQOL
  (92ec, green), studio/gallery (5bc7), optional integrations (d62d), Giddy-Up (f431), incompatibility probe (778c),
  treechop (eef1, then 8421 after the fixture fix). Filed does not mean read: see `STATUS.md` for which have
  returned a verdict.

## Patch compatibility (decision pending)

- [ ] **Nature's Pretty Sweet patch is guarded by a mod name** ("Nature's Pretty Sweet") and the installed page is
  "Nature's Pretty Sweet (Continued)": `PatchOperationFindMod` compares names, so it is expected not to apply.
  Same weakness for every patch guarded by a display name (Advanced Biomes, Elves, Achievements, Cooking, Genetics,
  RimWorld of Magic, Nocturnal Animals lists both spellings by hand).
- [x] **Owner's direction, 2026-09-26: go back to the library she proposed, built on Use This Instead** (UTI, Workshop
  3396308787, MIT, by Mlie). DONE 2026-09-27: `../ResolveThisInstead/` decided its own shape (its README, "Open design
  questions") — no patch operation rewrite, no live lookup call from ours; it patches `ModLister.HasActiveModWithName`
  (what `PatchOperationFindMod` calls) and `ModsConfig.IsActive` globally during loading, and answers only for a pair a
  consuming mod vouches for. Wired as a required dependency in `03d1a9d` (About.xml, Check-Mod, wsl-ids.map); vouched
  for the one confirmed pair, Nature's Pretty Sweet -> Nature's Pretty Sweet (Continued), in the new
  `Mod/About/ResolveThisInstead.xml` — `NatureIsPrettySweetPatch.xml` itself is untouched (a comment there explains
  why). The other seven name-guarded patches (Advanced Biomes, Elves, Achievements, Cooking, Genetics, RimWorld of
  Magic, Nocturnal Animals) already carry the currently-installed name and are not confirmed broken: no vouch entry
  added for them without a confirmed old name, since a wrong pair is worse than none (see the comment in the new file).
  Checked 2026-09-27 (STATUS.md, "the other seven name-guarded patches checked against installed names"): all seven
  match the currently-installed name (six read locally, one — Achievements — by web search, not installed here).
  Nature's Pretty Sweet was the only actually-drifted guard, not a symptom of a wider problem; this item is closed.
  Two traps in the UTI data, kept in mind should one of these seven ever turn out to drift later: the Elves have two
  "Continued" pages (3383096916 and zal's 3548255064), and some rules have an empty `oldPackageId`.

## Before `tested` (see `STATUS.md`)

- [x] Settings runtime checks (F13 and the Pickle suite): window, effect on wild spawns and RIMMSQOL all green
  (en2, 92ec). Persistence found a real defect (blocked creatures lost at restart, fixed in f5e8956); pass 53a2
  is the re-run that proves the fix. `settings_audit` stays `partial` until it returns green.
- [x] Wisp, phoenix death and legacy patches now have a scenario (`13-phoenix.feature`, the wisp text scenario of
  `11-behaviour-and-incompatibility.feature`, `10-integrations.feature`).
- [x] Passes for optional integrations and the declared incompatibility with `sarg.magicalmenagerie`: green
  (facultatifs5, incompat4, giddyup, genetics, treechop2/8421, rwom 3818 with JecsLite). See `STATUS.md`.
- [ ] No `@wip` (confirmed, none left); minimal EN/FR baseline (PLAIN filter) not re-run since the settings and
  fixture fixes, so "every `@requires` pass played" is not fully confirmed yet; no manual test done.

## Before `prepublished` / `published` (see `PUBLICATION.md`)

- [ ] Gallery images opened and ordered; strong-language grep of the texts for the adult-content boxes.
- [ ] Register rows and drafts for the optional providers (ids resolved); decide whether to comment on the original's page.
- [ ] Resolve the description tail in `About.xml` (`IF I GO QUIET`, `AI-GENERATED`, `THANKS`).
- [ ] **A pull request to `juanosarg/AlphaMythology` is required** (Virginie, 2026-09-28: when an upstream exists, the PR is systematic, not optional; PUBLISHING.md says so now). Steps: fork the original (public action: her go, then the fork and the PR are made together), prepare the change against ITS layout (this port is a rebuilt tree, not a diff of theirs: read their open PR #3, which already proposes a 1.6 update, and PR #2, which targets a Giddy-Up fork marked outdated, before writing anything), send only what she has read. Not started: no fork exists, nothing is proposed yet.

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

## Decision, 2026-09-26: Resolve This Instead becomes a required dependency

Virginie: the patches will not be fixed one by one; the new library (`../ResolveThisInstead/`) is added as a **required**
dependency of this mod and the guards use it. Consequences to carry out when the tree is unfrozen and the library exists:
- [ ] `About.xml`: a `modDependencies` entry (packageId, display name, Workshop url) and `loadAfter`; it forces a download
  for every player, even one without any optional mod: accepted by the owner.
- [ ] Publication order: the library must have a public Workshop page before this mod's `1.0.0`. The `0.1.0`
  pre-publication only creates the private item and can go before it (add the dependency after).
- [ ] `Tests/Check-Mod.ps1` (dependency list), the staging (`wsl-ids.map` or a `path:` line) and every pass map must stage it.
- [ ] Rewrite the 8 name guards as calls to the library; replay the optional-integration pass with the providers'
  current names, and `10-integrations.feature`'s Nature's Pretty Sweet scenario should then pass.
- [ ] Credits: THANKS and the register for Use This Instead (Mlie, MIT) and the library; PUBLICATION.md dependency table.

## Dead code and content found by the audit (2026-09-26)

- [x] **The shutdown recipe** (`MM_ShutDownMechanoid`, `Recipe_ShutDown`, its French text, its Check-Mod assertions and 3
  inventory rows) was offered by no race: its only user was the Mechataur, which the port does not ship. Removed in a
  dedicated commit; the DLL is rebuilt (no `Recipe_ShutDown`), Check-Mod 334, translations 590 fields and 589 injections.
  ATTRIBUTION (both copies) and the About description no longer mention it.
- [x] **Look for other orphans**: DONE 2026-09-26 by token references (157 defs, every one referenced by another def, patch, code or translation, apart from its own definition). Limits: a pair of same-name defs (a kind and its race) count as referencing each other, and a mention in a comment counts; the removed recipe was the only orphan found.
- [ ] **Decide the in-game scenarios still open** (see the automation map in `Tests/FUNCTIONAL.md`): F06 smoke test of a
  ranged creature, F07 forced production and the Kitsune's healing, F08 dead-plant cutting, F09 the tlilcoatl damage
  comparison, F12 kappa harvesting with a third-party mod. F03's colonist execution is VEF's code (proposed not applicable).

## Tree Chopping Speed Stat and the kappa (from the owner's link, 2026-09-26)

- [ ] **Known issue of the original, not yet checked on 1.6**: Tree Chopping Speed Stat (Workshop 2566231583, velcroboy333,
  packageId `TreeChoppingSpeed.velcroboy333`, supports 1.2 to 1.6, installed here) prefixes
  `PlantUtility.PawnWillingToCutPlant_Job` and throws a NullReferenceException for a creature that has no
  `VBY_TreeChopWorkSpeed` stat; the original's kappa harvests through VEF's `JobGiver_Harvest` and triggers it (discussion of
  24 Nov 2023 on that page; the errors repeat while the kappa is in the colony). Feature 17's provider scenario plays the call
  in the pass `wsl-deps.avec-treechop.map`. If it fails, the fix is a patch giving the kappa that stat (guarded by that mod,
  through the resolver library once it exists), in `Mod/`.
- [x] Pass filed and green (8421, `treechop2`): both F12 scenarios passed, the provider guard and the real VEF
  harvest path. Credit for the register and THANKS: still to do.

**Update 2026-09-26 (late):** the library's packageId is confirmed by Virginie: `nelim.resolvethisinstead` (the display name may
change, the id will not). It must **not** go into `About.xml` yet: the staging script stages every hard dependency the About
declares and needs its Workshop id or a `path:` for it, so declaring an unmountable dependency now would stop every queued
Pickle request. Add it (About `modDependencies`, `Check-Mod` list, and `nelim.resolvethisinstead path:ResolveThisInstead/Mod` in
the pass maps) in one commit when the library session says its folder is mountable, and re-file the passes then. Its proof of
concept is queued in the Pickle file (request `20260926-222716-133-fd04`) and decides the design.
