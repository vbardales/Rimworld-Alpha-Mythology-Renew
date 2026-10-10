# Publication - Alpha Mythology Renew (unofficial)

What the Workshop page asks for and the repository holds nowhere else. Draft of 2026-09-26, checked against the monorepo's `PUBLISHING.md` on 2026-10-07. Only the private 0.1.0 pre-publication has been sent; the mod is at `localize[1.0.0]` (see `STATUS.md`: two French lines await Virginie's reading, then the in-game tests, the sanctuary gallery and a public Workshop page for Resolve This Instead are still to come before the 1.0.0), so this file is prepared, not final and stays in the conditional.

**Publication mode: CI** (a public port; `PUBLISHING.md`, "Publier par la CI"): green dry-run of the exact commit, `publish` with the full 40-character SHA, `steam-production` approved by Virginie alone, tag and release created by the CI. The gallery goes by hand. The publish workflow is generated (2026-10-07: `.github/workflows/publish-tag.yml`, `.github/publish.config.json`, scripts and their 72 tests; `generate-publish-workflow.sh --check` says whether it is behind), with `--description-markdown PUBLICATION.md` and `--about-from-description`: the description is the Markdown block under `## Steam description` below, `Mod/About/About.xml` carries its plain-text rendering (never edited by hand, `node .github/scripts/sync-about-description.mjs --write`), and `Tests/Check-Mod.ps1` checks that About.xml ends with the source link and that the block does. The 1.0.0 sends the description (`update_description`: the 0.1.0 text is the old hand-written About.xml of 2026-10-01). The repository is public, so `steam-production` can have its required reviewer. Still to write before the 1.0.0: the `## [1.0.0]` section of `CHANGELOG.md`. Order, from the CI/CD session: Markdown block, sync `--write`, `Check-Mod.ps1`, commit, push, dry-run of that exact SHA with `update_description`, then `publish` with the full 40-character SHA through `dispatch-publish.sh` (Virginie approves `steam-production`); no commit after the dry-run.

Rights position, to keep in front of every choice below: **`silent`** (no licence, no permission, no refusal
found), published as an unofficial port with a removal promise. The original author is Sarg Bjornson, who
announced a future remake and removes comments asking for 1.6 updates.

## Workshop item

- Title: `Alpha Mythology Renew (unofficial)` (from `Mod/About/About.xml`).
- Pre-publication `0.1.0` was a first send whose only purpose was to create the private item and obtain
  `About/PublishedFileId.txt`: done 2026-10-01 (item `3811323347`, committed at once as `Add published Workshop file ID for 0.1.0`, c2f8199). The item is private; the description it was created with is the one `About.xml` held that day, and any later correction goes through the CI (`update_description`) or by hand.
- Version `1.0.0` arrives only with `published`. Steam creates every item private; Virginie switches it to public.
- Tags to set by hand on the page: Animal, Race, Fantasy (to confirm on the form).

## Dependencies and DLC

Checked in the sources, not from intent.

| Item | Decision | Evidence |
|---|---|---|
| Harmony (`brrainz.harmony`, 2009463077) | hard dependency | patches in `Source/TranslationPatches.cs` and `Source/Settings.cs` |
| Vanilla Expanded Framework (`OskarPotocki.VanillaFactionsExpanded.Core`, 2023507013) | hard dependency | 25 `VEF.AnimalBehaviours.AnimalStatExtension` and several `VEF.*` comps in the Defs; MVCF arrives through VEF |
| Resolve This Instead (`nelim.resolvethisinstead`, no Workshop id yet) | hard dependency, decided by Virginie 2026-09-26 | `About.xml` modDependencies; `Mod/About/ResolveThisInstead.xml` vouches for Nature's Pretty Sweet; unpublished, staged by `path:`; **it needs a public Workshop page before this mod's 1.0.0** (its own README, BACKLOG.md). Its own dependency, Use This Instead (3396308787, Mlie, MIT), is loaded through it and credited in THANKS |
| Vanilla Achievements Expanded | optional | `Mod/LoadFolders.xml` branch `IfModActive="vanillaexpanded.achievements"` |
| Eight other providers (Advanced Biomes, Genetics, GiddyUp, Elves, Nature's Pretty Sweet, Nocturnal Animals, RimWorld of Magic, Vanilla Cooking Expanded) | optional, never a dependency | `Mod/Patches/AlphaMythology/*Patch.xml`, all `PatchOperationFindMod` |
| A Dog Said... Animal Prosthetics 2 (`SamBucher.ADogSaidAnimalProsthetics2`, 3238353862) | optional, never a dependency; `loadBefore` | `AnimalProsthetics2Patch.xml` (guard on `ADS_Cat1`), 22 animals in the three categories by vanilla analogue, 3 left out with the reason in the file header (2026-10-01) |
| Dogs mate (Continued) (`Mlie.DogsMate`, 2441132298) | optional, never a dependency | `DogsMatePatch.xml`: only the Erymanthian boar joins the Pig group; Dogs mate's own `sarg.magicalmenagerie.xml` already groups Cerberus, the hind, Pegasus, the Unicorn, the Kitsune and the Catoblepas under our defNames (found by pass 95c8, 2026-10-01) |
| Better Crossbreeding (`DizzyEevee.BetterCrossbreeding`, 3520675842) | optional, never a dependency | `BetterCrossbreedingPatch.xml`: the same four pairs, both directions, calf Random (2026-10-01) |
| RIMMSQOL | not a dependency; reveals the hidden settings shortcut | dev-only pass `wsl-deps.avec-rimmsqol.map` |
| DLC | none required | one `MayRequire="Ludeon.RimWorld.Biotech"` in the Defs; `supportedVersions` 1.6 only, no DLC branch in `LoadFolders.xml` |
| Incompatible | `sarg.magicalmenagerie` (the original) | `About.xml` `incompatibleWith`; pass run 2026-09-27 (778c): real symptom found and confirmed: both mods declare `PawnKindDef`s under the same defNames, and `NullReferenceException` in `BiomeDef.CommonalityOfAnimal` follows the first time the wild-animal spawner ticks. `STATUS.md` has the detail. |

## Adult content boxes

Opened on 2026-09-26, as contact sheets: `Preview.png`, `ModIcon.png` source, and all 210 PNG textures of `Mod/Textures`
(creatures in three views, dessicated skeletons, eggs, information cards, achievement icons, projectiles, saddles).
Contact sheets are 150 px thumbnails: text on the cards was not read.

- Nudity or sexual content: **no**. Nothing suggestive in any image.
- Strong language: **no**. A word-boundary search on 2026-09-26 of `Mod/Languages`, `Mod/Defs`, `Mod/Patches`,
  `Mod/Integrations`, `Mod/About`, `README.md` and `ATTRIBUTION.md` for common English and French profanity and slurs
  (about 45 words, e.g. the usual four-letter words, "damn", "crap", "merde", "putain", "connard", "salope", "con") found
  nothing. It is a word list, not a reading: a euphemism or a mod-specific term would pass, and the texts were not
  read line by line.
- Violence or gore: cartoon-style only. One achievement icon (`MM_AchievementFountainOfBlood`) shows a figure with
  red splashes, the creatures include fire and poison breath, and dessicated corpses are drawn as clean skeletons.
  The mod adds a bleeding wound. This is RimWorld's own register and nothing is graphic or frequent, so **"no"
  looks right**, but it is Virginie's answer to give.
- Found while looking, not changed (`Mod/` is frozen): textures for a `MM_Mechataur` (4 files) that is not one of the
  25 creatures (the odd-named `MM_FenghuangEgg_a copy.png` is used: its egg graphic loads the whole folder).

## Screenshots and gallery

Steam shows the first image large. `Art/Gallery/` (git tracks it with a capital G) is the folder uploaded as it stands: only images, numbered `0-`, `1-`, `2-`… in upload order, nothing else. Rules of `PUBLISHING.md` (2026-10-06): as many images as wanted, **total under 8 MB and each under 2 MB**; `0-preview.png` is a byte-for-byte copy of `Mod/About/Preview.png` (regenerated with it by `Render-Preview.cjs`, so they never diverge); the gallery is one staged story told by a photographer, not a series of captures (see below).

**Candidates (owner, 2026-10-08).** A picture waiting for her verdict goes into `Art/Gallery/` at once, under its final index (which may duplicate one already there when it is meant to take that place) and the word `candidate` in its name: `1-candidate-griffin.png`. Each image under 2 MB, the folder under 8 MB (a game capture is 3 MB or more as PNG: palette-reduce it, or re-encode it, and read the result before it goes in). An accepted picture loses the word `candidate`; a refused one is deleted. Nothing in the folder today is a candidate: `1-griffin.jpg` … `7-settings.png` are the old studio8 pictures, to be replaced by the sanctuary series, whose pictures arrive as `N-candidate-<name>`.

**State, 2026-10-07.** `0-preview.png` is current (regenerated 2026-10-05 from the new `ModIcon-source.png`). `1-griffin.jpg` … `6-pegasus.jpg` and `7-settings.png` are the **old** pictures of the studio pass `studio8` (2026-10-01; the six creature shots re-encoded as JPEG quality 92, 0.45 MB each, because as PNG they weighed 3.3 MB), 3.7 MB in all. They are placeholders: Pickle Tools moved every mod's gallery to one shared scene, Nelim's sanctuary (`Nelims-tribe`), which has had its own repository since 2026-10-08 (Nelim's Sanctuary Backlot, `nelim.sanctuarybacklot`: the save, the named places and the `Nelim's Sanctuary:` steps; the generic tools stay Pickle Tools'), and `09-publication-shots.feature` is rewritten for it (2026-10-05) but **not filed** until Pickle Tools announces the final fixture. Virginie uploaded picture 0 to the Steam gallery on 2026-10-02; the others are not up.

**The shot plan and the story** are in the header of `09-publication-shots.feature` (2026-10-07, after the rules of `PUBLISHING.md`): "A noon in the sanctuary", eight creatures in eight corners of the sanctuary (griffin among the statues, kappa by the pond, pegasus at the water garden, kitsune at the tea room, phoenix in the hearth hall, hound at the courtyard, unicorn in the plant garden, manticore by the paddies), then the settings window as a plain screen capture. One `Scenario:` is one picture; time goes by through the series (noon, then +5 game minutes per picture, 208 ticks, the creature posed after the wait); each picture is named by its place in the story (`workshop-1-the-griffin-among-the-statues` …). Written from the place list without seeing the maps: the first run will show which coordinates are not standable and which framings fail. After each run every image is opened and read against the plan; an anomaly that comes from the scene or the shared tool is described to Pickle Tools with the capture, never worked around in the mod. Not filed before the final fixture is announced. The pictures come out as PNG (3 MB or more each): the published ones are re-encoded (JPEG quality 92 about 0.45 MB) to stay under 2 MB, and the folder under 8 MB.

## Steam description

The single source of the Workshop description (`PUBLISHING.md`, "Source unique de la description", 2026-09-25). The CI converts the Markdown block below to Steam BBCode when `update_description` is on, and generates the plain-text `<description>` of `Mod/About/About.xml` from it (`node .github/scripts/sync-about-description.mjs --write`); every dry-run stops when the two differ. One bold span per paragraph (the Steam converter leaves two on a line unconverted), no code fence inside the block, and it ends with the source link after the credits.

```markdown
UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

No licence granting republication of Alpha Mythology was found. This continuation is distributed without an explicit licence or agreement from the original author; this notice is not a claim of permission.

25 mythological creatures from Sarg Bjornson's Alpha Mythology, ported to RimWorld 1.6 and extracted from the private Animal Ark pack. Includes their eggs, products, abilities and optional integration patches. A settings window (Mod options) sets how often the creatures appear in the wild and lets you exclude any of them. Creature definitions retain their original names.

The port updates obsolete XML fields and VEF type names and rebuilds the phoenix death effect and the bleeding wound in an isolated assembly.

Original: [Alpha Mythology](https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793)

Original source: https://github.com/juanosarg/AlphaMythology

Requires Resolve This Instead, a small library that lets this mod's optional patches keep working when a mod they support is renamed or replaced by a continuation. It reads Use This Instead's data, so that mod is loaded too.

Do not load alongside the original Alpha Mythology or an older Animal Ark build still containing it. Do not remove this content from an ongoing save. Moving an existing save from Animal Ark is untested, especially saved custom hediff classes whose namespace changed.

**IF I GO QUIET**

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

**AI-GENERATED**

The port was made with AI assistance: Codex (OpenAI) for the 1.6 extraction, the isolated assembly and the French translations; Claude Code (Anthropic) for the settings, the test suites and the documentation; OpenAI image generation for the preview illustration. The creatures, their code and their artwork are Sarg Bjornson's. Port and extraction by Nelim.

**THANKS**

[Use This Instead](https://steamcommunity.com/sharedfiles/filedetails/?id=3396308787) by Mlie (MIT), whose open replacement data Resolve This Instead reads. [Alpha Mythology](https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793) by Sarg Bjornson, which this continues; its original preview is by Oskar Potocki. [Vanilla Expanded Framework](https://steamcommunity.com/sharedfiles/filedetails/?id=2023507013) and [Harmony](https://steamcommunity.com/sharedfiles/filedetails/?id=2009463077), which the mod stands on. Optional integrations, never required: [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862), [Better Crossbreeding](https://steamcommunity.com/sharedfiles/filedetails/?id=3520675842), [Dogs mate (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2441132298) by Mlie after Revolus, [A RimWorld of Magic](https://steamcommunity.com/sharedfiles/filedetails/?id=1201382956), [Vanilla Genetics Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2801160906), [Vanilla Cooking Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2134308519), [Vanilla Achievements Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2288125657), [[XND] Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409), [Advanced Biomes (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3541022508), [Nature's Pretty Sweet (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3542949511), [Lord of the Rims - Elves (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3548255064), [Giddy-Up 2 - Continued](https://steamcommunity.com/sharedfiles/filedetails/?id=3674332861) and [Tree Chopping Speed Stat](https://steamcommunity.com/sharedfiles/filedetails/?id=2566231583) by velcroboy333. For testing only, never dependencies of the mod: [Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678), [RimLogging](https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696), [RIMMSQOL](https://steamcommunity.com/sharedfiles/filedetails/?id=1084452457) and [PickleTools](https://steamcommunity.com/sharedfiles/filedetails/?id=3806142401).

See the included ATTRIBUTION.md, and the README.md and TESTING.md documents in the GitHub repository, for provenance, third-party sound credits and validation. No upstream ownership or endorsement is claimed.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew)
```

To settle before the first send: Nature's Pretty Sweet, GiddyUp, Genetics and the other optional providers are
named by patches; per PUBLISHING.md, those a pass really exercises need a THANKS line and a register entry.
Their Workshop ids are not resolved yet.

## Steam change notes

The note starts with the version alone on the first line (the CI refuses otherwise).

### 0.1.0

```
[b]0.1.0[/b]
First upload: creates the private item. Not tested in game.
```

### 1.0.0

```
[b]1.0.0[/b]
25 mythological creatures for RimWorld 1.6, ported from Alpha Mythology (unofficial). New: a settings window (Mod options) with a wild spawn frequency multiplier and one switch per creature; an optional hidden MainButtons shortcut for RIMMSQOL. English and French.
```

## Thank-you comments (drafts, none posted)

Method and register: `../WORKSHOP_COMMENTS.md`. A recipient already `posted` there gets this project added to its
`Covers` and **no new comment**; the register is edited at posting time, not now.

| Recipient | Workshop id | Register today | Action |
|---|---|---|---|
| Harmony | 2009463077 | posted | `Covers` updated 2026-10-10 (protocols 3a01556), no comment |
| Vanilla Expanded Framework | 2023507013 | posted | same |
| Pickle, RimLogging, RIMMSQOL | 3791648678, 3733484696, 1084452457 | posted | same (the suite has been played) |
| PickleTools | 3806142401 (private page) | not applicable | the owner's own project and a private page with no outside recipient: no comment to oneself (`PUBLISHING.md`). Named in THANKS without a link in `About.xml`: `PUBLISHING.md` asks to link it when cited |
| Vanilla Cooking Expanded | 2134308519 | posted | same (its pass is written and played) |
| Alpha Mythology (the original) | 1821617793 | absent | **decision needed, see below** |
| A RimWorld of Magic | 1201382956 | absent | ids resolved 2026-09-26; register row and draft to write. Its own pass hung the shared machine twice (2026-09-27, d62d and 342d) on a `TypeLoadException` inside its own assemblies, unrelated to this mod; isolated in `wsl-deps.avec-rwom.map`, not resubmitted without asking. Credit the API regardless: the hang is this machine's cache, not the mod. |
| [XND] Nocturnal Animals (Continued) | 2269731409 | posted | same: `Covers` updated, no second comment |
| Vanilla Genetics Expanded | 2801160906 | drafted (no text) | **do not draft or post without Virginie**, see below |
| Vanilla Achievements Expanded | 2288125657 | absent | same (not installed here) |
| Advanced Biomes (Continued) | 3541022508 | absent | same |
| Nature's Pretty Sweet (Continued) | 3542949511 | absent | same, after settling the name guard (see STATUS.md) |
| Lord of the Rims - Elves (Continued) | 3548255064 | absent | same; a "(Continued)" page: credit both the original author and the maintainer (zal): read the page to name them |
| Giddy-Up 2 - Continued | 3674332861 | absent | same; the patch comment names Roolo, Owlchemist and dav9670 before MemeGoddess: read the page before crediting |
| A Dog Said... Animal Prosthetics 2 (Sam Bucher) | 3238353862 | posted | `Covers` updated, no second comment (the beetle comment was posted from A Certain Series) |
| Better Crossbreeding (DizzyEevee) | 3520675842 | drafted | `Covers` updated; the one comment is drafted for the first mod to post (Funny Creatures Renew); a short text for this port is below in case it posts first |
| Dogs mate (Continued) (Mlie, after Revolus) | 2441132298 | drafted | `Covers` updated; credit Mlie and Revolus in one message on the Continued page; draft below |
| Tree Chopping Speed Stat | 2566231583 | absent | not a patch guard, a known-issue check (F12, feature 17); its scenario played green (8421): the kappa's `VBY_TreeChopWorkSpeed` NullReferenceException the original's page describes did not reproduce here. Register row added 2026-10-10 (`drafted`), draft below, credit velcroboy333. |

**The original's page: do not draft yet.** A comment there announces a port published without the author's
consent, on a page where he removes comments about 1.6 updates and answered VEF's page on 2026-09-22. Whether
to comment at all, and in what words, is Virginie's call. If she wants one, it is a personal comment in her own
voice, under 1000 characters, with one hidden link `[url=...]Alpha Mythology Renew[/url]`, posted only after the
item is public, and it must not claim permission.

## Upstream: a pull request is systematic

The original has a Git repository (`juanosarg/AlphaMythology`, linked here as the fetch-only remote `upstream`). Rule from Virginie, 2026-09-28, now also in the monorepo's `PUBLISHING.md`: when an upstream exists, a pull request to it is made, whatever else is published. Here: not made yet (no fork, her go needed for anything public); it is in `BACKLOG.md` as required, and it does not block the `0.1.0` private send. The Workshop page and the pull request are independent: publishing the port unofficially does not replace proposing it to its author.

## After the send

Commit `Mod/About/PublishedFileId.txt` immediately (lost, the next send creates a second item); record the
Workshop id in `STATUS.md`; update the register; post comments only once the item is visible to recipients.

## Thank-you comment drafts for the optional providers (2026-09-26, none posted)

Read first, per `WORKSHOP_COMMENTS.md`: each page's description and latest comments through the browser. Status of every
row is `drafted`; nothing is posted before the item is public. Rules followed: 150 to 350 characters, one hidden link to
this mod, nothing claimed about compatibility (the patches have not run in game), a concrete true detail per page, a
different opening each. `M` below is `[url=https://steamcommunity.com/sharedfiles/filedetails/?id=<ID>]Alpha Mythology Renew (unofficial)[/url]`
with the item's id, known only after the first send.

Credits verified on the pages (never inferred from names): Advanced Biomes (Continued) is Mlie's update of Hey my team
rules!'s mod (1338280929); Nature's Pretty Sweet (Continued) is by Mlie and Halicade, an update of tkkntkkn's mod
(1211694919); Lord of the Rims - Elves (Continued) is Zaljerem's, after Sans's continuation (3383096916) of Jecrell's
original (1400234784), and it bundles JecsTools assemblies; Giddy-Up 2 - Continued is Meme Goddess's, picked up from
Giddy-Up 2 Forked when its author stopped, after Roolo's original; **Vanilla Genetics Expanded is by Sarg Bjornson and
Reann Shepard, an update of Sarg's own Genetic Rim.**

### A RimWorld of Magic, 1201382956 (Torann)
```
Still updating RimWorld of Magic for 1.6 after all these years, respect. I wrote a small patch for my Alpha Mythology port (magicyte in the creatures' butcher products), so thanks for defs that were easy to read :) [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Advanced Biomes (Continued), 3541022508 (Mlie; original by Hey my team rules!)
```
Thanks Mlie for bringing Advanced Biomes to 1.6, and Hey my team rules! for the original. Biomes are what decide where a griffin turns up in my port, so yours matter more than you'd think. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Nature's Pretty Sweet (Continued), 3542949511 (Mlie and Halicade; original by tkkntkkn)
```
Mlie, Halicade: thanks for keeping Nature's Pretty Sweet going, and tkkntkkn for the original. It also taught me how fast a mod's name changes between versions, which my patch found out the hard way xD [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Lord of the Rims - Elves (Continued), 3548255064 (Zaljerem; Sans; original by Jecrell)
```
Thanks Zaljerem for carrying the elves on to 1.6, after Sans and Jecrell. Reading how your page lists who did what made me copy the habit for my own credits :) [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Giddy-Up 2 - Continued, 3674332861 (Meme Goddess; original by Roolo)
```
Thank you for picking Giddy-Up 2 up when the fork was dropped, Meme Goddess, and Roolo for the original. My griffin has a saddle sprite waiting to be tried with it, no promises yet lol [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Dogs mate (Continued), 2441132298 (Mlie; original by Revolus)
```
Mlie, thanks for keeping Dogs mate going, and Revolus for the original. Funny thing: your own file for Sarg's Magical Menagerie already knew my three-headed dog and my deer, so all I had to add was one boar :) [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Better Crossbreeding, 3520675842 (DizzyEevee)
```
DizzyEevee, thanks for Better Crossbreeding: I used it so my Cerberus, boar, hind and Pegasus can cross with their vanilla kin, both ways round. Small heads-up, the Example patch spells the class with a lower-case b and the assembly with a capital one xD [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Tree Chopping Speed Stat, 2566231583 (velcroboy333)
```
velcroboy333, thanks for Tree Chopping Speed Stat. The original Alpha Mythology page had a report of a kappa crashing with it loaded, so I sent my kappa to harvest a crop with your mod on. It came out clean :) [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```

### Vanilla Genetics Expanded, 2801160906 (Sarg Bjornson and Reann Shepard) - **do not post without Virginie**
The author of the original Alpha Mythology co-wrote this mod and answers on this page. A comment here announces an
unofficial port of his other mod to him, in a public thread. Same reason as the original's page: her decision, and
possibly none. No draft written on purpose.

### Use This Instead, 3396308787 (Mlie)
```
Mlie, thanks for Use This Instead and for keeping its replacement data open: a small library of mine, Resolve This Instead, reads it so my optional patches keep working when a mod gets renamed or replaced by a continuation. Already doing its job on Nature's Pretty Sweet :) [url=https://steamcommunity.com/sharedfiles/filedetails/?id=ITEM_ID]Alpha Mythology Renew (unofficial)[/url]
```
Handed to Virginie as a step at `followUp` (post after the item is public, a link to a private item opens for nobody): comment on https://steamcommunity.com/sharedfiles/filedetails/?id=3396308787 . Relay of the audit workflow, 2026-10-10: this comment closes the Use This Instead point.

### Not drafted yet
- **Vanilla Achievements Expanded**, 2288125657: page read 2026-09-26 (after a first refusal by Steam). Authors listed: Sarg Bjornson, Oskar Potocki and Smash Phil (Vanilla Expanded team). **Sarg Bjornson is again a co-author and answers there**: same decision as Vanilla Genetics Expanded, hers, so no draft. The port ships this integration (achievement icons and patch), so its thanks stay in the description.

- **Nocturnal Animals (Continued)**, 2269731409 and **Vanilla Cooking Expanded**, 2134308519: register rows `posted`, `Covers` updated 2026-10-10, no second comment.
