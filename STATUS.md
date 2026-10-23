---
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythology
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
remote: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
visibility: public
workflow_stage: shootGallery[1.0.0]
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
xml_tests: "passed 2026-10-17 (3357d07): Check-Mod.ps1 now also runs shared Check-Translations at its end with the 6 compatibility Keyed keys allowed (NocturnalAnimals.BodyClock*, VEF_WarningEggExplodes), 174 assertions, Test-Validator 6 negative cases green; earlier 2026-10-11: Check-ModBasics (shared) then Check-Mod.ps1 174 own assertions, 86 XML files, 25 creatures; Test-Validator.ps1 6 negative cases (the runner was red before this audit, see Audit 2026-10-10); shared scripts/Check-Translations.ps1 224 source texts and French injections green 2026-10-11 (replaced Check-Translations.py, deleted)"
functional_tests: "unverified in this audit; Pickle history reports green passes (see Tests): not re-read here"
remaining:
  - "2026-10-17 feature (upstream PR 6): English fixes to carry upstream: Manticore description now `attacking from range` (done here); Erymanthian boar `slowing its progress and advantage` is still to fix upstream only (suggested: `slowing it down and negating its advantage`); not changed here"
  - "2026-10-10 unverified (playTests 8.f to 8.k): the @requires passes and the incompatibility pass are green on earlier revisions and are replayed as non-regression after the deploy (followUp 14.a); functional scenarios 8.g, settings in game FR and EN 8.h and UI and logs 8.i are covered by the initial passes (84 scenarios each, every red replayed green, docs/runs/2026-10-10-1a12-d0ff-initial-passes.md); the owner's manual validations, if any, are hers"
  - "2026-10-10 feature (prepareRelease, AUDIT 3.c/11.f/12.e): CHANGELOG [Unreleased] stays on top until the dry-run; in the commit whose sha goes to the dry-run it becomes `## [1.0.0] - <planned send date>`; a slipped send means a corrected date, a new commit and a new dry-run (Check-Status WARNs changelog from publish on)"
  - "2026-10-10 feature (followUp 14.b): the Use This Instead comment for Mlie (3396308787) is drafted in PUBLICATION.md; hand it to Virginie as an orange step once the item is public, with the link and the text ready to paste"
  - "2026-10-10 feature (publish 13.b): add the Alpha Mythology Renew row to ../USE_THIS_INSTEAD.md once the item is public (old Workshop id 1821617793, read the old name, author and versions on its page; new id 3811323347); the owner reports it to Use This Instead"
  - "2026-10-10 unverified (playTests): settings window, both routes (Mod options and the hidden MainButtons shortcut via RIMMSQOL), real effect on wild spawns, persistence after restart and reload, EN and FR layout"
  - "2026-10-10 unverified (playTests): English and French display in game, raw keys, clipping, optional integrations, wisp inspection text with the new plural keys"
  - "2026-10-10 unverified: save migration from Animal Ark (class names changed, untested by design) and manual gameplay"
  - "2026-10-10 unverified: optional-provider passes, ADS 2, Dogs mate, Better Crossbreeding and the incompatibility pass are reported green in the history (2026-09-27 to 2026-10-05); this audit did not re-read their reports"
  - "2026-10-10 feature (writeDocs 11.h): thank-you drafts written in PUBLICATION.md for RWoM, Advanced Biomes, Nature's Pretty Sweet, Elves, Giddy-Up 2, Dogs mate, Better Crossbreeding and Tree Chopping Speed Stat; Covers completed in the register (protocols 3a01556 and 951bcc7). No draft, by the owner's earlier call: the original's page, Vanilla Genetics Expanded and Vanilla Achievements Expanded (Sarg Bjornson answers there). Drafts are read against the owner's voice at writeDocs, posted after the item is public (followUp 14.b)"
  - "2026-10-10 feature (blocker before 1.0.0): Resolve This Instead (nelim.resolvethisinstead, hard dependency) needs its own public Workshop page first; no Workshop id yet"
  - "2026-10-10 unverified: the 1.0.0 is not sent (the em dash of the description is gone, checked 2026-10-15: 0 in PUBLICATION.md and About.xml)"
  - "2026-10-15 unverified (1.7 pass, run 22fa): load, settings and shortcut green on 1.7, 18 scenarios failed on the 5 s timeout of `I wait N ticks` under Waylith (tool symptom), restart pair green on 1.7 (run 4f64, 2026-10-15), the 18 replayed by ticket 3b8d (2026-10-15): same 18 red on the 5 s wait step, 16 others green, the cause is this suite, not the tool: the 5 s `I wait N ticks` was in our own scenarios; 2bd8778 moves 21 long waits (10 scenarios, features 13 to 17, now `@requires:nelim.pickletools.screenshotstudio`, so the minimal pass skips them and `wsl-deps.studio.map` plays them) to the 240 s `I let N ticks pass` of Pickle Tools; replay ticket 1056 (1.7, studio map) read 2026-10-16: 9 of 9 played green (feature 13 all 7, feature 14 two of three), ended by the 20 minute run limit (exit 5, exitReason in-progress), the third scenario of 14 and features 15, 16, 17 not reached (docs/runs/2026-10-16-1056-1.7-waits2.md); b262 read 2026-10-16: features 14 all and first scenario of 15 green, ended by the Pickle watchdog (docs/runs/2026-10-16-b262-1.7-waits3.md); features 13 and 14 green on 1.7; 9b40 read 2026-10-17: feature 15 all 9 green (docs/runs/2026-10-17-9b40-1.7-feature15.md), so features 13 to 15 green on 1.7; 8b61 read 2026-10-17: features 16 and 17 12 of 15 green, 2 skipped (needs Tree Chopping Speed), 1 red (cutting dead grass, docs/runs/2026-10-17-8b61-1.7-features16-17.md), replay ticket 2d25 read 2026-10-17: watchdog-timeout at load, 0 scenarios, inconclusive, to refile (filter 17-plants::MM_BurnedGrass, studio map, 1.7); the 2 scenarios `@requires:TreeChoppingSpeed.velcroboy333` (features 17) are skipped on the studio map: that provider is staged only by wsl-deps.avec-treechop.map and its Workshop page lists 1.2 to 1.6, so they stay green-on-1.6 evidence and are not played on 1.7 unless the provider is updated (its 1.7 support not checked) (the step `orders a colonist to cut the plant` now stands the colonist on a standable neighbour cell instead of the cell east of the plant, 2026-10-17: a fixture weakness, not proven to be the cause); tested_1_7 absent until it is green; RIMMSQOL skip lifted 2026-10-18 (RIMMSQOL updated and tagged 1.7, AUDIT.md Passe 1.7): the scenarios skipped for it (shortcut route, wsl-deps.avec-rimmsqol.map) are replayed on 1.7 before tested_1_7 can be yes; French not playable on 1.7"
  - "2026-10-19 feature (shootGallery 9): eight new candidates in Art/Gallery (1-candidate-phoenix to 8-candidate-manticore, shotlist at 4 of 5, tickets c6b6 and a7e0 read, docs/runs/2026-10-18-c6b6-a7e0-gallery-shotlist.md); Virginie accepts or refuses each, then reindex with 8-settings.jpg as 9, update the gallery table below, subtitles from PUBLICATION.md 'Gallery subtitles' (clean originals in Art/Gallery-clean)"
code_review_sha: 92bdc6ece455a8dcb3e6ca3f1a33a31d492eab8b
publication_changelog_review_sha: 92ed1e831806f7b0fead291d3b1a8ad738562bc9
echo_review_sha: 1dfde4ad13f2a7adfb833de2ec2e3bc185e76967
social_preview_sha256: d0458c9f6095218ab55b06095e179d508311792a755a8681115c9c626463f2c5
updated: 2026-10-17
protocols_read_sha: b08c1315abc7369296b6456f460e266731c95817
---
# Alpha Mythology Renew (unofficial): status

Current state only. Journal of runs: `docs/runs/`. Earlier dated sections (2026-09-12 to 2026-10-09: licence audit, Pickle runs read, gallery
studio passes, French review rounds) kept in git history up to commit `dbc114e` (`git show dbc114e:STATUS.md`); each summed up below; audit sections and 2026-10-10 transitions in `docs/runs/2026-10-status-fold.md`.

Standalone repository, public, `origin` the repository above; Sanctuary Backlot (gallery scene) separate private repository. Original is
Sarg Bjornson's Alpha Mythology (Workshop 1821617793, source https://github.com/juanosarg/AlphaMythology); this port extracts its 25 creatures from Animal Ark,
under packageId `nelim.alphamythology` (shortened 2026-09-27), with C# assembly `AlphaMythologyRenew.dll` (three classes, Harmony postfixes for settings),
hard dependencies Harmony, Vanilla Expanded Framework, Resolve This Instead.

## Settings audit (2026-09-26, kept; automated checks re-run 2026-10-10)

Decision (Virginie, 2026-09-26): port spawn controls of original. Two options, nothing cosmetic: wild spawn frequency multiplier (default 1, 0.1 to 5, slider and
restore-defaults button, global, applies to new spawns) and one switch per creature (25, unchecked = never spawns in wild; animals already on map stay).
Mechanism: Harmony postfix on `BiomeDef.CommonalityOfAnimal` (`Source/Settings.cs`), pure rule in `Source/SpawnRules.cs`, `ModSettings` persistence, out-of-range values reset on load.
Access: Mod options -> Alpha Mythology Renew (unofficial); MainButtons shortcut `AMR_Settings`, `buttonVisible` false (asserted by Check-Mod, visible one rejected by Test-Validator), same `Dialog_ModSettings`.
Excluded on purpose: wisp and VEF reproduction flags, combat constants. Five Keyed keys, EN and FR.
Unverified in game: everything in `remaining` entry on settings window. Pickle settings pass (features 01 to 08) reported played; re-read at `playTests`.

## Translation audit (2026-09-13, updated 2026-10-10)

French lives in: `Mod/Languages/French/Keyed/AlphaMythology.xml` and `Mod/Languages/French/DefInjected/*/AlphaMythology.xml` (no grammar files). English is Def value plus `Mod/Languages/English/Keyed/`.
Inventory: `Tests/TRANSLATIONS.md`, shared `scripts/Check-Translations.ps1` (224 texts). `FRENCH_REVIEW.md` generated from `37c229b`; no French file changed since.
Plural rule: only counted text, `AMR_AsexualReproductionDays`, has `.One` and `.Many` in both languages (`Source/TranslationPatches.cs`).
Gender agreement: no `PAWN_gender` switch in French; texts rewritten epicene (`la personne qui le monte`, `les membres de la colonie`), pawn = colon not used.
French review by Virginie: 2026-10-17 full French read at 730ae3f (FRENCH_REVIEW.md regenerated at b8fb0f0) validated in chat ("relu, validé"), after the ChatGPT retouches applied that day (Giddy Up! prompt removed, catoblepas, kappa, MM_Grabbed.label, MM_UtilityWorkerDesc); the Review line table of FRENCH_REVIEW.md stays hers to fill. Earlier: 2026-10-17 validated in chat the three texts rewritten without tu or vous (MM_MountFastDesc, MM_MountFastArmouredDesc, MM_LesserWyvern.description). Earlier: 2026-10-10 at `33196d1`: two rows added after game's report (`MM_OpenWound.labelNounPretty`, wisp `customString`) validated in chat ('validé'); `FRENCH_REVIEW.md` from that revision; game's French report green (ticket c626). Earlier: 2026-10-01 at `990f571` (corrections 2026-09-30 and 2026-10-01); further corrections from her review applied 2026-10-08 at `37c229b` (seven texts, English untouched). Written on her word, not by a session.
Game's report (French): 2026-10-05 in her game, 0 errors naming this mod; 2026-10-09 NPT's step in Pickle ticket 9368: **2 missing injections** (defect above). English has no report (game writes one only for non-English language).
Unverified in game: raw keys, fallback text, clipping, wisp inspection text.

## Dependencies and DLC (checked in the sources 2026-09-26, `PUBLICATION.md` table of 2026-10-07; no dependency change since)

Hard: Harmony, Vanilla Expanded Framework, Resolve This Instead (vouches Nature's Pretty Sweet -> its (Continued) page in `Mod/About/ResolveThisInstead.xml`). Optional, never required: Advanced Biomes, Genetics Expanded,
Giddy-Up, Lord of the Rims elves, Nature's Pretty Sweet, Nocturnal Animals, A RimWorld of Magic (needs JecsLite), Vanilla Cooking Expanded, Achievements (a `LoadFolders` branch), and four animal-mod integrations (ANIMALS.md): ADS 2 (`loadBefore`),
Nocturnal Animals, Dogs mate, Better Crossbreeding; each patch guarded, reasons in header. DLC: none required (one `MayRequire` Biotech). Incompatible: original (`sarg.magicalmenagerie`), still so per 2026-09-27 pass.
Supported version 1.6 only.

## Tests

Automated: front matter. Pickle suite `Tests/Pickle`: 19 features, 84 scenarios, passes declared in `TESTING.md` (three families). Played 2026-10-10 on `sans-facultatifs`: initial full passes `initial-en` and `initial-fr` (84 scenarios each, 49 passed, 5 red, 30 skipped by requirement), every red replayed green (`replay-egg`, `replay-kitsune`, `replay-restart`), game's French translation report green (`translation-fr2`, ticket c626). Reported green on earlier revisions, not replayed here: optional-provider passes and incompatibility pass (non-regression after deploy). Evidence kept on disk, gitignored (74 MB). Functional scenarios: `Tests/FUNCTIONAL.md`, automation map inside.

## Gallery

| Index | File | State |
|---|---|---|
| 0 | `0-preview.png` | byte copy of `Mod/About/Preview.png`, current |
| 1 to 7 | `kitsune`, `phoenix`, `manticore`, `kappa`, `pegasus`, `unicorn`, `griffin` (JPEG) | sanctuary series, accepted by Virginie 2026-10-12 and 2026-10-13; order by demonstrative strength (AUDIT.md 9.c), not story clock |
| 8 | `8-settings.jpg` | settings window over `window-backdrop-for-height`, side crop, accepted 2026-10-13 (run 1fa8) |

Series played in `SanctuaryBacklot` (feature `09-publication-shots`, runs da73, 9d5c, 1fa8). No candidate left.

## Gallery reshoot 2026-10-15 (stage back to shootGallery)

Owner asked whether pictures match story. Read one by one against shot plan: griffin (no statues, no donkey or hare, unplanned colonist), kitsune (inside hut, not at door, no cat or labrador), manticore (bare soil, macaw, no herons) off plan; phoenix, kappa, pegasus, unicorn matched place but not living around it; hound dropped (2026-10-12), so series had seven creatures, plan said eight. Causes read in feature: zoom 3 to 3.5 (seven cells high), creature free to wander during 30 ticks, plan companions never spawned. Feature `09-publication-shots` rewritten: plan and header aligned with scenarios, zoom 5 to 7, creature pinned (`the animal ... stands at ... facing South`), companions spawned, cells read on places' own empty photographs, hound moved to cloister, rice grown to harvest. Accepted pictures stay in `Art/Gallery/` until new ones accepted; new ones land as `N-candidate-name`. `echo_review_sha` and Preview re-read once gallery settled.

## Shotlist rating 2026-10-18 (owner rule: every scene 4 of 5 or more before it is played; criteria a to j of GALLERY.md)

Reworked after the Audit reading (GALLERY-SHOTLIST-AUDIT.md): per scene a decor placed and removed, an action for Nelim (she carries an offering), her colour and expression, a risk and its plan, all written in the feature header (`09-publication-shots.feature`). Rated by hand (skill `write-shotlist` not loaded in this session). Interface scenes 9 and 10 (window at the centre of the screen) are set aside, not rated.

| Scene | Rating | Main risk | Plan against it |
|---|---|---|---|
| 1 griffin, statue-garden, teal top, NLR-Open, brings meat | 4 | animals overlap the wing | animals of the place removed, companions at 5 cells, griffin off-centre |
| 2 kappa, fishing-zone, coral top, moodCheerful, brings a meal | 4 | small subject | zoom 5, off-centre, candidate already read |
| 3 pegasus, water-garden, saffron top, NLR-Smile, holds hay | 4 | foreground lilies hide the legs | decor cells away from the creature, zoom 5 |
| 4 kitsune, tea-room, indigo top, moodCheerful2, brings a fine meal | 4 | painted zone visible | step `the painted zones are hidden` (NPT 124c3e2), ticket d92f |
| 5 phoenix, fire-pit, green top, NLR-Open, feeds the hearth | 4 | heat face, lit lamps washed out at noon | map held at 20 degrees, 10 ticks before Nelim |
| 6 hound, cloister, cream top, SocialRelax, brings kibble | 4 | three heads read as one blob | zoom 6, heads to the garden, alone on the boards |
| 7 unicorn, plant-garden, plum top, moodCheerful2, holds berries | 4 | cell not standable (red three times) | step `stands on the nearest free cell around`, zones hidden, ticket d92f |
| 8 manticore, rice-paddies, crimson top, NLR-Smile, brings pemmican | 4 | rice not grown, painted zone | plants step on the clearing, zones hidden, ticket d92f |

Criterion k (one story: who, where, which day, rhythm, episodes that advance) written in the header of the feature (4 September 5500, noon to 12:35, five minutes between episodes). Verdicts 2026-10-18 (tickets c6b6 and a7e0, docs/runs/2026-10-18-c6b6-a7e0-gallery-shotlist.md, proof Tests/Pickle/Evidence/gallery-nelim4): first run, pegasus, phoenix and hound at 4, griffin, kappa, kitsune, unicorn (Nelim over it), manticore under 4 (the orange is the smiley carpet terrain, not a zone: covered with `I lay the floor "Soil"`; macaw removed; Nelim moved off the animal). Replay a7e0 after the rework: all five captures read at 4. The eight pictures are candidates in Art/Gallery (1-candidate-phoenix to 8-candidate-manticore, subtitled from PUBLICATION.md, clean originals in Art/Gallery-clean), order by strength; Virginie accepts or refuses, then the old files of the same index are replaced and the gallery re-indexed with 8-settings.jpg as 9. Offerings read only as a small box: the action reads from the pose.

Lowest 4 (read after play). Gallery not yet accepted: stage is shootGallery.

## Echo review 2026-10-23 confirmed (Virginie, in chat, at Preview regenerated with the panel config), earlier 2026-10-13 (mountPreview 10.a)

Decision: keep `Art/echo-source.png`. Phoenix line-art; phoenix still in accepted gallery (`2-phoenix.jpg`), mod subject (mythological creatures) unchanged. Gallery changed since previous review only by re-shot kappa, manticore, unicorn, new settings window, reordering. Preview not regenerated, so `social_preview_sha256` stands. `Art/Cards/` (unreferenced inherited Photoshop template, 1 MB) deleted by closing pass step 1; stays in git history (37c56e1).

## Upstream

Pull request sent 2026-10-13: https://github.com/juanosarg/AlphaMythology/pull/4 (phoenix egg lost in stack, plus English typo `work load` to `workload`), from fork branch fix-phoenix-egg-lost-in-stack. Nothing to do until author answers; answer or split request goes through Virginie.

Branch `fix-english-typos` pushed to the fork 2026-10-17 (four English typos in 1.4 and 1.5, from upstream master), PR opened by Virginie: https://github.com/juanosarg/AlphaMythology/pull/6 (2026-10-17). Typo-only branch `fix-biten-typo` pushed to the fork 2026-10-17 (d9b26a2: `biten` to `bitten` in the death message of 1.4 and 1.5, from upstream master 53a5518), PR opened by Virginie: https://github.com/juanosarg/AlphaMythology/pull/5. Nothing to do on #4, #5 or #6 until the author answers; commits on the three fork branches keep their Co-Authored-By trailer (Virginie, 2026-10-17: leave).
Fork `vbardales/AlphaMythology` made 2026-09-28. Original master has `1.4/` and `1.5/` only; its open PR #3 adds 1.6 folder, so whole-port PR would collide: PR to send is small (phoenix egg lost in merged stack, branch `fix-phoenix-egg-lost-in-stack`, commit b44eb3c, scratch clone `C:/amfork`).
Not sent; owner reads text once open, text states only what green run proves.

## Publication

Mode CI (`PUBLICATION.md`). 0.1.0 pre-publication sent 2026-10-01 (item 3811323347, `About/PublishedFileId.txt` committed, c2f8199). 1.0.0 not sent; description is Markdown block under `## Steam description`,
`About.xml` carries plain-text rendering (`node .github/scripts/sync-about-description.mjs --write`). Thank-you drafts in `PUBLICATION.md`, posted after switch to public.

## Transition 2026-10-13: shootGallery to mountPreview to writeDocs

Gallery final (nine images, 2.6 MB, order by strength), echo kept (section above), Preview and social preview unchanged, `Art/` clean. `writeDocs` next: two `rimworld-version` warnings (Steam description and About.xml name a RimWorld version, rewrite as "the latest RimWorld version"), Virginie's review of PUBLICATION.md and CHANGELOG.md (`publication_changelog_review_sha`).

## Transition 2026-10-13: writeDocs to prepareRelease

Virginie validated PUBLICATION.md and CHANGELOG.md in chat 2026-10-13 (`publication_changelog_review_sha` = commit she read); description without RimWorld version, adult boxes answered, thank-you drafts and Steam change notes written. `prepareRelease` next (AUDIT.md 12): blocker below (Resolve This Instead needs own public Workshop page), dry-run starting by dating `## [Unreleased]`, rollback target. `code_review_sha` INFO-stale only because `About.xml` carries regenerated description (text, no `Source/` change).

Audit 9 to 11 re-checked criterion by criterion 2026-10-13: 9.b to 9.e, 10.c (0-preview.png byte copy), 10.d format 896x504 and 607 KB (contrast not measured, read on image), 10.e, 10.f (sha256 equal), 11.a to 11.j met; defect found and fixed: About.xml had no `<url>` to repository (11.c, PUBLISHING.md), added; Check-Mod 174 assertions green after.

Code review 2026-10-13 (prepareRelease 12.a): range 8ff9b37..92bdc6ece455a8dcb3e6ca3f1a33a31d492eab8b. `Source/`, `Defs/`, `Patches/`, `Languages/`, `Assemblies/` unchanged; `Mod/` changed only in `About.xml` (regenerated description without RimWorld version, `<url>` to repository, `downloadUrl` of Resolve This Instead, public repository) and regenerated Preview and ModIcon images. No finding. Reviewed commit: 92bdc6ece455a8dcb3e6ca3f1a33a31d492eab8b.
## Scenario rework 2026-10-23 (after reading the eight candidates; not played yet)

Director's reading of the eight candidates (Art/Gallery-clean) then rework of `09-publication-shots.feature` (header block "REWORK 2026-10-23"): Nelim's hair is the high ponytail `Roo_HD_Hair_Highpony` (owner, same day; step `"Nelim" hairstyle is` in every scenario, `rooboid.hdhair.continued` added to `wsl-deps.sanctuary.map`, not yet played so the fixture default is unread); griffin moved one cell west and zoom 5 (wing touched a statue); pegasus gets a Soil patch under Nelim (she stood on dry reeds); phoenix reframed to zoom 5 with a cat and Nelim two cells closer (weakest picture). Open and unverified: a green object and a dark smudge in the griffin frame, a blue flame inside the hut of the kitsune, faces unreadable at zoom 5 to 6 (expressions set but not visible). Estimated 4 for 1, 3 and 5 after the rework, to confirm on the replay; the other five keep their 4. No ticket filed: waiting for the owner's go.

Shotlist a to k after the 2026-10-23 rework (estimate before replay; faces unreadable at zoom 5 to 6, so d's expression is set but not visible; all eight: a noon sanctuary, clear, 4 Sept 5500, 5 min between scenes; i one subject; j the creature; k the one story of the header; d hair Roo_HD_Hair_Highpony):
| Scene | b decor | c living | d top, expression | e action | f frame | Est | Risk, plan |
|---|---|---|---|---|---|---|---|
| 1 griffin, statue-garden 12:00 | SculptureSmall, daylily | donkey, hare, griffin front | teal, NLR-Open | brings meat | z5, 1 left | 4 | green object, smudge unread; replay |
| 2 kappa, fishing-zone 12:05 | 2 daylilies | swan, duck, kappa front | coral, moodCheerful | brings meal | z4, 2 left | 4 | small subject; zoom 4 |
| 3 pegasus, water-garden 12:10 | 2 daylilies, Soil patch | swan, pegasus front | saffron, NLR-Smile | holds hay | z5, 2 left | 4 | grey water; Soil under Nelim |
| 4 kitsune, tea-room 12:15 | torch lit, bonsai pot | cat, labrador, fox front | indigo, moodCheerful2 | brings fine meal | z6, up 2 | 4 | blue flame in hut; zones hidden |
| 5 phoenix, fire-pit 12:20 | torch, brazier lit | cat Ember, phoenix | green, NLR-Open | feeds hearth | z5, 1 left | 4 | still small in hall; else back to 3 |
| 6 hound, cloister 12:25 | stool, bonsai pot | 2 labradors, 3 heads front | cream, SocialRelax | brings kibble | z6 | 4 | dark on dark wood; heads read |
| 7 unicorn, plant-garden 12:30 | 2 daylilies | 3 sparrows, unicorn front | plum, moodCheerful2 | holds berries | z5 | 4 | free cell; nearest-free step |
| 8 manticore, rice-paddies 12:35 | sculpture, daylily, Soil | herons, chickens, manticore front | crimson, NLR-Smile | brings pemmican | z6, 2 left | 4 | rice grown; plants step |
Interface 9 and 10 (window-backdrop-for-height) set aside. Real verdicts of the 2026-10-18 candidates: accept pending the owner; director reading in chat 2026-10-23 (5 and 6 best, 1 weakest).
NSB answers 2026-10-23 (read from the save): griffin frame green object = SculptureGrand (149, 94), fixture, kept; smudge = terrain or shadow; blue flame in the hut = DarklightBrazier (144, 70), Anomaly DLC, fixture (a step to hide one def exists only in code, AreaOps.HideThings; generic step asked of NSB); Nelim's hair in the save is Victoria, so `"Nelim" hairstyle is "Roo_HD_Hair_Highpony"` stays in every scenario; cat of the phoenix moved to (177, 113) (176 holds a daylily pot).
Confidence of the estimates, 2026-10-23 (owner asked, 1 to 5): 1 griffin 4, 2 kappa 4, 3 pegasus 3 (Nelim moved to (182, 174) because soil under a plant leaves the plant; terrain still to read), 4 kitsune 3 (blue DarklightBrazier stays until NSB's hide step), 5 phoenix 3 (zoom 5 untested), 6 hound 3 (dark on dark), 7 unicorn 4, 8 manticore 4. Series 3.5 of 5.
Rework 2 of 2026-10-23 (owner: scenes 3, 4, 5, 6; header block "REWORK 2" of the feature; replaces the cells and zooms of the table above for these four): 3 pegasus Nelim at (181, 175) on Soil, zoom 4; 4 kitsune zoom 3 so the DarklightBrazier (144, 70) leaves the frame, no hide step needed; 5 phoenix zoom 4 on the grey hearth stones; 6 hound a TileSandstone strip (176-183, 127-128) under it and Nelim in sky blue (90, 150, 210). Confidence now: 3 pegasus 3 (terrain unread), 4 kitsune 4, 5 phoenix 4, 6 hound 3 (the terrain name TileSandstone is from memory of the vanilla list, unverified). Series 3.7 of 5.
Rework 3 of 2026-10-23 (owner: use the Backlot's own pets): scenes 4, 5, 6 now move the fixture pets (Tama, Shogun, Kuru, Atticus, Yuki) with `the animal "<name>" stands at` instead of spawning cats, dogs and thrumbos; the spawned labrador named Shogun is gone. Risk: a pet inside a place that its scenario empties is despawned first; positions asked of NSB, not answered yet. Confidence 4 and 5 lowered by one until the answer (3.5 and 3.5), series 3.5.
Honest estimate, owner asked 2026-10-23 (picture quality 1 to 5, replaces the uniform 4 of the table above; rule: under 4 is reworked before any ticket): 1 griffin 4, 2 kappa 3.5 (small subject), 3 pegasus 3 (grey, murky, no clear action), 4 kitsune 4, 5 phoenix 3.5, 6 hound 3.5, 7 unicorn 4, 8 manticore 4. Under 4: 2, 3, 5, 6.
NSB's pets answer (2026-10-23): Tama and Kuru are not in the save, so scenes 4 and 5 spawn a cat again; Shogun (177, 99), Yuki (171, 145), Atticus (189, 171) stay in scenes 4, 5, 6, none in a place emptied by this feature; whether the stands-at step finds a save pet is untested (the replay of 4, 5, 6 tells). Estimates unchanged.
Confidence per shot, method fixed 2026-10-23 (replaces the earlier figures): start at 5 for "the replay delivers the planned picture", minus 0.5 per visual doubt, minus 1 per step or name never played that can fail or empty the shot, minus 0.5 for a step played elsewhere but not in this feature (hairstyle, all shots). 1 griffin 4.5, 2 kappa 4, 3 pegasus 2.5 (soil under plants, contrast), 4 kitsune 2.5 (zoom 3, Shogun stands-at on a save pet), 5 phoenix 2.5 (Atticus stands-at, zoom 4, stones), 6 hound 2 (TileSandstone name, Yuki and Shogun stands-at, contrast), 7 unicorn 4.5, 8 manticore 4.5. Series 3.4. First thing to settle: does stands-at find a save pet (scenes 4, 5, 6).
