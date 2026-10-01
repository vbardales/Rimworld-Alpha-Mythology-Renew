# Publication - Alpha Mythology Renew (unofficial)

What the Workshop page asks for and the repository holds nowhere else. Draft of 2026-09-26; nothing here has
been sent. The mod is not tested in game yet (see `STATUS.md`): this file is prepared, not final.

Rights position, to keep in front of every choice below: **`silent`** (no licence, no permission, no refusal
found), published as an unofficial port with a removal promise. The original author is Sarg Bjornson, who
announced a future remake and removes comments asking for 1.6 updates.

## Workshop item

- Title: `Alpha Mythology Renew (unofficial)` (from `Mod/About/About.xml`).
- Pre-publication `0.1.0` is a first send whose only purpose is to create the private item and obtain
  `About/PublishedFileId.txt`, committed at once as `Add published Workshop file ID for 0.1.0`. Not yet done.
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
| Incompatible | `sarg.magicalmenagerie` (the original) | `About.xml` `incompatibleWith`; pass run 2026-09-27 (778c): real symptom found and confirmed — both mods declare `PawnKindDef`s under the same defNames, and `NullReferenceException` in `BiomeDef.CommonalityOfAnimal` follows the first time the wild-animal spawner ticks. `STATUS.md` has the detail. |

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

## Screenshots (order to decide after the passes)

Steam shows the first image large: the most demonstrative one goes there, not the prettiest. The studio pass
(`09-publication-shots.feature`) is written and run: one picture per creature (griffin, hound, phoenix, unicorn,
manticore, pegasus) plus the settings window over the meadow — 7 pictures, framing tuned to zoom 2.5, creatures
facing south (front view, fixed 2026-09-28). Order still to decide once a confirmed set exists: the settings
window shows the interface, not a creature, so it is not a first-image candidate.

**Naming convention:** `Art/gallery/0-preview.png` is image 0, identical to the shipped `Mod/About/Preview.png`
(the "cover" Steam shows large — not necessarily first in the in-game gallery order, but slot 0 here; copied
2026-09-29). The 7 studio pictures are `Art/gallery/X-<name>.png` for X = 1 to 7 — a bare digit, **not**
zero-padded (`1-griffin.png`, not `01-griffin.png`). Together: `Art/gallery/0-preview.png` through
`Art/gallery/7-<name>.png`, 8 files, X from 0 to 7. Not all filled yet: only `0-preview.png` exists so far.

Candidates, from the current studio pass, in capture order: griffin close, three-headed hound, phoenix, unicorn
alone, manticore alone, pegasus alone, the settings window over the meadow.

## Description (BBCode, to place in the Workshop page at creation, in this order)

`SetItemDescription` is called only when the game creates the item; later corrections are by hand or through the
CI. The body is in `Mod/About/About.xml`; this is the tail to check before the first send.

```
[b]IF I GO QUIET[/b]
If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

[b]AI-GENERATED[/b]
The port, its code, tests and documentation were made with AI assistance: Codex (OpenAI) for the 1.6 extraction, the isolated assembly and the French translations, Claude Code (Anthropic) for the settings, the test suites and the documentation, and OpenAI image generation for the preview illustration. The creatures, their code and their artwork are Sarg Bjornson's.

[b]THANKS[/b]
[url=https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793]Alpha Mythology[/url] by Sarg Bjornson, the original this continues; original preview by Oskar Potocki. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2023507013]Vanilla Expanded Framework[/url] and Harmony, which the mod stands on. For testing only, never dependencies of the mod: Pickle, RimLogging, RIMMSQOL and PickleTools.

See ATTRIBUTION.md and the licence notice in the repository for provenance and rights. No ownership or endorsement by the original author is claimed.

[url=https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew]Source code on GitHub[/url]
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
| Harmony | 2009463077 | posted | add "Alpha Mythology Renew" to `Covers`, no comment |
| Vanilla Expanded Framework | 2023507013 | posted | same |
| Pickle, RimLogging, RIMMSQOL | 3791648678, 3733484696, 1084452457 | posted | same, once the suite has actually been played |
| Vanilla Cooking Expanded | 2134308519 | posted | same, only if its pass is written |
| Alpha Mythology (the original) | 1821617793 | absent | **decision needed, see below** |
| A RimWorld of Magic | 1201382956 | absent | ids resolved 2026-09-26; register row and draft to write. Its own pass hung the shared machine twice (2026-09-27, d62d and 342d) on a `TypeLoadException` inside its own assemblies, unrelated to this mod; isolated in `wsl-deps.avec-rwom.map`, not resubmitted without asking. Credit the API regardless — the hang is this machine's cache, not the mod. |
| [XND] Nocturnal Animals (Continued) | 2269731409 | absent | same |
| Vanilla Genetics Expanded | 2801160906 | absent | same |
| Vanilla Achievements Expanded | 2288125657 | absent | same (not installed here) |
| Advanced Biomes (Continued) | 3541022508 | absent | same |
| Nature's Pretty Sweet (Continued) | 3542949511 | absent | same, after settling the name guard (see STATUS.md) |
| Lord of the Rims - Elves (Continued) | 3548255064 | absent | same; a "(Continued)" page: credit both the original author and the maintainer (zal): read the page to name them |
| Giddy-Up 2 - Continued | 3674332861 | absent | same; the patch comment names Roolo, Owlchemist and dav9670 before MemeGoddess: read the page before crediting |
| A Dog Said... Animal Prosthetics 2 (Sam Bucher) | 3238353862 | absent | to draft, after the item is public; patch written 2026-10-01, not yet seen working in game |
| Better Crossbreeding (DizzyEevee) | 3520675842 | absent | to draft; patch written 2026-10-01, not yet seen working in game |
| Dogs mate (Continued) (Mlie, after Revolus) | 2441132298 | absent | to draft: credit Mlie and Revolus on the Continued page, in one message (WORKSHOP_COMMENTS.md); patch written 2026-10-01, not yet seen working in game |
| Tree Chopping Speed Stat | 2566231583 | absent | not a patch guard, a known-issue check (F12, feature 17); its scenario played green (8421): the kappa's `VBY_TreeChopWorkSpeed` NullReferenceException the original's page describes did not reproduce here. Register row and draft to write, credit velcroboy333. |

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

### Vanilla Genetics Expanded, 2801160906 (Sarg Bjornson and Reann Shepard) - **do not post without Virginie**
The author of the original Alpha Mythology co-wrote this mod and answers on this page. A comment here announces an
unofficial port of his other mod to him, in a public thread. Same reason as the original's page: her decision, and
possibly none. No draft written on purpose.

### Not drafted yet
- **Vanilla Achievements Expanded**, 2288125657: page read 2026-09-26 (after a first refusal by Steam). Authors listed: Sarg Bjornson, Oskar Potocki and Smash Phil (Vanilla Expanded team). **Sarg Bjornson is again a co-author and answers there**: same decision as Vanilla Genetics Expanded, hers, so no draft. The port ships this integration (achievement icons and patch), so its thanks stay in the description.

- **Nocturnal Animals (Continued)**, 2269731409: register row already `drafted` by two other mods: add this port to its
  `Covers`, no second comment. **Vanilla Cooking Expanded**, 2134308519: register row `posted` (2026-09-25): add to `Covers`.
- **Use This Instead** (3396308787): this port now depends on the resolver library, so it is credited in THANKS (done, 2026-09-28); a Workshop comment for Mlie is the library's publication, not this mod's, and Mlie's consent before any mention on his page is the owner's call.
