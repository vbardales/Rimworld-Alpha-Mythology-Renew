# Changelog

## [unreleased]

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

- Creation of a publishIdFile: pre-publication whose only purpose is to create the
  (private) Workshop item and obtain its `About/PublishedFileId.txt`. Contents: `Mod/`
  as it stood at the pushed commit. Not tested in game, not public.
