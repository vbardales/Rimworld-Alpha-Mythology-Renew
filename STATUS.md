---
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythology
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
remote: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
visibility: public
workflow_stage: shootGallery[1.0.0]   # 2026-11-13 playTests 8.a to 8.n closed (tree b475d59 / 2a3a8e9); protocols read dddcd388
licence: silent
licence_at: "2026-09-12: upstream master 53a5518008821188009bbf996b7120ad9593cb5f and the Workshop page reviewed (602 comments, Bug Reports thread); no project licence, no redistribution grant, no refusal found. Refreshed 2026-09-26. Only a retexture permission (2022-08-21, conditional on the game EULA) was found, not a licence for this port. Silent = public (owner's rule)."
upstream_mod_remotes:
  - https://github.com/juanosarg/AlphaMythology
settings_audit: partial
localization: complete
translation_en: complete
translation_fr: complete      # 2026-11-12: Virginie validated in chat ("je valide la relecture") after twelve /review-translation runs, at c37f1d2 (replaces the 308a9ec validation; the Review line of TRANSLATION_REVIEW.md is hers to fill)
workshop: "3811323347 (0.1.0, creation of the publishIdFile only, 2026-10-01; the item is private, switching it to public is the owner's)"
published: no
workshop_required_items: "n/a, not released yet"   # 2026-11-13: item private, no Workshop release yet; the hand placement of Required Items by Virginie moves to prepareRelease/publish (AUDIT 4.g)
tested_on: "2026-11-13 pickle 2a3a8e9 (log-en5 ticket 61ad 1 of 1, Player.log clean); 2026-11-13 pickle b475d59 (settings EN 8 of 8, FR 10 of 10 with language, translation report 1 of 1; tickets 475d 3d74 89c5 20df); 2026-11-08 pickle bb2d812 (settings EN and FR 8 of 8 each, tickets 58d7 2a1d; incompat pass e5ca: 2 of 3, the phoenix scenario red by the original's fallout, replay 26e1 on the default map); 2026-11-06 pickle 5017aa2 (French replays 49f6 translation report and aaf7 language captures green, tree staged at their start); earlier 2026-10-10, Pickle only: initial passes EN and FR at the tree of eba7208 (docs commits after), replays at c9bdc67; optional-provider passes and incompatibility pass not replayed at this revision (green on earlier revisions, non-regression after deploy)"
audit_at: 2026-10-10
audit_revision: dbc114e22cf23ab64baa7a9047141d161d17abf2 (clean tree at the start; this audit then edited Tests/Test-Validator.ps1, CHANGELOG.md, TESTING.md, Tests/Pickle/README.md, STATUS.md)
automated_tests: "passed 2026-10-10: Tests/UnitTests ALL PASSED (spawn rules 13, patch checks 47); Release build 0 warnings 0 errors"
xml_tests: "passed 2026-10-17 (3357d07): Check-Mod.ps1 now also runs shared Check-Translations at its end with the 6 compatibility Keyed keys allowed (NocturnalAnimals.BodyClock*, VEF_WarningEggExplodes), 174 assertions, Test-Validator 6 negative cases green; earlier 2026-10-11: Check-ModBasics (shared) then Check-Mod.ps1 174 own assertions, 86 XML files, 25 creatures; Test-Validator.ps1 6 negative cases (the runner was red before this audit, see Audit 2026-10-10); shared scripts/Check-Translations.ps1 224 source texts and French injections green 2026-10-11 (replaced Check-Translations.py, deleted)"
functional_tests: "unverified in this audit; Pickle history reports green passes (see Tests): not re-read here"
remaining:
  - "2026-11-13 playTests (replay-audit, ledger 72 rows): 8.c, 8.f, 8.h, 8.k, 8.m done at tree d1abd41 (see Tests table in TESTING.md and the 2026-11-13 lines below); 8.d 8.g 8.i 8.j closed later the same day (see lines below); playTests exit sub-steps all closed. Migration from Animal Ark: not applicable, documented as not carried over (CHANGELOG, PUBLICATION, About.xml)."
  - "2026-10-17 feature (upstream PR 6): English fixes to carry upstream: Manticore description now `attacking from range` (done here); Erymanthian boar `slowing its progress and advantage` is still to fix upstream only (suggested: `slowing it down and negating its advantage`); not changed here; 2026-11-12 ChatGPT review adds two more upstream-only candidates: Cerberus `specially when modified` to `especially`, Pegasus `could make such flimsy wings to support their weight` to `... wings support their weight`"
  - "2026-10-10 feature (prepareRelease, AUDIT 3.c/11.f/12.e): CHANGELOG [Unreleased] stays on top until the dry-run; in the commit whose sha goes to the dry-run it becomes `## [1.0.0] - <planned send date>`; a slipped send means a corrected date, a new commit and a new dry-run (Check-Status WARNs changelog from publish on)"
  - "2026-10-10 feature (followUp 14.b): the Use This Instead comment for Mlie (3396308787) is drafted in PUBLICATION.md; hand it to Virginie as an orange step once the item is public, with the link and the text ready to paste"
  - "2026-10-10 feature (publish 13.b): add the Alpha Mythology Renew row to ../USE_THIS_INSTEAD.md once the item is public (old Workshop id 1821617793, read the old name, author and versions on its page; new id 3811323347); the owner reports it to Use This Instead"
  - "2026-10-10 feature (writeDocs 11.h): thank-you drafts written in PUBLICATION.md for RWoM, Advanced Biomes, Nature's Pretty Sweet, Elves, Giddy-Up 2, Dogs mate, Better Crossbreeding and Tree Chopping Speed Stat; Covers completed in the register (protocols 3a01556 and 951bcc7). No draft, by the owner's earlier call: the original's page, Vanilla Genetics Expanded and Vanilla Achievements Expanded (Sarg Bjornson answers there). Drafts are read against the owner's voice at writeDocs, posted after the item is public (followUp 14.b)"
  - "2026-10-10 feature (blocker before 1.0.0): Resolve This Instead (nelim.resolvethisinstead, hard dependency) needs its own public Workshop page first; no Workshop id yet"
  - "2026-11-12 1.7 pass closed, tested_1_7 yes (English only): load, settings, shortcut, restart green; features 13 to 17 green (9007 RIMMSQOL route 2 of 2, 7f53 burned grass; earlier runs in docs/runs/2026-11-status-fold-3.md); gaps: the 2 Tree Chopping Speed scenarios not played (provider lists 1.2 to 1.6), French not playable on 1.7 (no pack), current net472 DLL loaded unchanged; <li>1.7</li>, minor bump and Preview redo stay a publication gesture"
  - "2026-10-19 feature (shootGallery 9): eight new candidates in Art/Gallery (1-candidate-phoenix to 8-candidate-manticore, shotlist at 4 of 5, tickets c6b6 and a7e0 read, docs/runs/2026-10-18-c6b6-a7e0-gallery-shotlist.md); Virginie accepts or refuses each, then reindex with 8-settings.jpg as 9, update the gallery table below, subtitles from PUBLICATION.md 'Gallery subtitles' (clean originals in Art/Gallery-clean)"
  - "2026-11-09 feature (shootGallery, shotlist; owner request): at write-shotlist also plan shots with the retextured version of the creatures (Workshop https://steamcommunity.com/sharedfiles/filedetails/?id=3384794582): optional-provider mod, ask NPT for the step if the load needs one, list the mod in the shot's `mods` column, check licence/permission wording before any public use (only a 2022-08-21 retexture permission is on record for the original)"
code_review_sha: d1abd41a8b2c6973ce671f7d3312177ee82f96fd
publication_changelog_review_sha: 92ed1e831806f7b0fead291d3b1a8ad738562bc9
echo_review_sha: 78c1e580deb99203ddece9fb25f09cd895f4b824
social_preview_sha256: c51c55af47ec42afdad3dd8c48ab6917900dcda75dddf81195bbe7ee3911c2e5
upstream_synced: 2026-11-12 juanosarg/AlphaMythology@53a5518
updated: 2026-11-16
tested_1_7: yes   # 2026-11-12, English only; gaps in the 1.7 pass entry of remaining
protocols_read_sha: cead26e4e8802fd28ca5f97a3eaf063a10af0f85
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
- 2026-11-12 seventh /review-translation: 2 applied locally and upstream (Nahuatl, Mount Erymanthus capitals), 0 refused; Review line stays Virginie's.
- 2026-11-12 eighth /review-translation: 1 applied (French AMR_SpawnMultiplierTip 'mais uniquement aux nouvelles apparitions'), 0 refused, no source-column change. French file changed again: the French replays of 8.c are to redo once, after the last review.
- 2026-11-12 ninth /review-translation: 5 applied (English ToxicBite hediff, Fenghuang, Ieltxu, Xiezhi, upstream too; French MM_Kappa 'si cette eau se renverse'), 0 refused. French file changed once more: 8.c French replays to redo after the last review.
- 2026-11-12 tenth /review-translation: 3 applied (English Ahuizotl fur, Lesser Wyvern fangs and tails, upstream too; French Lesser Wyvern 'apparaissent dans le mod' aligned with the English), 0 refused.
- 2026-11-12 eleventh /review-translation: 4 applied (English Chimera 'fire-breathing', Kappa 'trained in Guard', upstream too; French achievement StatueOfColonist 'par pétrification'; PUBLICATION.md griffin gallery subtitle), 0 refused. The griffin subtitle is not burned yet into 7-griffin.jpg if Art/Gallery-clean does not exist; burn it with the others after acceptance.
- 2026-11-16 PiI answer read (docs/inventory/ecosystem-steam/AlphaMythologyRenew.md, study 2026-11-13). Duplicates and forks: none (only the original 1821617793, 25 shared defNames, declared incompatible). Replacements: none. Patches: Combat Extended and Alpha Bees, both gated on sarg.magicalmenagerie, issues 4839 and 16 open (see above; CE PR opened after the Workshop release). Retextures: none found. Translations of the original: none, nothing to integrate at localize. Links: Taste of Vanilla - The Alpha Mythology 3384794582 (food add-on), Yukiyuki collection 3716851548 / 3723720740. Neighbours with other creatures, no action: Mythic Ages Megafauna Bestiary, Biotech Expansion Mythic, Creatures of the Vael, Mooloh's Dnd Menagerie, Grimstone Beasts. Verdict: no duplicate, one real compat target (CE).
- 2026-11-12 twelfth /review-translation: 0 applied, 1 refused (RimWorld version in the Steam description, owner rule of 2026-10-13), proper-noun table confirmed as deliberate. Logged in Docs/review-refusals.md.
- 2026-11-12 Ecosystem go from Virginie: issues opened asking to add nelim.alphamythology next to sarg.magicalmenagerie in LoadFolders: Combat Extended https://github.com/CombatExtended-Continued/CombatExtended/issues/4839 and Alpha Bees https://github.com/juanosarg/AlphaBees/issues/16. Nothing to do until they answer; an issue closed for inactivity after one month is not reopened on its own.
- 2026-11-12 ticket 4008 read: total 4, passed 0, failed 4, exitReason failed (avec-facultatifs): NRE in the suite's own step `records the wild commonality of` (Tests/Pickle/Source/Steps.cs, vanilla `BiomeDef.CommonalityOfAnimal` over every biome) and in the game draw, no stack in Player.log. Same family as the opt2-facultatifs reds. Suspect: a biome or pawn kind of the Elves or Advanced Biomes set (Player.log shows LotRE ConfigErrors NREs and `RaceProperties.get_AnyPawnKind`), i.e. vanilla failing without our mod; not proven. Step now logs biome, source mod and stack (7ce3b23). Ticket 20261112-223357-757-9161 filed (02-settings multiplier scenario, avec-facultatifs, evidence Inbox/opt2-facultatifs-diag); waits for RUN_DONE, do not refile. Report of 4008 parked in Tests/Pickle/Parked/opt2-facultatifs-settings.
- 2026-11-12 ticket 9161 read: red 1 of 1, same NRE, and no '[AMR test]' line in Player.log: the committed steps DLL (Tests/Pickle/Mod/Pickle/Assemblies) was stale, so the diagnostic in Steps.cs never ran. Rebuilt with dotnet build (Tests/Pickle/Source), committed 4b3d2c7, report parked; ticket filed again (evidence Inbox/opt2-facultatifs-diag2). Lesson: after any Tests/Pickle/Source change rebuild and commit the DLL before filing.
- 2026-11-12 cause of the avec-facultatifs reds found (ticket c309, stack in Player.log, report parked): vanilla `RimWorld.BiomeDef.CommonalityOfAnimal` throws a NullReferenceException (offset 0x7d, same as the incompat e5ca) for the vanilla biome BorealForest, called by the suite's own step, our postfix listed but not the thrower. The same set logs `Exception in ConfigErrors() of LotRE_Elf*` (48 pawn kinds, `PawnKindDef.ConfigErrors` NRE) and `RaceProperties.get_AnyPawnKind`: the Elves pawn kinds are broken on this game build, which breaks the game's own wild animal table with that set, mod or no mod. Not a defect of this port; no step fix, no PiT request. The five settings scenarios belong to the base set (green on `sans-facultatifs`, `settings-en3` and `settings-fr3` 8 of 8); the facultatifs pass proves only its `@requires` scenarios (green in opt2-facultatifs: 33 passed, the 5 reds are the out-of-scope settings scenarios plus the unpaired restart). Do not refile. Tests/Pickle/Source change kept (diagnostic log in Commonalities).

- 2026-11-13 names: Virginie chose the fr.wikipedia forms (ahuitzotl, xièzhì, idittu, wyverne, oiseau du lac Stymphale) and "normalise" for English creature casing; applied in Mod/ French and English, PR #6 branch 6b92727; Docs/review-names.md. Redo the French 8.c replays on this text.

- 2026-11-13 names, correction: Virginie ruled "if two forms are equivalent, keep the one from other languages": ahuizotl, xiezhi, ieltxu kept in French; only petite wyverne and oiseau du lac Stymphale changed (Docs/review-names.md).

- 2026-11-13 Virginie validated the review ("je valide la review") at e4f7651 (names and casing decided, see Docs/review-names.md). Ecosystem: ECOSYSTEM? sent to PiI (new procedure, AUDIT 1.a and 8.0); copy its one-line summary into the Ecosystem section when it answers. No Steam search or scan from this session.

- 2026-11-13 CE issue 4839 answered by N7Huntsman (maintainer): a PR adding our id is welcome, but it cannot be merged until our mod is available to test (our Workshop item 3811323347 is private). No PR opened (outward, needs Virginie go). Alpha Bees 16 still unanswered.

- 2026-11-13 Virginie: the Combat Extended PR (add nelim.alphamythology next to sarg.magicalmenagerie in LoadFolders, CE issue 4839) is opened AFTER the Workshop release, not before.
- 2026-11-13 playTests journal (tickets 475d 3d74 89c5 20df 61ad, 8.c to 8.m) folded into Docs/runs/2026-11-status-fold-4.md. All green at b475d59 and 2a3a8e9; code_review_sha d1abd41; 8.i Player.log clean (61ad); 8.g and 8.j closed on existing evidence (owner accepted in chat).
- 2026-11-13 8.g and 8.j: Virginie accepts the existing evidence (chat, "Accept evidence"); no full pass refiled. Basis: F01 to F14 mapped (Tests/FUNCTIONAL.md), Source and Mod/Assemblies unchanged since ea53d3c, Mod/ texts only since, 7ea2822 covered by settings-en4 and log-en5 green. Playtest sub-steps 8.c to 8.m all closed; next: playTests exit check (Check-Status, tested_on, workflow_stage move).

## NSB (sync 2026-11-14, /sync-nsb-npt)

Places read: not re-read (2026-11-14: NSB content unchanged since 2026-11-06; only commit 18abf53 renamed `docs/` to `Docs/`, 0 lines changed). Tribe read: 2026-11-14 (CATALOGUE-ANIMAUX only; profiles last read 2026-10-23). Steps read: 2026-11-16 (git log and diff of NPT `Docs/steps.md` since 2026-11-14: six steps added, none renamed or removed).

NSB since last sync: nothing that touches a place, colonist or animal (Check-Status raises no nsb-sync warn at 2026-11-16). NPT 2026-11-14 to 2026-11-16: added `aims at the cell`, `builds the blueprint`, `filth is spread`, `vehicle is spawned`, `hover over the gizmo`, Beauty2 mouth offset `DY`; render-node hide now uses the debugEnabled flag; no step of `09-publication-shots` touched; nothing used. NPT 2026-11-06 to 2026-11-14: ScreenshotStudio step hiding the main tab bar, speed controls and mouse-over readout (65f21b3, usable for any shot that shows the map), StageDecor pot with a grown plant, decor burns, floors; ColonistRace filth removal (radius or map), game-condition step, animal hediff and surgery steps. No step used by `09-publication-shots` renamed or removed in the log titles; to confirm by reading `steps.md` at write-shotlist. Left alone: the eight accepted pictures; no scenario touched.

Places (accepted gallery, plan in Docs/runs/2026-11-status-fold-2.md): statue-garden (1 griffin) | water-garden bank (5 pegasus) | tea-room hut (3 kitsune) | fire-pit (2 phoenix) | other places of 4, 6, 7 per the feature header | decor placed and removed per scene, noon 4 Sept 5500 | last read 2026-10-23.

Colonists: Nelim | shots 1 to 7 | one outfit all day, deep blue top (36, 72, 140) | profile last read 2026-10-23 | exception: hair `Roo_HD_Hair_Highpony` (owner chat 2026-10-23), mouth overridden when the scenario justifies it (owner chat 2026-10-25).

Animals: save pets Shogun, Yuki, Atticus (fixture pets, stand-at) | cat spawned for Tama and Kuru (not in the save) | outfit: animals may be dressed when the scenario justifies it (owner chat 2026-10-25, wardrobe not validated) | sheets last read 2026-10-23 | exceptions: none.

Included animals (rule 5), 25 PawnKindDefs of the mod: shown by an accepted shot: Kitsune, Phoenix, Manticore, Kappa, Pegasus, Unicorn, Griffin (7). MISSING (no shot): Ahuizotl, Basilisk, Catoblepas, Cerberus, CeryneianHind, Chimera, ErymanthianBoar, Fenghuang, Ieltxu, LernaeanHydra, LesserWyvern, Qilin, Salamander, StymphalianBird, Tlilcoatl, WildMinotaur, WillOWisp, Xiezhi (18). Gap to fix in the shotlist (write-shotlist): group shots or new shots, then play them; rule 5 is not met by the current gallery.

## Shotlist (write-shotlist 2026-11-14, extension for rule 5; full lines in the header of `09-publication-shots.feature`, blocks "SHOTLIST EXTENSION 2026-11-14" and "SCORE-GALLERY ROUND 1")

No capture of the new shots yet: rating the plan. Round 1: 9 = 4.0, 10 = 3.5, 11 = 3.5, 12 = 3.5, 13 = 3.0, 14 = 3.5 (weak: b on 10 and 13, e on 11 to 14, f on all, g on 13, k on the series header). Round 2 after the written fixes: every new scene at 5.0 on paper (no step proven absent; Ingest, DoBill, Refuel on a TorchLamp, three-creature placement not checked against the NPT catalogue). Gate 2 done 2026-11-14: scenarios of 9 to 14 written in `09-publication-shots.feature` (after the manticore, before the settings window), NOT played. Gate 3 done: `Check-ShotlistVsScenario.ps1 -Feature 09-publication-shots.feature` exit 0 (header shot lines 1 to 14 now carry the dot form `#  N.` so the script matches them; without `-Feature` it still prints "no gallery feature" because it reads only the first 40 lines; WARN 14 shots vs 15 scenarios = the probe scenario, harmless). Fixed on the way: shot 12 brazier is a plain `Brazier` placed at (204, 118); the hall's own one is a DarklightBrazier (205, 117) and the survey has no censer. The 8 accepted shots (1 to 8) are unchanged. Ticket not yet filed. Unproven before play: bench `FueledSmithy` (223, 233) with bill `Make_Mace` and 100 `Steel` (13), Refuel on `TorchLamp` and `Brazier`, Ingest of `RawBerries` and `Hay` by an animal, spawns on cells with no list (flower-garden, river-bridge, statue-garden east, barn, workshop) moved by `nearest free cell`, Hydra in the river, Basilisk ring (11), `StymphalianBird` flying low (9, no step: it stands), raven and moths dropped, sparrows spawned in 9.

| Shot | Place, hour | Lead and group | Nelim's gesture | Zoom |
|---|---|---|---|---|
| 9 hunt-trio | flower-garden, 18:30 | CeryneianHind, ErymanthianBoar, StymphalianBird | carries RawBerries | 3.5 |
| 10 river-serpents | river-bridge, 19:15 | LernaeanHydra, Ahuizotl, Tlilcoatl | carries meat on the bridge | 4.5 |
| 11 gaze-group | statue-garden, 20:00 | Basilisk (on its burned ring), Catoblepas, Cerberus | refuels a TorchLamp | 4.5 |
| 12 east | ritual-hall, 20:45 | Qilin, Fenghuang, Xiezhi | refuels a Brazier placed at (204, 118) | 4.5 |
| 13 small-ones | preindustrial-workshop, 21:30 | Salamander, Ieltxu, WillOWisp | crafts at the bench | 3 |
| 14 barn-night | barn, 22:30 | WildMinotaur, Chimera, LesserWyvern | sets down a hay bale | 5.5 |

Director's pass (Opus sub-agent, 2026-11-14): all remarks kept (apples and trampled flowers out, Basilisk lead on its ring, gaze group to statue-garden, water group to river-bridge at dusk, Ieltxu and LesserWyvern swapped, creatures give no light of their own so the light is the place's, clock order, barn closes the day). Rule 5 after this list: all 25 creatures have a shot on paper. Open: owner arbitrations none; accepted shots 5 and 7 stand on places marked "a embellir" (told, out of scope); gallery order by clock (criterion k) conflicts with the strength order used for the accepted 1 to 8: decide at the final reindex.
- 2026-11-15 gallery 9 to 14 filed at f8ebb39 (`-DepMap wsl-deps.sanctuary.map`, 09-publication-shots): ticket fed3 (9 hunt trio, 10 river serpents, 11 gaze group, evidence Inbox/gallery-evening-a) and ticket e3b2 (12 beasts of the east, 13 small ones, 14 big ones in the barn, evidence Inbox/gallery-evening-b). Both WAITING (6/8 and 7/8). Do not refile; do not touch Mod/ or the feature until RUN_DONE. First play of 9 to 14: failures name the step (bench FueledSmithy and bill Make_Mace, Refuel, Ingest, Hydra in the river, Basilisk ring). Then read each capture, score-gallery, REDO or candidate.
- 2026-11-15 gallery run 1 read: fed3 (9 fail: decor cell (151, 113) holds a Brazier; 10 played, REDO: Hydra on the bridge edge not in the water, Ahuizotl and Tlilcoatl cut at the top, Nelim small; 11 fail: (155, 99) holds SculptureLarge) and e3b2 (12 played, REDO: Nelim cut at the bottom edge; 14 played, REDO: Chimera hidden behind the barn's dining table; 13 fail: (220, 235) holds VanometricPowerCell). Fixes at a9e7223: nearest-free-cell for bonsai and stools, lamp 11 moved to (156, 99), brazier to (157, 98), TorchLamp of 13 dropped (brazier is the light), Hydra to (133, 120), banks (129, 123) and (141, 123), frame 10 one cell north, frame 12 one cell south, barn group moved west of the table (192, 238), (192, 235), hay (193, 239). Refiled: c754 (9 to 11, Inbox/gallery-evening-a2) and 330a (12 to 14, Inbox/gallery-evening-b2). Run-1 images stay in Inbox as evidence until the redo is read; no candidate yet.
- 2026-11-15 run c754 (9, 10, 11 all green, read): all three REDO on framing only: 9 Nelim cut at the right edge; 10 Tlilcoatl absent from frame and Nelim cut at the top (Hydra now in the water, good); 11 Nelim cut at the top, no visible burned ring (risk kept). Frames moved at 531e932 (9: Cyra shown 1 left; 10: Tlilcoatl (138, 121), frame -2 up; 11: frame -2 up). Refiled b8a6 (9 to 11, Inbox/gallery-evening-a3). 330a (12 to 14) still waiting. Nothing candidate yet.
- 2026-11-15 run 330a read: 12 (beasts of the east) PLAYED, looks candidate (three beasts readable, Nelim whole with logs beside the lit Brazier; capture in Inbox/gallery-evening-b2, keep it, formal score-gallery at the end); 14 REDO (Nelim stands on the pool table, five cells from the minotaur); 13 fail again: (219, 240) holds a VanometricPowerCell (power cells along x 219 to 220, z 235 to 240). Fixes at the next commit: bonsai and stool of 13 by nearest free cell; Nelim of 14 at (194, 237) hauling to (193, 238). Filed d448 (13 and 14, Inbox/gallery-evening-c). b8a6 (9 to 11) still waiting.
- 2026-11-15 inbox triage: deleted read and superseded gallery runs (a, a-1, a2, b) and the 8 RELAY notes of 2026-11-12 (opt2 series, already parked in Parked/opt2-*). Kept: gallery-evening-a2-1 (9 to 11 run 2, comparison until b8a6 is read) and gallery-evening-b2 (capture of 12, candidate). Retexture question (owner): this mod ships no retexture and PiI lists none for it; docs/GALLERY.md has no retexture rule, so none applies here.
- 2026-11-16 ticket d448 read (13 and 14): exit 1, 0 of 2. 13: no RecipeDef named 'Make_Mace' (implied recipe is Make_MeleeWeapon_Mace, thing MeleeWeapon_Mace). 14: cell (193, 238) outside the map or not standable (haul destination). Fixes at the commit after fe6eacb: bill Make_MeleeWeapon_Mace; scene 14 now carries Hay then puts it down at (193, 238) (nearest free cell if blocked). Report deleted. Refiled 7177 (13 and 14, Inbox/gallery-evening-d). b8a6 (9 to 11) still running at that time. Do not refile.
- 2026-11-16 run b8a6 read (9, 10, 11 all passed, summary total 3, exitReason passed; captures read). 9 hunt trio: three beasts readable (Ceryneian Hind front, Boar, Stymphalian bird), Nelim whole with berries: candidate. 10 river serpents: Ahuizotl on the bridge, Hydra in the water, Tlilcoatl small grey coil right, Nelim whole but small: candidate, weak on the Tlilcoatl size. 11 gaze group: REDO, Basilisk small and not the lead, a green building frame fills the upper left and a masked figure overlaps the Cerberus, no burned ring visible. Captures parked in Tests/Pickle/Parked/gallery-evening-a3-candidates-9-10 (9, 10, 11) and gallery-evening-b2-candidate-12 (12); formal score-gallery and the move to Art/Gallery-clean under final names at the end, one review. Inbox emptied (superseded gallery-evening-a3 deleted). Waits: 7177 (13 and 14). Next: rework 11.
- 2026-11-16 scene 11 reworked (zoom 4.5, Cerberus at (150, 98), frame -1 up, to leave the green frame and the masked figure out and enlarge the Basilisk). Filed 8316 (11, Inbox/gallery-evening-e) beside 7177 (13 and 14, Inbox/gallery-evening-d). Both WAITING; do not refile, do not touch Mod/ or the feature until RUN_DONE.
