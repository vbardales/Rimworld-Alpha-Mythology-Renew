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
| Vanilla Achievements Expanded | optional | `Mod/LoadFolders.xml` branch `IfModActive="vanillaexpanded.achievements"` |
| Eight other providers (Advanced Biomes, Genetics, GiddyUp, Elves, Nature's Pretty Sweet, Nocturnal Animals, RimWorld of Magic, Vanilla Cooking Expanded) | optional, never a dependency | `Mod/Patches/AlphaMythology/*Patch.xml`, all `PatchOperationFindMod` |
| RIMMSQOL | not a dependency; reveals the hidden settings shortcut | dev-only pass `wsl-deps.avec-rimmsqol.map` |
| DLC | none required | one `MayRequire="Ludeon.RimWorld.Biotech"` in the Defs; `supportedVersions` 1.6 only, no DLC branch in `LoadFolders.xml` |
| Incompatible | `sarg.magicalmenagerie` (the original) | `About.xml` `incompatibleWith`; the pass that looks at it is not written yet |

## Adult content boxes

Opened on 2026-09-26, as contact sheets: `Preview.png`, `ModIcon.png` source, and all 210 PNG textures of `Mod/Textures`
(creatures in three views, dessicated skeletons, eggs, information cards, achievement icons, projectiles, saddles).
Contact sheets are 150 px thumbnails: text on the cards was not read.

- Nudity or sexual content: **no**. Nothing suggestive in any image.
- Strong language: not checked in the texts (only the images were opened); the strings are the original's and
  the port's own keys. Grep them before answering.
- Violence or gore: cartoon-style only. One achievement icon (`MM_AchievementFountainOfBlood`) shows a figure with
  red splashes, the creatures include fire and poison breath, and dessicated corpses are drawn as clean skeletons.
  The mod adds a bleeding wound. This is RimWorld's own register and nothing is graphic or frequent, so **"no"
  looks right**, but it is Virginie's answer to give.
- Found while looking, not changed (`Mod/` is frozen): textures for a `MM_Mechataur` (4 files) that is not one of the
  25 creatures (the odd-named `MM_FenghuangEgg_a copy.png` is used: its egg graphic loads the whole folder).

## Screenshots (order to decide after the passes)

Steam shows the first image large: the most demonstrative one goes there, not the prettiest. Nothing is
captured yet: the only capture the suite produces is the settings window in each language (`05-language`,
`@review`), which shows the interface and not the creatures. Gallery images need to be made of the creatures
themselves (a scenario that spawns and frames them); zoom enough to show what is not interface. Not written yet.

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
| A RimWorld of Magic | 1201382956 | absent | ids resolved 2026-09-26; register row and draft to write |
| [XND] Nocturnal Animals (Continued) | 2269731409 | absent | same |
| Vanilla Genetics Expanded | 2801160906 | absent | same |
| Vanilla Achievements Expanded | 2288125657 | absent | same (not installed here) |
| Advanced Biomes (Continued) | 3541022508 | absent | same |
| Nature's Pretty Sweet (Continued) | 3542949511 | absent | same, after settling the name guard (see STATUS.md) |
| Lord of the Rims - Elves (Continued) | 3548255064 | absent | same; a "(Continued)" page: credit both the original author and the maintainer (zal): read the page to name them |
| Giddy-Up 2 - Continued | 3674332861 | absent | same; the patch comment names Roolo, Owlchemist and dav9670 before MemeGoddess: read the page before crediting |

**The original's page: do not draft yet.** A comment there announces a port published without the author's
consent, on a page where he removes comments about 1.6 updates and answered VEF's page on 2026-09-22. Whether
to comment at all, and in what words, is Virginie's call. If she wants one, it is a personal comment in her own
voice, under 1000 characters, with one hidden link `[url=...]Alpha Mythology Renew[/url]`, posted only after the
item is public, and it must not claim permission.

## After the send

Commit `Mod/About/PublishedFileId.txt` immediately (lost, the next send creates a second item); record the
Workshop id in `STATUS.md`; update the register; post comments only once the item is visible to recipients.
