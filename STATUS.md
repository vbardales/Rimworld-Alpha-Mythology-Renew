---
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythology
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
remote: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
visibility: public
workflow_stage: playTests[1.0.0]
licence: silent
licence_at: "2026-09-12: upstream master 53a5518008821188009bbf996b7120ad9593cb5f and the Workshop page reviewed (602 comments, Bug Reports thread); no project licence, no redistribution grant, no refusal found. Refreshed 2026-09-26. Only a retexture permission (2022-08-21, conditional on the game EULA) was found, not a licence for this port. Silent = public (owner's rule)."
upstream_mod_remotes:
  - https://github.com/juanosarg/AlphaMythology
settings_audit: partial
localization: complete
translation_en: complete
translation_fr: complete
workshop: "3811323347 (0.1.0, creation of the publishIdFile only, 2026-10-01; the item is private, switching it to public is the owner's)"
published: no
tested_on: never
audit_at: 2026-10-10
audit_revision: dbc114e22cf23ab64baa7a9047141d161d17abf2 (clean tree at the start; this audit then edited Tests/Test-Validator.ps1, CHANGELOG.md, TESTING.md, Tests/Pickle/README.md, STATUS.md)
automated_tests: "passed 2026-10-10: Tests/UnitTests ALL PASSED (spawn rules 13, patch checks 47); Release build 0 warnings 0 errors"
xml_tests: "passed 2026-10-10: Check-Mod.ps1 342 assertions, 86 XML files, 25 creatures; Test-Validator.ps1 7 negative cases (the runner was red before this audit, see Audit 2026-10-10); Check-Translations.py 590 fields, 589 French injections, 56 Keyed pairs (run through uv, no Python on PATH)"
functional_tests: "unverified in this audit; Pickle history reports green passes (see Tests): not re-read here"
remaining:
  - "2026-10-10 feature (publish 13.b): add the Alpha Mythology Renew row to ../USE_THIS_INSTEAD.md once the item is public (old Workshop id 1821617793, read the old name, author and versions on its page; new id 3811323347); the owner reports it to Use This Instead"
  - "2026-10-10 unverified (playTests): settings window, both routes (Mod options and the hidden MainButtons shortcut via RIMMSQOL), real effect on wild spawns, persistence after restart and reload, EN and FR layout"
  - "2026-10-10 unverified (playTests): English and French display in game, raw keys, clipping, optional integrations, wisp inspection text with the new plural keys"
  - "2026-10-10 unverified: save migration from Animal Ark (class names changed, untested by design) and manual gameplay"
  - "2026-10-10 unverified: optional-provider passes, ADS 2, Dogs mate, Better Crossbreeding and the incompatibility pass are reported green in the history (2026-09-27 to 2026-10-05); this audit did not re-read their reports"
  - "2026-10-10 unverified (shootGallery): the gallery is the old studio8 series plus picture 0; the sanctuary series (09-publication-shots.feature) is written and not filed"
  - "2026-10-10 unverified (playTests 8.m): code review; last review f3d8693ee1c469acc5286f14b03aff0202eeca71 (low effort, since 0.1.0); code_review_sha is not recorded in the front matter yet"
  - "2026-10-10 feature (owner's rule): pull request to juanosarg/AlphaMythology (phoenix egg lost in a stack), branch prepared in the fork vbardales/AlphaMythology, not sent; BACKLOG.md. Waits for the green phoenix proof it cites"
  - "2026-10-10 feature (writeDocs 11.h): register Covers completed (protocols commit 3a01556): Harmony, VEF, Pickle, RimLogging, RIMMSQOL, PickleTools, ADS 2, Nocturnal Animals, Dogs mate, Better Crossbreeding, Vanilla Cooking Expanded now list this mod. Still to do: the drafts in PUBLICATION.md for the drafted rows (RWoM, Advanced Biomes, Nature's Pretty Sweet, Elves, Giddy-Up 2, Vanilla Genetics Expanded, whose row is new and authors unread), and the PUBLICATION.md table rows for ADS 2, Dogs mate, Better Crossbreeding, Nocturnal, Genetics, Cooking. Resolve This Instead has no Workshop page, so no row"
  - "2026-10-10 feature (blocker before 1.0.0): Resolve This Instead (nelim.resolvethisinstead, hard dependency) needs its own public Workshop page first; no Workshop id yet"
  - "2026-10-10 feature: English text inherited from upstream is corrected by the upstream PR, not silently in the port; certain fix to join the planned PR: 'work load' to 'workload' in MM_UtilityWorkerDesc (English Keyed)"
  - "2026-10-10 unverified: the 1.0.0 is not sent; the description of PUBLICATION.md holds an em dash (2 in the file), rule of 2026-10-10"
updated: 2026-10-10
protocols_read_sha: a959f76528043543b1ac9025b40dc8efcefd9e56
---

# Alpha Mythology Renew (unofficial): status

Current state only. Journal of runs: `docs/runs/`. The earlier dated sections (2026-09-12 to 2026-10-09: licence audit, Pickle runs read, gallery
studio passes, French review rounds) are kept in git history up to commit `dbc114e` (`git show dbc114e:STATUS.md`); each is summed up below.

Standalone repository, public, `origin` the repository above; the Sanctuary Backlot (gallery scene) is a separate private repository. The original is
Sarg Bjornson's Alpha Mythology (Workshop 1821617793, source https://github.com/juanosarg/AlphaMythology); this port extracts its 25 creatures from Animal Ark,
under the packageId `nelim.alphamythology` (shortened 2026-09-27), with a C# assembly `AlphaMythologyRenew.dll` (three classes, Harmony postfixes for the settings),
hard dependencies Harmony, Vanilla Expanded Framework and Resolve This Instead.

## Audit 2026-10-10

Revision `dbc114e`, `main` two commits ahead of `origin`. Previous state `preTest` (old vocabulary, `stage: preTest`), retained state `localize[1.0.0]`.

- Re-run out of game: Check-Mod 342, Test-Validator 7 cases, unit tests, Check-Translations, Release build (see front matter). No RimWorld launched.
- **Defects found and fixed in this audit** (not to keep an older state): `Tests/Test-Validator.ps1` copied no `PUBLICATION.md` into its fixture while `Check-Mod.ps1` has read it since 2026-10-07, so the negative-case runner failed (fixed: the file is copied, 7 cases pass again);
  `CHANGELOG.md` `[unreleased]` did not list the animal-mod patches, the wisp plural keys, the phoenix egg fix, Resolve This Instead or the French rounds (3.c; entry added); `TESTING.md` and `Tests/Pickle/README.md` still said the Pickle suite was 16 scenarios, never played (rewritten: 68 scenarios, three families of passes, AUDIT.md).
- **Defect found, fixed after the audit (injections added, Virginie's reading pending)**: the French translation report of the game names two missing injections (front matter). First failing transition: `localize -> writeTests`, 6.c (every owned text resolves in the loaded game). `translation_fr` and `localization` go to `partial`; `translation_en` stays `complete` (the report is French only, English is the Def value).
- `settings_audit` was `complete` while the in-game checks are all unverified: corrected to `partial` (MOD_SETTINGS.md, AUDIT.md 5).
- Not checked: the shipped DLL is not byte-identical to a fresh build (hash differs; both from `e53da76`, the last commit of `Source/`, the build is probably not deterministic: not treated as a defect).
- Reserves, not blockers: `Tests/FUNCTIONAL.md` plays the role of `TEST_SCENARIOS.md` (name differs); `STATUS.md` was 129 KB, folded here (linter ERROR over 80 KB).
- The two injections are added (`Mod/Languages/French/DefInjected`), `Tests/Check-Translations.py` now requires them (`GAME_REPORTED`, 590 fields, 591 injections), `FRENCH_REVIEW.md` regenerated. Work to cross the next transition: have Virginie read the two rows (`translation_fr` to `complete`), (ticket c626 already green) then `Check-Status.ps1`, read the missing protocols, `Mark-ProtocolsRead.ps1`, set `writeTests[1.0.0]`.

## Transition 2026-10-10: writeTests to playTests

Exit of `writeTests` established at `eba7208d0e741ec31ca79513c893580045d6e3d8` (clean tree, tested sha): 7.a the numbers of `PUBLICATION.md` match the code (25 races, 22 ADS 2 animals, settings 0.1 to 5; `Tests/FUNCTIONAL.md` plays the role of `TEST_SCENARIOS.md`), 7.b and 7.c replayed green today (Check-Mod 342, Test-Validator 7 cases, unit tests, Check-Translations 590/591/56 and its self-test), 7.d suites written with each `@requires` mounted by a map (`TESTING.md`), 7.g translations complete. `playTests` now needs the Pickle tickets (AUDIT.md 8): the sha is frozen, no code commit without reopening it.

## Transition 2026-10-10: localize to writeTests

`localize[1.0.0]` to `writeTests[1.0.0]`: the three translation fields are `complete`, the game's French report has no problem, protocols read (`protocols_read_sha`). Exit of `writeTests` still to establish (AUDIT.md 7.a to 7.i): the numbers of `PUBLICATION.md` checked against the code (7.a), the tested sha recorded (7.f); the automated checks of 2026-10-10 are green at `33196d1` and need replaying if code changes.

## Settings audit (2026-09-26, kept; automated checks re-run 2026-10-10)

Decision (Virginie, 2026-09-26): port the spawn controls of the original. Two options, nothing cosmetic: wild spawn frequency multiplier (default 1, 0.1 to 5, slider and
restore-defaults button, global, applies to new spawns) and one switch per creature (25, unchecked = never spawns in the wild; animals already on the map stay).
Mechanism: Harmony postfix on `BiomeDef.CommonalityOfAnimal` (`Source/Settings.cs`), pure rule in `Source/SpawnRules.cs`, `ModSettings` persistence with out-of-range values brought back on load.
Access: Mod options -> Alpha Mythology Renew (unofficial); MainButtons shortcut `AMR_Settings`, `buttonVisible` false (asserted by Check-Mod, a visible one is rejected by Test-Validator), same `Dialog_ModSettings`.
Excluded on purpose: the wisp and VEF reproduction flags and combat constants. Five Keyed keys, EN and FR.
Unverified, in game: everything in the `remaining` entry on the settings window. A Pickle settings pass (features 01 to 08) is reported played; to be re-read at `playTests`.

## Translation audit (2026-09-13, updated 2026-10-10)

Where the French lives: `Mod/Languages/French/Keyed/AlphaMythology.xml` and `Mod/Languages/French/DefInjected/*/AlphaMythology.xml` (no grammar files). English is the Def value plus `Mod/Languages/English/Keyed/`.
Inventory: `Tests/TRANSLATIONS.md`, `Tests/TranslationInventory.json` (590 fields, 589 French injections, 56 Keyed pairs). `FRENCH_REVIEW.md` was generated from `37c229b`; no French file changed since.
Plural rule: the only counted text, `AMR_AsexualReproductionDays`, has `.One` and `.Many` in both languages (`Source/TranslationPatches.cs`).
Gender agreement: no `PAWN_gender` switch in the French; the texts are rewritten epicene (`la personne qui le monte`, `les membres de la colonie`), pawn = colon not used.
French review by Virginie: 2026-10-10 at `33196d1`: the two rows added after the game's report (`MM_OpenWound.labelNounPretty`, wisp `customString`) validated in chat ('validé'); `FRENCH_REVIEW.md` from that revision; the game's French report is green (ticket c626). Earlier: 2026-10-01 at `990f571` (corrections of 2026-09-30 and 2026-10-01); further corrections from her review applied 2026-10-08 at `37c229b` (seven texts, English untouched). Written on her word, not by a session.
Game's report (French): 2026-10-05 in her game, 0 errors naming this mod; 2026-10-09 NPT's step in the Pickle ticket 9368: **2 missing injections** (defect above). English has no report (the game writes one only for another language than English).
Unverified in game: raw keys, fallback text, clipping, wisp inspection text.

## Dependencies and DLC (checked in the sources 2026-09-26, `PUBLICATION.md` table of 2026-10-07; no dependency change since)

Hard: Harmony, Vanilla Expanded Framework, Resolve This Instead (vouches Nature's Pretty Sweet -> its (Continued) page in `Mod/About/ResolveThisInstead.xml`). Optional, never required: Advanced Biomes, Genetics Expanded,
Giddy-Up, Lord of the Rims elves, Nature's Pretty Sweet, Nocturnal Animals, A RimWorld of Magic (needs JecsLite), Vanilla Cooking Expanded, Achievements (a `LoadFolders` branch), and the four animal-mod integrations (ANIMALS.md): ADS 2 (`loadBefore`),
Nocturnal Animals, Dogs mate, Better Crossbreeding; each patch is guarded, with the reasons in its header. DLC: none required (one `MayRequire` Biotech). Incompatible: the original (`sarg.magicalmenagerie`), still so per the pass of 2026-09-27.
Supported version 1.6 only.

## Tests

Automated: front matter. Pickle suite `Tests/Pickle`: 19 features, 68 scenarios, passes declared in `TESTING.md` (three families). Reported in the history, not re-read here: the final baselines `final-en` and `final-fr` of 2026-10-05
(79 scenarios, 50 passed each, 27 skipped by requirement, the two reds answered by green replays `fix-en8` and `fix-en10`), the optional-provider passes, the restart pair, the wild draw, the incompatibility pass. Evidence kept on disk,
gitignored. Open red: ticket 9368 (French translation report), above. Functional scenarios: `Tests/FUNCTIONAL.md`, automation map inside.

## Gallery

| Index | File | State |
|---|---|---|
| 0 | `0-preview.png` | byte copy of `Mod/About/Preview.png`, current (regenerated 2026-10-05 from the new `ModIcon-source.png`), uploaded by Virginie 2026-10-02 |
| 1 to 6 | `griffin`, `hound`, `phoenix`, `unicorn`, `manticore`, `pegasus` (JPEG) | old studio8 pictures, placeholders |
| 7 | `7-settings.png` | old studio8 picture of the settings window |

The sanctuary series (`09-publication-shots.feature`, one story, Nelim in pictures 2 and 4 with facial expressions) is written; its candidates (`N-candidate-<name>.png`) are not shot. See `PUBLICATION.md` for the plan.

## Upstream

Fork `vbardales/AlphaMythology` made 2026-09-28. Original master has `1.4/` and `1.5/` only; its open PR #3 adds a 1.6 folder, so a whole-port PR would collide: the PR to send is small (the phoenix egg lost in a merged stack, branch `fix-phoenix-egg-lost-in-stack`, commit b44eb3c, scratch clone `C:/amfork`).
Not sent; the owner reads the text once open and the text states only what a green run proves.

## Publication

Mode CI (`PUBLICATION.md`). The 0.1.0 pre-publication was sent 2026-10-01 (item 3811323347, `About/PublishedFileId.txt` committed, c2f8199). The 1.0.0 is not sent; the description is the Markdown block under `## Steam description`,
`About.xml` carries its plain-text rendering (`node .github/scripts/sync-about-description.mjs --write`). Thank-you drafts in `PUBLICATION.md`, posted after the switch to public.
