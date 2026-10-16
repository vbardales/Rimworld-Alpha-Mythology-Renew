# Backlog - Alpha Mythology Renew (unofficial)

Mod's own backlog (monorepo has its own). Ordered by what blocks next stage. Opened 2026-09-26.

## First Pickle runs and their fallout (`Mod/` and `Tests/Pickle` are no longer frozen: the tree moves at every fix)

- [x] **Remove unused textures.** (Caveat: texture can load by convention with no Def naming it, e.g. "Pack" overlay of pack animal; check before removing.) DONE 2026-09-26, merged in 78ee4b0 (was: prepared on branch): branch `cleanup/unused-textures` (worktree
  `../AlphaMythologyRenew-cleanup`, commit `7fd51c9`, 25 files: 15 cards, 4 Mechataur, 3 Catoblepas pack overlays,
  `MM_Firebreath`, `MM_GazeAttack`, original logo). Check-Mod and translation check pass on it.
  3 Catoblepas pack overlays wrongly removed (game loads them by convention, no Def names them): found
  by first full run (en2), restored 2026-09-26 (4ab9496). Mechataur textures hint at unreleased
  creature of original: if owner wants it ported, keep them and drop from any future removal commit.
  Not removed on purpose: `MM_FenghuangEgg_a copy.png` (folder-loaded egg graphic uses every file of its folder;
  odd name harmless, rename not needed).
- [x] **Move drafts into `Tests/Pickle/`**: done directly when features written (`docs/gallery-draft/`,
  `docs/scenarios-draft/`, `docs/optional-passes-draft/` never created; content in
  `Tests/Pickle/Mod/Pickle/Features/09` through `11`).
- [x] **File other passes**: French (5a25), restart pair (c039, then 53a2 after settings fix), RIMMSQOL
  (92ec, green), studio/gallery (5bc7), optional integrations (d62d), Giddy-Up (f431), incompatibility probe (778c),
  treechop (eef1, then 8421 after fixture fix). Filed not mean read: see `STATUS.md` for which
  returned verdict.

## Patch compatibility (decision pending)

- [ ] **Nature's Pretty Sweet patch guarded by mod name** ("Nature's Pretty Sweet"), installed page is
  "Nature's Pretty Sweet (Continued)": `PatchOperationFindMod` compares names, so expected not to apply.
  Same weakness for every patch guarded by display name (Advanced Biomes, Elves, Achievements, Cooking, Genetics,
  RimWorld of Magic, Nocturnal Animals list both spellings by hand).
- [x] **Owner's direction, 2026-09-26: go back to library she proposed, built on Use This Instead** (UTI, Workshop
  3396308787, MIT, by Mlie). DONE 2026-09-27: `../ResolveThisInstead/` decided own shape (its README, "Open design
  questions") — no patch operation rewrite, no live lookup call from ours; patches `ModLister.HasActiveModWithName`
  (what `PatchOperationFindMod` calls) and `ModsConfig.IsActive` globally during loading, answers only for pair consuming mod vouches for. Wired as required dependency in `03d1a9d` (About.xml, Check-Mod, wsl-ids.map); vouched
  for the one confirmed pair, Nature's Pretty Sweet -> Nature's Pretty Sweet (Continued), in new
  `Mod/About/ResolveThisInstead.xml` — `NatureIsPrettySweetPatch.xml` itself untouched (comment there explains
  why). Other seven name-guarded patches (Advanced Biomes, Elves, Achievements, Cooking, Genetics, RimWorld of
  Magic, Nocturnal Animals) already carry currently-installed name, not confirmed broken: no vouch entry
  added without confirmed old name, since wrong pair worse than none (see comment in new file).
  Checked 2026-09-27 (STATUS.md, "the other seven name-guarded patches checked against installed names"): all seven
  match currently-installed name (six read locally, one — Achievements — by web search, not installed here).
  Nature's Pretty Sweet only actually-drifted guard, not symptom of wider problem; item closed.
  Two traps in UTI data, keep in mind if one of these seven ever drifts later: Elves have two
  "Continued" pages (3383096916 and zal's 3548255064), some rules have empty `oldPackageId`.

## Before `tested` (see `STATUS.md`)

- [x] Settings runtime checks (F13 and Pickle suite): window, effect on wild spawns and RIMMSQOL all green
  (en2, 92ec). Persistence found real defect (blocked creatures lost at restart, fixed in f5e8956); pass 53a2
  is re-run proving fix. `settings_audit` stays `partial` until green.
- [x] Wisp, phoenix death and legacy patches now have scenario (`13-phoenix.feature`, wisp text scenario of
  `11-behaviour-and-incompatibility.feature`, `10-integrations.feature`).
- [x] Passes for optional integrations and declared incompatibility with `sarg.magicalmenagerie`: green
  (facultatifs5, incompat4, giddyup, genetics, treechop2/8421, rwom 3818 with JecsLite). See `STATUS.md`.
- [ ] No `@wip` (confirmed, none left); minimal EN/FR baseline (PLAIN filter) not re-run since settings and
  fixture fixes, so "every `@requires` pass played" not fully confirmed; no manual test done.

## Before `prepublished` / `published` (see `PUBLICATION.md`)

- [ ] Gallery images opened and ordered; strong-language grep of texts for adult-content boxes.
- [ ] Register rows and drafts for optional providers (ids resolved); decide whether to comment on original's page.
- [x] Resolve description tail in `About.xml` (`IF I GO QUIET`, `AI-GENERATED`, `THANKS`). DONE 4516a19; kept
  current since (Resolve This Instead, Tree Chopping Speed Stat credits added).
- [ ] **Pull request to `juanosarg/AlphaMythology` required** (Virginie, 2026-09-28: when upstream exists, PR systematic, not optional; PUBLISHING.md says so now). Steps: fork original (public action: her go, then fork and PR made together), prepare change against ITS layout (port is rebuilt tree, not diff of theirs: read their open PR #3, already proposes 1.6 update, and PR #2, targets Giddy-Up fork marked outdated, before writing anything), send only what she read. Not started: no fork exists, nothing proposed yet.

## Ideas

- [ ] **Mod Error Checker** (Workshop 2877266511, Taranchuk, 1.4 to 1.6): at startup reports, with mod names, old
  assemblies with missing fields or methods and XML errors such as missing thing class, worker class, comp class or
  sound file. Shown by Virginie 2026-09-26. Possible use: stage in optional-integration pass
  (`docs/optional-passes-draft/`) to catch legacy patch naming class no longer existing in provider, which
  `PatchOperationFindMod` alone never shows. Not evaluated: whether stageable headless in WSL, whether
  output readable from Pickle report (`an error matching ... was logged` would be way to assert it).
- [ ] **IExposable checker** (Workshop 3522689097, xylthixlm, 1.6, tiny audience: 7 subscribers 2026-09-26): warns about
  `IExposable`, `ThingComp` and `HediffComp` classes whose fields not all referenced in `ExposeData` (`[Unsaved]`
  silences deliberate one). Shown by Virginie. Relevant: mod ships saved custom hediff
  (`Hediff_BleedingWound.tickCounter`, saved) and `ModSettings` class (`spawnMultiplier`, `blockedKinds`, both saved); pass with it staged would show any forgotten field, and save-migration scenario (never run) concerns exactly that hediff.
  Not evaluated: headless staging, how warnings appear in log for Pickle assertion.
- [ ] **Mod Compatibility Checker** (Workshop 3737125696, 秋羽雪绪0w0, 1.6, requires Harmony): in-game window scanning
  enabled mods for conflicts, missing files and integrity, detects spam errors, exports mod list, can send errors
  to AI through API player configures. Author says most written with Codex. Shown by Virginie. Not
  resolver of renamed mods, not usable headless (window and API); at most manual aid. Source:
  `github.com/TKELHCI/RimWorldMOD-ModCompatChecker`, not read.

## Decision, 2026-09-26: Resolve This Instead becomes a required dependency

Virginie: patches not fixed one by one; new library (`../ResolveThisInstead/`) added as **required**
dependency of mod, guards use it. Consequences to carry out when tree unfrozen and library exists:
- [ ] `About.xml`: `modDependencies` entry (packageId, display name, Workshop url) and `loadAfter`; forces download
  for every player, even one without optional mod: accepted by owner.
- [ ] Publication order: library must have public Workshop page before mod's `1.0.0`. `0.1.0`
  pre-publication only creates private item, can go before it (add dependency after).
- [ ] `Tests/Check-Mod.ps1` (dependency list), staging (`wsl-ids.map` or `path:` line) and every pass map must stage it.
- [ ] Rewrite 8 name guards as calls to library; replay optional-integration pass with providers'
  current names, `10-integrations.feature`'s Nature's Pretty Sweet scenario should then pass.
- [ ] Credits: THANKS and register for Use This Instead (Mlie, MIT) and library; PUBLICATION.md dependency table.

## Dead code and content found by the audit (2026-09-26)

- [x] **Shutdown recipe** (`MM_ShutDownMechanoid`, `Recipe_ShutDown`, French text, Check-Mod assertions and 3
  inventory rows) offered by no race: only user was Mechataur, port does not ship. Removed in
  dedicated commit; DLL rebuilt (no `Recipe_ShutDown`), Check-Mod 334, translations 590 fields and 589 injections.
  ATTRIBUTION (both copies) and About description no longer mention it.
- [x] **Look for other orphans**: DONE 2026-09-26 by token references (157 defs, every one referenced by another def, patch, code or translation, apart from own definition). Limits: pair of same-name defs (kind and its race) count as referencing each other, mention in comment counts; removed recipe only orphan found.
- [ ] **Decide in-game scenarios still open** (see automation map in `Tests/FUNCTIONAL.md`): F06 smoke test of
  ranged creature, F07 forced production and Kitsune's healing, F08 dead-plant cutting, F09 tlilcoatl damage
  comparison, F12 kappa harvesting with third-party mod. F03's colonist execution is VEF's code (proposed not applicable).

## Tree Chopping Speed Stat and the kappa (from the owner's link, 2026-09-26)

- [ ] **Known issue of original, not yet checked on 1.6**: Tree Chopping Speed Stat (Workshop 2566231583, velcroboy333,
  packageId `TreeChoppingSpeed.velcroboy333`, supports 1.2 to 1.6, installed here) prefixes
  `PlantUtility.PawnWillingToCutPlant_Job`, throws NullReferenceException for creature with no
  `VBY_TreeChopWorkSpeed` stat; original's kappa harvests through VEF's `JobGiver_Harvest`, triggers it (discussion of
  24 Nov 2023 on that page; errors repeat while kappa in colony). Feature 17's provider scenario plays call
  in pass `wsl-deps.avec-treechop.map`. If fails, fix is patch giving kappa that stat (guarded by that mod,
  through resolver library once exists), in `Mod/`.
- [x] Pass filed and green (8421, `treechop2`): both F12 scenarios passed, provider guard and real VEF
  harvest path. Credit for register and THANKS: still to do.

**Update 2026-09-26 (late):** library's packageId confirmed by Virginie: `nelim.resolvethisinstead` (display name may
change, id will not). Must **not** go into `About.xml` yet: staging script stages every hard dependency About
declares, needs its Workshop id or `path:` for it, so declaring unmountable dependency now would stop every queued
Pickle request. Add it (About `modDependencies`, `Check-Mod` list, and `nelim.resolvethisinstead path:ResolveThisInstead/Mod` in
pass maps) in one commit when library session says folder mountable, re-file passes then. Proof of
concept queued in Pickle file (request `20260926-222716-133-fd04`), decides design.