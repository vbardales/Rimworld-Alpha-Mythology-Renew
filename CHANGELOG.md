# Changelog

## [unreleased]

### 2026-10-10

Entries missing from the list below, completed at the audit of this date. Not tested in game, not public.

Already in the private 0.1.0 (2026-10-01), never listed before:

- Added optional integrations for animal mods: A Dog Said... Animal Prosthetics 2 (22 creatures in its categories), Dogs mate (the Erymanthian boar joins the Pig group) and Better Crossbreeding (Cerberus, Erymanthian boar, Ceryneian hind and Pegasus with their vanilla kin, both directions). Each patch changes nothing without its mod.
- Wisp fission progress now counts days through `.One` and `.Many` keys, in English and French.
- Fixed the phoenix death explosion destroying an egg it had merged into an existing stack.
- Added Resolve This Instead as a required library, so the Nature's Pretty Sweet patch also applies to its (Continued) page.
- Removed unused textures and the shutdown recipe that no creature offered.

Since 0.1.0:

- French text revised after the owner's review: no generic plural, corrected leather, Xiezhi and utility wording.
- The Steam description now comes from the Markdown source of `PUBLICATION.md`; `About.xml` carries its plain-text rendering.
- New ModIcon and Preview.

### 2026-09-26

- Added a settings window (Mod options): wild spawn frequency multiplier (0.1-5) and one switch per creature to keep it from appearing in the wild; optional MainButtons shortcut, hidden by default.
- Added unit tests of the spawn rules and static checks of the settings contract; not yet tested in game.

Work toward 1.0.0, above the 0.1.0 pre-publication.

### 2026-09-13

- Added French translations for creature, item, health, combat and optional
  achievement text, and restored missing English/French UI and role keys.
- Localized wisp reproduction inspection, birth messages and developer commands;
  supplied French VEF egg-warning and body-clock text.
- Corrected the qilin and salamander role labels/tooltips without changing stats.
- Added a translation inventory, CI coverage checks and bilingual acceptance cases.
- Static validation passes; in-game English/French acceptance remains pending.

### 2026-09-12

- Extracted the 25 Alpha Mythology creatures, defs, nine optional patches, textures
  and sound clips from Animal Ark, preserving gameplay values and defNames.
- Moved the phoenix death action, bleeding hediff and shutdown recipe into
  AlphaMythologyRenew.dll; XML points to the isolated namespace.
- Retained the 1.6 XML and VEF migrations documented in the source pack's port notes.
- Added unofficial disclosure, original author credits and dependency metadata.
- Manual in-game tests remain pending; existing-save migration is unverified.

## [0.1.0]

- Creation of a publishIdFile: pre-publication whose only purpose is to create the (private) Workshop item and obtain
  its `About/PublishedFileId.txt` (3811323347). Contents: `Mod/` as it stood in the working tree when it was sent, on
  2026-10-01 around 16:00. Not tested in game, not public.
