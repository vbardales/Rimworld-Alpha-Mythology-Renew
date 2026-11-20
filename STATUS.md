---
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythology
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
remote: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
visibility: public
workflow_stage: shootGallery[1.0.0]   # 2026-11-18: playTests 8.a 8.b 8.m 8.n closed after replay (ticket 160c green at e982aac, Virginie validated French); gallery candidates 9 to 14 in Art/Gallery
licence: silent
licence_at: "2026-09-12: upstream master 53a5518008821188009bbf996b7120ad9593cb5f and the Workshop page reviewed (602 comments, Bug Reports thread); no project licence, no redistribution grant, no refusal found. Refreshed 2026-09-26. Only a retexture permission (2022-08-21, conditional on the game EULA) was found, not a licence for this port. Silent = public (owner's rule)."
upstream_mod_remotes:
  - https://github.com/juanosarg/AlphaMythology
settings_audit: passed        # 2026-11-16 owner yes: settings passes EN 8 of 8 and FR 10 of 10 green at b475d59 (tickets 475d 3d74 89c5 20df)
localization: complete
translation_en: complete
translation_fr: complete      # 2026-11-12: Virginie validated in chat ("je valide la relecture") after twelve /review-translation runs, at c37f1d2 (replaces the 308a9ec validation; the Review line of TRANSLATION_REVIEW.md is hers to fill)
workshop: "3811323347 (0.1.0, creation of the publishIdFile only, 2026-10-01; the item is private, switching it to public is the owner's)"
published: no
workshop_required_items: "n/a, not released yet"   # 2026-11-13: item private, no Workshop release yet; the hand placement of Required Items by Virginie moves to prepareRelease/publish (AUDIT 4.g)
tested_on: "2026-11-18 pickle e982aac (French translation report and loading, ticket 160c, 4 of 4); 2026-11-18 pickle fe16852 (ticket 9fd5, 4 of 4); 2026-11-13 pickle 2a3a8e9 (log-en5 ticket 61ad 1 of 1, Player.log clean); 2026-11-13 pickle b475d59 (settings EN 8 of 8, FR 10 of 10 with language, translation report 1 of 1; tickets 475d 3d74 89c5 20df); 2026-11-08 pickle bb2d812 (settings EN and FR 8 of 8 each, tickets 58d7 2a1d; incompat pass e5ca: 2 of 3, the phoenix scenario red by the original's fallout, replay 26e1 on the default map); 2026-11-06 pickle 5017aa2 (French replays 49f6 translation report and aaf7 language captures green, tree staged at their start); earlier 2026-10-10, Pickle only: initial passes EN and FR at the tree of eba7208 (docs commits after), replays at c9bdc67; optional-provider passes and incompatibility pass not replayed at this revision (green on earlier revisions, non-regression after deploy)"
audit_at: 2026-10-10
audit_revision: dbc114e22cf23ab64baa7a9047141d161d17abf2 (clean tree at the start; this audit then edited Tests/Test-Validator.ps1, CHANGELOG.md, TESTING.md, Tests/Pickle/README.md, STATUS.md)
automated_tests: "passed 2026-10-10: Tests/UnitTests ALL PASSED (spawn rules 13, patch checks 47); Release build 0 warnings 0 errors"
xml_tests: "passed 2026-10-17 (3357d07): Check-Mod.ps1 now also runs shared Check-Translations at its end with the 6 compatibility Keyed keys allowed (NocturnalAnimals.BodyClock*, VEF_WarningEggExplodes), 174 assertions, Test-Validator 6 negative cases green; earlier 2026-10-11: Check-ModBasics (shared) then Check-Mod.ps1 174 own assertions, 86 XML files, 25 creatures; Test-Validator.ps1 6 negative cases (the runner was red before this audit, see Audit 2026-10-10); shared scripts/Check-Translations.ps1 224 source texts and French injections green 2026-10-11 (replaced Check-Translations.py, deleted)"
functional_tests: "passed 2026-11-13: F01 to F14 played by Pickle (Tests/FUNCTIONAL.md map), 8.g and 8.j accepted by Virginie in chat on that evidence"
ecosystem_line: 1.0            # 2026-11-19 PiI refresh done (AUDIT 2.h)
remaining:
  - "2026-11-20 RESULT of 1320 and the 5-scenario run: Tame works with made wild + designated + stands + paused 40 ticks. Candidates saved and subtitled at 6fb3d8f: 1-candidate-kitsune, 9-candidate-hunt-trio, 10-candidate-river-serpents (no blush, high ponytail Highpony, mouth visible in profile on 10, to be judged by Virginie at the whole-gallery review). 4 kappa REDO (score-gallery: decoration 3, bare ground, kappa small at 268 px): old capture not kept, decor added (Bonsai, 2 Daylily, SculptureSmall). 13 terrace failed at Refuel (Campfire full 19.99 of 20): now `is put out` then filled 10 percent, `is lit` dropped. FILED ticket 20261120-194210-966-842c PENDING (label gallery redo 4 kappa decor, 13 terrace campfire put out 6fb3d8f, evidence Tests/Pickle/Inbox/gallery-redo-e); do not refile. Ticket b930 (old 9 10 13) still RUNNING and redundant: delete its Inbox folder at RUN_DONE without reading. 14 barn ok-ish fallback stays. NEXT: read 842c captures (terrace framing offsets to tune, blush, mouth), score-gallery, save 4 and 13, subtitles, 3 5 6 7 11 12 14 still to re-read for blush and mouth, then re-ask Virginie for the whole gallery (AUDIT 9.f)."
  - "2026-11-20 VIRGINIE: 13 also blushes and mouth misplaced (confirms 9 10); 14 ok-ish: the minotaur Asterion leans on the billiard table. Scenario 14 edited and header line 77 aligned (Asterion and Hay moved 2 cells east to (193, 239) and (194, 239), Nelim near (196, 238) hauls to (196, 237)); Check-ShotlistVsScenario OK. 14 stays in Art/ as ok-ish fallback until the new one lands. TO DO: rewrite scenario 13 (terrace), then ONE ticket with 9 10 13 14 (max about 5 scenarios) after reading 11ab and a140, with plain normal expression and temperature 20 first (PiT advice)."
  - "2026-11-20 PiT answer on blush and mouth (from docs, not played in profile): blush is not the face kit; causes are room heat (sweat then red cheeks) and mood overlays Thought_Hot, Thought_Naked, NLR-Blush/NLR-Hot; moodCheerful set LAST may bring a soft blush back. FIX TO TRY at refile: temperature 20 degrees at the start, kit, then `Nelim has her own face` (sets normal+blink), final expression plain "normal" (no moodCheerful). If a blush still shows in profile, send PiT run id and image (real defect, PiT writes a probe). Mouth in profile: NSB Beauty2 patch (steps `the Beauty2 mouth offset is <float>` default 0.035 and `the Beauty2 mouth vertical offset is <float>` default 0), tuned from the front only; PiT adds a face-crop probe at West and East if 11ab and a140 show the same offset: TELL PiT after reading them. NB tickets 11ab and a140 still use moodCheerful2 and moodCheerful: if they blush, refile with plain normal before concluding."
  - "2026-11-20 VIRGINIE: 11 and 12 validated; 13 refused (why shoot it in the factory: the preindustrial workshop reads as a machine hall, fermenters and pipes wall at the left, not a forge; blush on Nelim too). 13 REDO, both files deleted. Plan: move the small ones (Salamander, Ieltxu, WillOWisp) out of the workshop to the terrace (x 193-200, z 118-124, mostly free cells per SANCTUAIRE-CASES, unused by this feature), 21:30, lit by the Brazier, Nelim crafts or tends nothing industrial: pick a gesture that fits (Refuel the brazier or hold out a bowl). Rewrite scenario 13 + shotlist line 76 + PUBLICATION.md row 13 (rename to 13-candidate-small-ones, subtitle: the three small ones keep Nelim company by the fire) when refiling, in ONE ticket with 9 and 10 after PiT answers on the blush and mouth."
  - "2026-11-20 VIRGINIE on 9 and 10: Nelim blushes (red cheek patch) and the mouth is misplaced in profile (9 a bit high, 10 badly placed). Confirmed by eye on both clean images. Shared-tool anomaly (face in side view): described to PiT (NPT) with the capture paths, answer awaited; 9 and 10 are NOT candidates now, REDO but refile only after the answer (GALLERY.md: never work around a shared-tool anomaly). Same blush on 1 and 4 old captures; the new ones (tickets 11ab, a140) tell whether the current face step still blushes. Likely also affects 3 5 6 7 11 12 13 14 where her face is visible: re-read each for the blush before the next ask."
  - "2026-11-20 VIRGINIE partial yes: images 1, 2, 5, 6, 7, 8 validated (1 only as a slot: its old capture was deleted, redo ticket 11ab, she wants the new one without blush and with the high ponytail). Not yet said: 3, 9, 10, 11, 12, 13, 14, and new 1 and 4. No gallery_validated_sha until she says yes to the whole gallery."
  - "2026-11-20 VIRGINIE refused image 4 kappa too (old 2026-10-13 capture: blush, bun, yellow top). Deleted both 4-kappa.jpg. FILED ticket 20261120-172211-757-a140 WAITING (label gallery kappa redo 4 blush hair 0e456b3, filter scenario kappa by the pond, DepMap wsl-deps.sanctuary.map, evidence Tests/Pickle/Inbox/gallery-redo-z); do not refile. With 1 (ticket 11ab): same read after both land: no blush, Highpony in the appearance log (if blush remains it is the face step, tell NSB). Images 2 phoenix and 8 settings have no Nelim, kept. Save as 1-candidate-kitsune.jpg and 4-candidate-kappa.jpg, update PUBLICATION.md rows 1 and 4, burn subtitles, re-ask Virginie for the whole gallery (AUDIT 9.f)."
  - "2026-11-20 VIRGINIE refused image 1 kitsune (old 2026-10-13 capture: Nelim blushes, wrong hair, bun). Deleted Art/Gallery/1-kitsune.jpg and Art/Gallery-clean/1-kitsune.jpg. FILED ticket 20261120-172142-698-11ab WAITING (label gallery kitsune redo 1 blush hair 0e456b3, filter scenario 4 kitsune at the tea room, DepMap wsl-deps.sanctuary.map, evidence Tests/Pickle/Inbox/gallery-redo-y); do not refile. NEXT after read: open capture, check no blush and Roo_HD_Hair_Highpony in the appearance log, score-gallery, save as 1-candidate-kitsune.jpg in both folders, update PUBLICATION.md subtitle row 1, burn subtitle, re-ask Virginie for the whole gallery (AUDIT 9.f)."
  - "2026-11-18 Folded 16 older remaining entries (rate-gallery, tickets 1e15 fdad 0456 2c64 7418 9fd5 160c reads, replay-audit, 8.m, 8.b, 8.a closures, 2026-11-17 redo 5) into Docs/runs/2026-11-status-fold-10.md; their state: 8.a 8.b 8.m 8.n closed, gallery candidates redone at ee7dfa7."
  - "2026-10-17 feature (upstream PR 6): English fixes to carry upstream: Manticore description now `attacking from range` (done here); Erymanthian boar `slowing its progress and advantage` is still to fix upstream only (suggested: `slowing it down and negating its advantage`); not changed here; 2026-11-12 ChatGPT review adds two more upstream-only candidates: Cerberus `specially when modified` to `especially`, Pegasus `could make such flimsy wings to support their weight` to `... wings support their weight`"
  - "2026-10-10 feature (prepareRelease, AUDIT 3.c/11.f/12.e): CHANGELOG [Unreleased] stays on top until the dry-run; in the commit whose sha goes to the dry-run it becomes `## [1.0.0] - <planned send date>`; a slipped send means a corrected date, a new commit and a new dry-run (Check-Status WARNs changelog from publish on)"
  - "2026-10-10 feature (followUp 14.b): the Use This Instead comment for Mlie (3396308787) is drafted in PUBLICATION.md; hand it to Virginie as an orange step once the item is public, with the link and the text ready to paste"
  - "2026-10-10 feature (publish 13.b): add the Alpha Mythology Renew row to ../USE_THIS_INSTEAD.md once the item is public (old Workshop id 1821617793, read the old name, author and versions on its page; new id 3811323347); the owner reports it to Use This Instead"
  - "2026-10-10 feature (writeDocs 11.h): thank-you drafts written in PUBLICATION.md for RWoM, Advanced Biomes, Nature's Pretty Sweet, Elves, Giddy-Up 2, Dogs mate, Better Crossbreeding and Tree Chopping Speed Stat; Covers completed in the register (protocols 3a01556 and 951bcc7). No draft, by the owner's earlier call: the original's page, Vanilla Genetics Expanded and Vanilla Achievements Expanded (Sarg Bjornson answers there). Drafts are read against the owner's voice at writeDocs, posted after the item is public (followUp 14.b)"
  - "2026-10-10 feature (blocker before 1.0.0): Resolve This Instead (nelim.resolvethisinstead, hard dependency) needs its own public Workshop page first; no Workshop id yet"
  - "2026-11-12 1.7 pass closed, tested_1_7 yes (English only): load, settings, shortcut, restart green; features 13 to 17 green (9007 RIMMSQOL route 2 of 2, 7f53 burned grass; earlier runs in docs/runs/2026-11-status-fold-3.md); gaps: the 2 Tree Chopping Speed scenarios not played (provider lists 1.2 to 1.6), French not playable on 1.7 (no pack), current net472 DLL loaded unchanged; <li>1.7</li>, minor bump and Preview redo stay a publication gesture"
  - "2026-11-09 feature (shootGallery, shotlist; owner request): at write-shotlist also plan shots with the retextured version of the creatures (Workshop https://steamcommunity.com/sharedfiles/filedetails/?id=3384794582): optional-provider mod, ask NPT for the step if the load needs one, list the mod in the shot's `mods` column, check licence/permission wording before any public use (only a 2022-08-21 retexture permission is on record for the original)"
code_review_sha: fe16852a1383bd3756c74d41e98ba97dd9c0039e
publication_changelog_review_sha: 92ed1e831806f7b0fead291d3b1a8ad738562bc9
echo_review_sha: 78c1e580deb99203ddece9fb25f09cd895f4b824
social_preview_sha256: c51c55af47ec42afdad3dd8c48ab6917900dcda75dddf81195bbe7ee3911c2e5
upstream_synced: 2026-11-12 juanosarg/AlphaMythology@53a5518
updated: 2026-11-18
tested_1_7: yes   # 2026-11-12, English only; gaps in the 1.7 pass entry of remaining
protocols_read_sha: ec07a1ba07d72f67247acb87a06338516eb2e3de
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
French review by Virginie: 2026-11-12 validated in chat ("Validé") at 308a9ec, after the 2026-10-17 validation was cancelled (page-header bug of review-translation) and /review-translation was redone (two runs read; applied: MM_Catoblepas.description "buffle du Cap", MM_LesserWyvern.description "douleur extrême", 59bfc1c; English source fixes left as upstream candidates). Earlier: 2026-10-17 full French read at 730ae3f (FRENCH_REVIEW.md regenerated at b8fb0f0) validated in chat ("relu, validé"), after the ChatGPT retouches applied that day (Giddy Up! prompt removed, catoblepas, kappa, MM_Grabbed.label, MM_UtilityWorkerDesc); the Review line table of FRENCH_REVIEW.md stays hers to fill. Earlier: 2026-10-17 validated in chat the three texts rewritten without tu or vous (MM_MountFastDesc, MM_MountFastArmouredDesc, MM_LesserWyvern.description). Earlier: 2026-10-10 at `33196d1`: two rows added after game's report (`MM_OpenWound.labelNounPretty`, wisp `customString`) validated in chat ('validé'); `FRENCH_REVIEW.md` from that revision; game's French report green (ticket c626). Earlier: 2026-10-01 at `990f571` (corrections 2026-09-30 and 2026-10-01); further corrections from her review applied 2026-10-08 at `37c229b` (seven texts, English untouched). Written on her word, not by a session.
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

Gallery and shotlist journal (reshoot 2026-10-15, shotlist ratings, scenario reworks 1 to 9, open-at-sleep sections 2026-10-23 to 2026-11-06, resumes of 2026-11-05 and 2026-11-06): `docs/runs/2026-11-status-fold-2.md`; read it again at `shootGallery` (the gallery plan, NSB facts, NPT answers and scene estimates live there).

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

## Transitions 2026-10-13 (shootGallery to mountPreview to writeDocs to prepareRelease)

Folded 2026-11-14 into Docs/runs/2026-11-status-fold-5.md.

## Resume 2026-11-09 to 2026-11-12 (session code AlM)
Folded 2026-11-16 into Docs/runs/2026-11-status-fold-6.md (protocols reads, tickets 26e1 7f53 0c80 a8f7 9007 4008 9161 c309, optional passes opt2, eleven /review-translation rounds, upstream PR 4 5 6 state).

## Ecosystem (worklist pass 2026-11-12, docs/inventory/ecosystem-worklist.tsv)

Four rows, nothing done outward.
- Combat Extended (2890901044): matters. Its `ModPatches/Alpha Mythology` (5 files, 83 KB, 125 `MM_` references: races, bodies, hediffs, projectiles) is gated by `LoadFolders.xml` line 36 on `sarg.magicalmenagerie`, so it never fires with this port (same defNames as the original, packageId `nelim.alphamythology`). Proposal (a): ask the CE authors to add our packageId to that one LoadFolders line; (b) rejected, a copy of 83 KB of CE data tied to CE versions; (c) not needed, no conflict. Waits for Virginie's go.
- Alpha Bees (1558161673): matters little. `1.5/Mods/MagicalMenagerie` and `1.6/Mods/MagicalMenagerie` (18 KB: bee combinations, bee list, bee, comb and research items) are keyed on `MM_` defNames and gated on `sarg.magicalmenagerie`. Proposal (a): ask the author to add our packageId; (b) rejected, same data copy. Waits for Virginie's go.
- Alpha Mythology (1821617793): false row, it is the original itself; already (c): declared incompatible (`sarg.magicalmenagerie`).
- Dog Collars (2644644983): link only (cites the original), dropped.
- 2026-11-12 Ecosystem go from Virginie: issues opened asking to add nelim.alphamythology next to sarg.magicalmenagerie in LoadFolders: Combat Extended https://github.com/CombatExtended-Continued/CombatExtended/issues/4839 and Alpha Bees https://github.com/juanosarg/AlphaBees/issues/16. Nothing to do until they answer; an issue closed for inactivity after one month is not reopened on its own.
- 2026-11-19 PiI refresh (docs/inventory/ecosystem-steam/AlphaMythologyRenew.md): no new fork, patch, retexture or replacement. Corrects "no translations": 7 items translate or patch the original, all keyed to `sarg.magicalmenagerie` (usable only as source texts, licence per item not read): French 3059248251; Chinese pack 2898318931 (alive 1.6 1.7); ua/ru 2890142522; 2469628967; 2521068999; Ru 2635934509; Chinese patch 1842778209. Verdict: integrate none now; decide at localize whether any adds a language (needs licence read per item, ATTRIBUTION.md).

- 2026-11-13 names: Virginie chose the fr.wikipedia forms (ahuitzotl, xièzhì, idittu, wyverne, oiseau du lac Stymphale) and "normalise" for English creature casing; applied in Mod/ French and English, PR #6 branch 6b92727; Docs/review-names.md. Redo the French 8.c replays on this text.

- 2026-11-13 names, correction: Virginie ruled "if two forms are equivalent, keep the one from other languages": ahuizotl, xiezhi, ieltxu kept in French; only petite wyverne and oiseau du lac Stymphale changed (Docs/review-names.md).

- 2026-11-13 Virginie validated the review ("je valide la review") at e4f7651 (names and casing decided, see Docs/review-names.md). Ecosystem: ECOSYSTEM? sent to PiI (new procedure, AUDIT 1.a and 8.0); copy its one-line summary into the Ecosystem section when it answers. No Steam search or scan from this session.

- 2026-11-13 CE issue 4839 answered by N7Huntsman (maintainer): a PR adding our id is welcome, but it cannot be merged until our mod is available to test (our Workshop item 3811323347 is private). No PR opened (outward, needs Virginie go). Alpha Bees 16 still unanswered.

- 2026-11-13 Virginie: the Combat Extended PR (add nelim.alphamythology next to sarg.magicalmenagerie in LoadFolders, CE issue 4839) is opened AFTER the Workshop release, not before.
- 2026-11-16 Virginie: the AlphaBees fork branch (add nelim.alphamythology next to sarg.magicalmenagerie, issue juanosarg/AlphaBees#16) is made AFTER the Workshop release, like the Combat Extended PR: no branch, no PR before.
- 2026-11-13 playTests journal (tickets 475d 3d74 89c5 20df 61ad, 8.c to 8.m) folded into Docs/runs/2026-11-status-fold-4.md. All green at b475d59 and 2a3a8e9; code_review_sha d1abd41; 8.i Player.log clean (61ad); 8.g and 8.j closed on existing evidence (owner accepted in chat).
- 2026-11-13 8.g and 8.j: Virginie accepts the existing evidence (chat, "Accept evidence"); no full pass refiled. Basis: F01 to F14 mapped (Tests/FUNCTIONAL.md), Source and Mod/Assemblies unchanged since ea53d3c, Mod/ texts only since, 7ea2822 covered by settings-en4 and log-en5 green. Playtest sub-steps 8.c to 8.m all closed; next: playTests exit check (Check-Status, tested_on, workflow_stage move).

- 2026-11-16 Folded the 2026-11-12 review rounds and avec-facultatifs diagnosis (tickets 4008 9161 c309: vanilla BiomeDef.CommonalityOfAnimal NRE with the Elves pawn kinds, not a defect of this port, do not refile) into docs/runs/2026-11-status-fold-7.md.

- 2026-11-16 Gallery run reads (2026-11-15 to 2026-11-16) folded into Docs/runs/2026-11-status-fold-8.md; redo journal of 2026-11-17 into Docs/runs/2026-11-status-fold-9.md. State: candidates 9 10 11 12 14 are Art/Gallery/*-candidate-*.jpg; scene 13 (small ones at the forge) waits on ticket fd85 (do not refile); if its capture shows Nelim and the forge, accept as candidate; the 9 to 14 shots, order and names get one score-gallery and one review by Virginie at the end.

## NSB (sync 2026-11-14, /sync-nsb-npt)

Places read: 2026-11-20 diffs only, no place doc touched; earlier note (2026-11-14: NSB content unchanged since 2026-11-06; only commit 18abf53 renamed `docs/` to `Docs/`, 0 lines changed). Tribe read: 2026-11-20 (diffs only, nothing touched since 2026-11-19; CATALOGUE-ANIMAUX last fully read 2026-11-14, profiles 2026-10-23). Steps read: 2026-11-20 (diffs only; NPT `steps.md` and `ColonistRace/docs/catalogues` untouched since 2026-11-18, no commit on them).
2026-11-20 fifth sync (diffs only): NSB commits since 2026-11-19 touch only its own STATUS.md and Docs/runs (journal migration, replay result): no place, colonist, animal sheet, VALIDE or APPARENCES line; NPT: no commit on `steps.md` or the catalogues. Rules 1 to 5 said back: NSB free, outside NSB asks Virginie (none used), colonist properties only on her word (Nelim: hair Highpony 2026-10-23, mouth 2026-10-25), every outfit free, every included animal in a shot. Included animals (rule 5): 25 of 25 in the shotlist (old 7: Kitsune Phoenix Manticore Kappa Pegasus Unicorn Griffin; 9 to 14: Hind Boar Bird, Hydra Ahuizotl Tlilcoatl, Basilisk Catoblepas Cerberus, Qilin Fenghuang Xiezhi, Salamander Ieltxu WillOWisp, Minotaur Chimera Wyvern), none MISSING; shots 9 and 10 refiled (3939), 3 5 6 7 replayed (fa58). Scene 10 stays without railings (Cat candidates not validated).


Places (accepted gallery, plan in Docs/runs/2026-11-status-fold-2.md): statue-garden (1 griffin) | water-garden bank (5 pegasus) | tea-room hut (3 kitsune) | fire-pit (2 phoenix) | other places of 4, 6, 7 per the feature header | decor placed and removed per scene, noon 4 Sept 5500 | last read 2026-10-23.

Colonists: Nelim | shots 1 to 7 | one outfit all day, deep blue top (36, 72, 140) | profile last read 2026-10-23 | exception: hair `Roo_HD_Hair_Highpony` (owner chat 2026-10-23), mouth overridden when the scenario justifies it (owner chat 2026-10-25).

Animals: save pets Shogun, Yuki, Atticus (fixture pets, stand-at) | cat spawned for Tama and Kuru (not in the save) | outfit: animals may be dressed when the scenario justifies it (owner chat 2026-10-25, wardrobe not validated) | sheets last read 2026-10-23 | exceptions: none.

Included animals (rule 5), 25 PawnKindDefs of the mod: shown by an accepted shot: Kitsune, Phoenix, Manticore, Kappa, Pegasus, Unicorn, Griffin (7). MISSING (no shot): Ahuizotl, Basilisk, Catoblepas, Cerberus, CeryneianHind, Chimera, ErymanthianBoar, Fenghuang, Ieltxu, LernaeanHydra, LesserWyvern, Qilin, Salamander, StymphalianBird, Tlilcoatl, WildMinotaur, WillOWisp, Xiezhi (18). Gap to fix in the shotlist (write-shotlist): group shots or new shots, then play them; rule 5 is not met by the current gallery.

## Shotlist (write-shotlist 2026-11-14, extension for rule 5; full lines in the header of `09-publication-shots.feature`, blocks "SHOTLIST EXTENSION 2026-11-14" and "SCORE-GALLERY ROUND 1")


| Shot | Place, hour | Lead and group | Nelim's gesture | Zoom |
|---|---|---|---|---|
| 9 hunt-trio | flower-garden, 18:30 | CeryneianHind, ErymanthianBoar, StymphalianBird | carries RawBerries | 3.5 |
| 10 river-serpents | river-bridge, 19:15 | LernaeanHydra, Ahuizotl, Tlilcoatl | carries meat on the bridge | 4.5 |
| 11 gaze-group | statue-garden, 20:00 | Basilisk (on its burned ring), Catoblepas, Cerberus | refuels a TorchLamp | 4.5 |
| 12 east | ritual-hall, 20:45 | Qilin, Fenghuang, Xiezhi | refuels a Brazier placed at (204, 118) | 4.5 |
| 13 small-ones | preindustrial-workshop, 21:30 | Salamander, Ieltxu, WillOWisp | crafts at the bench | 3 |
| 14 barn-night | barn, 22:30 | WildMinotaur, Chimera, LesserWyvern | sets down a hay bale | 5.5 |

Director's pass (Opus sub-agent, 2026-11-14): all remarks kept (apples and trampled flowers out, Basilisk lead on its ring, gaze group to statue-garden, water group to river-bridge at dusk, Ieltxu and LesserWyvern swapped, creatures give no light of their own so the light is the place's, clock order, barn closes the day). Rule 5 after this list: all 25 creatures have a shot on paper. Open: owner arbitrations none; accepted shots 5 and 7 stand on places marked "a embellir" (told, out of scope); gallery order by clock (criterion k) conflicts with the strength order used for the accepted 1 to 8: decide at the final reindex.
- 2026-11-16 retexture read (Taste of Vanilla - The Alpha Mythology 3384794582, IcyCheeseCake, ICC.TOV.TAM, 1.0 to 1.5, textures only, 133 files): 127 of its texture paths equal ours (same MM_ defNames), 6 are for a Mechataur we do not carry. It hard-depends (`modDependencies`) on sarg.magicalmenagerie and loads after it, so it cannot load with this port; no licence or permission text in the item (only Sarg's 2022-08-21 conditional retexture permission, which is not ours to extend). Own gated patch (b) rejected: it would copy their textures without a licence. Declaring incompatible (c) adds nothing, the dependency already refuses it. Proposal (a): ask the author, after the Workshop release (like CE and AlphaBees), to drop the hard dependency on the original and use loadAfter for both ids, which makes the textures apply to our paths unchanged. The 2026-11-09 request for retextured-creature shots cannot be played until then (the port and the retexture cannot be loaded together). Waits for Virginie's go for the outward message.
- 2026-11-16 Linked rows 3716851548 (Yukiyuki's Magical Menagerie Collection, Yukiyuki.MonmusuCollection1, 7 monster-girl creatures, FS_ defNames) and 3723720740 (its zh translation): name-only neighbours of sarg.magicalmenagerie, no dependency, no shared defName, no translation of the original to integrate; no action. Marked red cross by Virginie's order in the ecosystem-links block.
- 2026-11-16 Virginie yes to both: (1) RTI alias sarg.magicalmenagerie to nelim.alphamythology added to Mod/About/ResolveThisInstead.xml (compatible true, runtime false) so the retexture Taste of Vanilla 3384794582 can load with the port; RTI (local_f944552f) says the mod-list dependency warning stays and load order is by hand; not tested for this pair: a Pickle scenario with the retexture in the map is the proof (to write for the gallery shots, ask NPT for the map entry). (2) French cites the mod 'Giddy Up! (Hue, coco !)' in MM_MountFastDesc and MM_MountFastArmouredDesc. Mod/ changed since code_review_sha: 8.m review of the diff to redo at the next replay (text and About only).
- 2026-11-16 Virginie: the retexture test (Taste of Vanilla 3384794582 loaded with the port through the RTI alias) waits for RTI (Resolve This Instead, nelim.resolvethisinstead, not published yet): no map entry asked from NPT and no scenario written until RTI is ready. The retexture stays subscribed and protected by PiI. The shots with the retextured creatures (2026-11-09 request) wait for it.
- 2026-11-16 round 8 (applied locally): English Qilin casing 'qilins' bodies' in Races_Qilin.xml: upstream pull request candidate (the original keeps 'Qilins' bodies'); join it to the fork branch of PR 6 when Virginie says yes.
- 2026-11-16 round 9 (applied locally): English 'Though qilins are usually peaceful' in Races_Qilin.xml, with the earlier 'qilins' bodies': both upstream pull request candidates (casing), to join the fork branch of PR 6 once Virginie says yes.
- 2026-11-16 round 10 (applied locally): English sentence-initial 'Qilins' bodies' restored after the round-8 lowercasing, and achievement label 'Statue of a Colonist' (was 'Statue of Colonist') in AchievementsPatch.xml; both upstream pull request candidates if the original carries them.
- 2026-11-16 round 15 (applied locally): English species casing 'The kitsune', 'The qilin', 'The will-o'-wisp' in Races_*.xml descriptions; upstream pull request candidates (casing) with the qilin ones, to join the fork branch of PR 6 once Virginie says yes.
