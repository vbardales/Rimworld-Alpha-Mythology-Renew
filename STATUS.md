---
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythology
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
remote: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
visibility: public
workflow_stage: prepareRelease[1.0.0]
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
tested_on: "2026-10-10, Pickle only: initial passes EN and FR at the tree of eba7208 (docs commits after), replays at c9bdc67; optional-provider passes and incompatibility pass not replayed at this revision (green on earlier revisions, non-regression after deploy)"
audit_at: 2026-10-10
audit_revision: dbc114e22cf23ab64baa7a9047141d161d17abf2 (clean tree at the start; this audit then edited Tests/Test-Validator.ps1, CHANGELOG.md, TESTING.md, Tests/Pickle/README.md, STATUS.md)
automated_tests: "passed 2026-10-10: Tests/UnitTests ALL PASSED (spawn rules 13, patch checks 47); Release build 0 warnings 0 errors"
xml_tests: "passed 2026-10-11: Check-ModBasics (shared) then Check-Mod.ps1 174 own assertions, 86 XML files, 25 creatures; Test-Validator.ps1 6 negative cases (the runner was red before this audit, see Audit 2026-10-10); shared scripts/Check-Translations.ps1 224 source texts and French injections green 2026-10-11 (replaced Check-Translations.py, deleted)"
functional_tests: "unverified in this audit; Pickle history reports green passes (see Tests): not re-read here"
remaining:
  - "2026-10-10 unverified (playTests 8.f to 8.k): the @requires passes and the incompatibility pass are green on earlier revisions and are replayed as non-regression after the deploy (followUp 14.a); functional scenarios 8.g, settings in game FR and EN 8.h and UI and logs 8.i are covered by the initial passes (84 scenarios each, every red replayed green, docs/runs/2026-10-10-1a12-d0ff-initial-passes.md); the owner's manual validations, if any, are hers"
  - "2026-10-10 feature (prepareRelease, AUDIT 3.c/11.f/12.e): CHANGELOG [Unreleased] stays on top until the dry-run; in the commit whose sha goes to the dry-run it becomes `## [1.0.0] - <planned send date>`; a slipped send means a corrected date, a new commit and a new dry-run (Check-Status WARNs changelog from publish on)"
  - "2026-10-10 feature (followUp 14.b): the Use This Instead comment for Mlie (3396308787) is drafted in PUBLICATION.md; hand it to Virginie as an orange step once the item is public, with the link and the text ready to paste"
  - "2026-10-10 feature (publish 13.b): add the Alpha Mythology Renew row to ../USE_THIS_INSTEAD.md once the item is public (old Workshop id 1821617793, read the old name, author and versions on its page; new id 3811323347); the owner reports it to Use This Instead"
  - "2026-10-10 unverified (playTests): settings window, both routes (Mod options and the hidden MainButtons shortcut via RIMMSQOL), real effect on wild spawns, persistence after restart and reload, EN and FR layout"
  - "2026-10-10 unverified (playTests): English and French display in game, raw keys, clipping, optional integrations, wisp inspection text with the new plural keys"
  - "2026-10-10 unverified: save migration from Animal Ark (class names changed, untested by design) and manual gameplay"
  - "2026-10-10 unverified: optional-provider passes, ADS 2, Dogs mate, Better Crossbreeding and the incompatibility pass are reported green in the history (2026-09-27 to 2026-10-05); this audit did not re-read their reports"
  - "2026-10-10 unverified (playTests 8.m): code review; last review f3d8693ee1c469acc5286f14b03aff0202eeca71 (low effort, since 0.1.0); code_review_sha is not recorded in the front matter yet"
  - "2026-10-10 feature (writeDocs 11.h): thank-you drafts written in PUBLICATION.md for RWoM, Advanced Biomes, Nature's Pretty Sweet, Elves, Giddy-Up 2, Dogs mate, Better Crossbreeding and Tree Chopping Speed Stat; Covers completed in the register (protocols 3a01556 and 951bcc7). No draft, by the owner's earlier call: the original's page, Vanilla Genetics Expanded and Vanilla Achievements Expanded (Sarg Bjornson answers there). Drafts are read against the owner's voice at writeDocs, posted after the item is public (followUp 14.b)"
  - "2026-10-10 feature (blocker before 1.0.0): Resolve This Instead (nelim.resolvethisinstead, hard dependency) needs its own public Workshop page first; no Workshop id yet"
  - "2026-10-10 unverified: the 1.0.0 is not sent; the description of PUBLICATION.md holds an em dash (2 in the file), rule of 2026-10-10"
code_review_sha: 92bdc6ece455a8dcb3e6ca3f1a33a31d492eab8b
publication_changelog_review_sha: 92ed1e831806f7b0fead291d3b1a8ad738562bc9
echo_review_sha: a1be481084332130c4d6b992d4735cdfe0fab33e
social_preview_sha256: fba649849da03131890b808754e8cd81f831254785cade742332fe2792c0b41d
  - "2026-10-15 unverified (1.7 pass, run 22fa): load, settings and shortcut green on 1.7, 18 scenarios failed on the 5 s timeout of `I wait N ticks` under Waylith (tool symptom), restart pair filed alone; tested_1_7 absent until the wait steps are fixed and the 18 replayed alone; RIMMSQOL skipped, French not playable on 1.7"
updated: 2026-10-13
protocols_read_sha: 228c98ab061efe4883c879bd8e5be6d97c22c128
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
- The two injections are added (`Mod/Languages/French/DefInjected`), the game's translation pass proves them (the former Check-Translations.py and its `GAME_REPORTED` are deleted), `FRENCH_REVIEW.md` regenerated. Work to cross the next transition: have Virginie read the two rows (`translation_fr` to `complete`), (ticket c626 already green) then `Check-Status.ps1`, read the missing protocols, `Mark-ProtocolsRead.ps1`, set `writeTests[1.0.0]`.

## Code review 2026-10-10 (playTests 8.m)

Review of `f3d8693ee1c469acc5286f14b03aff0202eeca71..HEAD` (the earlier review since 0.1.0 covered up to f3d8693, low effort, no finding). `Source/` is unchanged apart from `Directory.Build.props` (`build/` folder); `Mod/` changed in French text (nine rows, plus the two injections), the About description (generated from `PUBLICATION.md`) and the ModIcon and Preview images. No finding: the French strings keep their placeholders (`{0}`, `{1}`), the three agreement-free rewrites carry no gender, `Check-Translations.py` and the game's French report agree. Reviewed commit: 8ff9b37bd18650e6c82ec96210ece2a846bf7235.

## Transition 2026-10-10: playTests to shootGallery

Exit of `playTests` (AUDIT.md 8): 8.c initial passes and every red replayed green; 8.d the `@review` captures opened and read (`initial-en` and `initial-fr`, the settings window: EN "Alpha Mythology Renew (unofficial)" with the multiplier slider, restore-defaults button and the creature list; FR "non officiel", the intro line wraps on two lines, no raw key, no clipping, the Learning helper and bottom bar in the language of the pass); 8.e no `@wip`; 8.f the conditional passes are green on earlier revisions and replayed as non-regression after the deploy (fail-fast, AUDIT.md); 8.h and 8.i settings and UI in EN and FR covered by the 84 scenarios of each initial pass; 8.l evidence trimmed to 74 MB, `tested_on` written; 8.m `code_review_sha` recorded (no finding). No code commit since: only French text, About description and the `build/` folder name.

## Transition 2026-10-10: writeTests to playTests

Exit of `writeTests` established at `eba7208d0e741ec31ca79513c893580045d6e3d8` (clean tree, tested sha): 7.a the numbers of `PUBLICATION.md` match the code (25 races, 22 ADS 2 animals, settings 0.1 to 5; `Tests/FUNCTIONAL.md` plays the role of `TEST_SCENARIOS.md`), 7.b and 7.c replayed green today (Check-Mod 342, Test-Validator 7 cases, unit tests, Check-Translations 590/591/56 and its self-test), 7.d suites written with each `@requires` mounted by a map (`TESTING.md`), 7.g translations complete. `playTests` now needs the Pickle tickets (AUDIT.md 8): the sha is frozen, no code commit without reopening it.

## Intermediates folder renamed, 2026-10-10

Owner rule of the day: `build/` replaces `.build/` (`.gitignore`, `Source/Directory.Build.props`, `Tests/Pickle/Source/Directory.Build.props`, `Tests/TRANSLATIONS.md`). The Release build was rerun to a temporary folder: 0 warnings, 0 errors, no change to `Mod/` or to the sources; `build/` and the old `.build/` are deleted after each build. The tickets 1a12 and d0ff were filed before this edit and do not depend on it.

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
Inventory: `Tests/TRANSLATIONS.md`, the shared `scripts/Check-Translations.ps1` (224 texts). `FRENCH_REVIEW.md` was generated from `37c229b`; no French file changed since.
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

Automated: front matter. Pickle suite `Tests/Pickle`: 19 features, 84 scenarios, passes declared in `TESTING.md` (three families). Played 2026-10-10 on `sans-facultatifs`: the initial full passes `initial-en` and `initial-fr` (84 scenarios each, 49 passed, 5 red, 30 skipped by requirement), every red replayed green (`replay-egg`, `replay-kitsune`, `replay-restart`), and the game's French translation report green (`translation-fr2`, ticket c626). Reported green on earlier revisions, not replayed here: the optional-provider passes and the incompatibility pass (non-regression after the deploy). Evidence is kept on disk, gitignored (74 MB). Functional scenarios: `Tests/FUNCTIONAL.md`, automation map inside.

## Gallery

| Index | File | State |
|---|---|---|
| 0 | `0-preview.png` | byte copy of `Mod/About/Preview.png`, current |
| 1 to 7 | `kitsune`, `phoenix`, `manticore`, `kappa`, `pegasus`, `unicorn`, `griffin` (JPEG) | sanctuary series, accepted by Virginie 2026-10-12 and 2026-10-13; order by demonstrative strength (AUDIT.md 9.c), not by the story clock |
| 8 | `8-settings.jpg` | settings window over `window-backdrop-for-height`, side crop, accepted 2026-10-13 (run 1fa8) |

Series played in `SanctuaryBacklot` (feature `09-publication-shots`, runs da73, 9d5c, 1fa8). No candidate left.

## Echo review 2026-10-13 (mountPreview 10.a)

Decision: keep `Art/echo-source.png`. It is the phoenix line-art; the phoenix is still in the accepted gallery (`2-phoenix.jpg`) and the subject of the mod (mythological creatures) has not moved. The gallery changed after the previous review only by re-shot kappa, manticore, unicorn and the new settings window, and by reordering. Preview not regenerated, so `social_preview_sha256` stands. `Art/Cards/` (an unreferenced inherited Photoshop template, 1 MB) deleted by the closing pass step 1; it stays in git history (37c56e1).

## Upstream

Pull request sent 2026-10-13: https://github.com/juanosarg/AlphaMythology/pull/4 (phoenix egg lost in a stack, plus the English typo `work load` to `workload`), from the fork branch fix-phoenix-egg-lost-in-stack. Nothing to do until the author answers; an answer or a request to split goes through Virginie.

Fork `vbardales/AlphaMythology` made 2026-09-28. Original master has `1.4/` and `1.5/` only; its open PR #3 adds a 1.6 folder, so a whole-port PR would collide: the PR to send is small (the phoenix egg lost in a merged stack, branch `fix-phoenix-egg-lost-in-stack`, commit b44eb3c, scratch clone `C:/amfork`).
Not sent; the owner reads the text once open and the text states only what a green run proves.

## Publication

Mode CI (`PUBLICATION.md`). The 0.1.0 pre-publication was sent 2026-10-01 (item 3811323347, `About/PublishedFileId.txt` committed, c2f8199). The 1.0.0 is not sent; the description is the Markdown block under `## Steam description`,
`About.xml` carries its plain-text rendering (`node .github/scripts/sync-about-description.mjs --write`). Thank-you drafts in `PUBLICATION.md`, posted after the switch to public.

## Transition 2026-10-13: shootGallery to mountPreview to writeDocs

Gallery final (nine images, 2.6 MB, order by strength), echo kept (section above), Preview and social preview unchanged, `Art/` clean. `writeDocs` next: the two `rimworld-version` warnings (Steam description and About.xml name a RimWorld version, to rewrite as "the latest RimWorld version"), Virginie's review of PUBLICATION.md and CHANGELOG.md (`publication_changelog_review_sha`).

## Transition 2026-10-13: writeDocs to prepareRelease

Virginie validated PUBLICATION.md and CHANGELOG.md in chat on 2026-10-13 (`publication_changelog_review_sha` = the commit she read); description without a RimWorld version, adult boxes answered, thank-you drafts and Steam change notes written. `prepareRelease` next (AUDIT.md 12): the blocker below (Resolve This Instead needs its own public Workshop page), the dry-run that starts by dating `## [Unreleased]`, rollback target. `code_review_sha` is INFO-stale only because `About.xml` carries the regenerated description (text, no `Source/` change).

Audit 9 to 11 re-checked criterion by criterion on 2026-10-13: 9.b to 9.e, 10.c (0-preview.png byte copy), 10.d format 896x504 and 607 KB (contrast not measured, read on the image), 10.e, 10.f (sha256 equal), 11.a to 11.j met; defect found and fixed: About.xml had no `<url>` to the repository (11.c, PUBLISHING.md), added; Check-Mod 174 assertions green after it.

Code review 2026-10-13 (prepareRelease 12.a): range 8ff9b37..92bdc6ece455a8dcb3e6ca3f1a33a31d492eab8b. `Source/`, `Defs/`, `Patches/`, `Languages/` and `Assemblies/` unchanged; `Mod/` changed only in `About.xml` (regenerated description without a RimWorld version, `<url>` to the repository, `downloadUrl` of Resolve This Instead, a public repository) and the regenerated Preview and ModIcon images. No finding. Reviewed commit: 92bdc6ece455a8dcb3e6ca3f1a33a31d492eab8b.
