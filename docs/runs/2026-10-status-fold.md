# STATUS sections folded out on 2026-10-16

Dated sections of the 2026-10 audit and transitions, moved out of `STATUS.md` (over 20 KB). Text unchanged.

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

