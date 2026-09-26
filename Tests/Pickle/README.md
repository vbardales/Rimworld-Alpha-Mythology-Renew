# Alpha Mythology Renew - Pickle suite

In-game acceptance tests of the settings. Development only: the companion under `Mod/` is never
published, and nothing here is part of the Workshop payload. Writing them is the `preTest -> done`
criterion; playing them and reading their captures is `done -> tested`. **Nothing here has been played.**

## What is in Gherkin, and what deliberately is not

Pickle costs the machine tens of minutes a run. What is provable without the game stays out of it:
the rules of the settings (bounds, clamping, NaN, blocked creature) are `Tests/UnitTests`, the XML and the
settings contract are `Tests/Check-Mod.ps1`, the translation resources are `Tests/Check-Translations.py`.
What is left needs a running game.

| Feature | Scenarios | Why only a running game can show it |
|---|---|---|
| 01 loading | 3 | the loader admitted the mod beside VEF, the Mod class ran, a clean profile has the defaults |
| 02 settings | 4 | the window belongs to this mod and edits the instance the patch reads; a changed value reaches `BiomeDef.CommonalityOfAnimal`, the number wild spawns are drawn from, for this mod's creatures and for no one else's |
| 03 shortcut | 2 | the hidden shortcut is not drawn, then drawn, enabled and opens the same window |
| 04 rimmsqol | 2 | RIMMSQOL lists, reveals and hides the shortcut (needs its own pass, `@requires`) |
| 05 language | 2 | keys resolve in the language of the pass; a capture of the window a person reads (`@review`) |
| 06 reload | 1 | settings are global: a save load neither resets them nor takes them from the file |
| 07 / 08 restart | 1 + 1 | a value that has to outlive the process, which one process cannot show |

**Not converted:** the wisp inspection text and gizmos, the phoenix death and the optional patches of the
nine legacy integrations. They are not part of the settings; they remain `unverified` in `STATUS.md`.

## The passes

| Pass | Filter | Language | What it establishes |
|---|---|---|---|
| minimal English | `PLAIN` | English | the mod and its settings stand on their own (13 played, 2 skipped by requirement) |
| minimal French | `PLAIN` | French | the same, in the other language |
| restart | `07-restart-write` then `08-restart-read` | English | settings outliving the process |
| with RIMMSQOL | `04-rimmsqol`, `-DepMap wsl-deps.avec-rimmsqol.map` | English | the shortcut through the tool that reveals it |

`PLAIN = Alpha Mythology Renew - Pickle tests,!07-restart-write,!08-restart-read`. The suite name comes
first: a filter of exclusions alone keeps every scenario of every suite. `04-rimmsqol` is left in `PLAIN`
on purpose so that the report shows it skipped, not absent.

Not yet covered, and to be declared before `tested`: a pass for the optional integrations named by the nine
patches (each needs its provider and its Workshop id), and a pass for the declared incompatibility with
`sarg.magicalmenagerie` (Workshop 1821617793), asserting the documented symptom rather than expecting a red.

## Running it

Never launch the game yourself: file requests with `Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1`
(one request per pass, the mod's SHA in the label, the tree frozen on that revision until `RUN_DONE`).
`config/sans-facultatifs/Mod_AlphaMythologyRenew_AlphaMythologyRenewMod.xml` seeds the defaults at every
staging, because the Config folder is not wiped between passes and the restart pair leaves x3 and a blocked
creature on disk on purpose.

## Evidence to keep

After a run, keep only, per pass, the latest `summary.md`, `junit.xml`, `messages.ndjson` and `Player.log`
for the revision now in the repository, and the `@review` captures that were actually opened (minified),
never a whole `screenshots/` folder. Older reports of the same pass go as soon as a newer one replaces
them, unless one is the sole proof of a check the latest run did not repeat. Copies live in
`Tests/Pickle/Evidence/` (gitignored); history is one text line per run in `docs/runs/`. Read `exitReason`
before the counts and check played against discovered.
