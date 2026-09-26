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
| 02 settings | 5 | the window belongs to this mod and edits the instance the patch reads; a changed value reaches `BiomeDef.CommonalityOfAnimal`, the number wild spawns are drawn from, for this mod's creatures and for no one else's; and the game's own wild-animal draw (4000 draws) honouring the multiplier and the blocked creatures |
| 03 shortcut | 2 | the hidden shortcut is not drawn, then drawn, enabled and opens the same window |
| 04 rimmsqol | 2 | RIMMSQOL lists, reveals and hides the shortcut (needs its own pass, `@requires`) |
| 05 language | 2 | keys resolve in the language of the pass; a capture of the window a person reads (`@review`) |
| 06 reload | 1 | settings are global: a save load neither resets them nor takes them from the file |
| 09 publication shots | 5 | pictures for the Workshop page (`@requires` the studio pass, `@review`) |
| 10 integrations | 8 | each optional patch reaching its target, one scenario per provider (`@requires`), the Nature's Pretty Sweet one expected to fail until the patch guard is fixed |
| 12 creatures | 1 | every creature at every life stage draws its four facings and its dessicated body (F01) |
| 13 phoenix | 6 | the death leaving one or two eggs at each life stage, an egg already on the tile, forced hatching, the egg commands in each language (F02, F03) |
| 14 bleeding | 2 | the wound hurting while it lasts and stopping when removed (F04) |
| 15 combat | 10 + 3 | each ranged creature fires and its target is affected (F06); the tlilcoatl's poison breath on an organic target, a shielded colonist and a mechanoid (F09) |
| 16 products | 6 + 2 + 1 | egg layers, milk, and the Kitsune's regeneration (F07) |
| 17 plants | 2 + 1 | the dead plants cut by a colonist (F08), the kappa asked about a mature crop (F12 baseline) |
| 11 behaviour | 2 | the phoenix leaving an egg when it dies, the will-o'-wisp's translated fission text; the incompatibility scenario is written as a comment until its symptom is known |
| 07 / 08 restart | 1 + 1 | a value that has to outlive the process, which one process cannot show |

**Not converted:** the wisp gizmos and the patches of Vanilla Achievements Expanded, which is not installed here.
What remains unplayed stays `unverified` in `STATUS.md`.

## The passes

| Pass | Filter | Language | What it establishes |
|---|---|---|---|
| minimal English | `PLAIN` | English | the mod and its settings stand on their own (24 played, 15 skipped by requirement: 04, 09 and 10 wait for their own passes) |
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

## Passes added on 2026-09-26 (evening)

Maps: `wsl-deps.studio.map` (gallery, English), `wsl-deps.avec-facultatifs.map` (RoM, Nocturnal Animals, Vanilla Cooking,
Vanilla Genetics, Advanced Biomes, Nature's Pretty Sweet, Elves), `wsl-deps.avec-giddyup.map` (Giddy-Up 2 - Continued, its
own pass), `wsl-deps.incompat-magicalmenagerie.map` (the original, staged but its scenario still a comment). A pass counts only
if its `@requires` scenarios really ran: read the report's skipped list. The restart reader now writes the defaults back to
the Config file, so passes without a seed do not inherit the writer's x3 and blocked creature.
Gallery notes: the five pictures were chosen so as not to repeat the Preview (griffin and hound in a stable): a close
griffin, a five-creature line-up, the hound, the phoenix, and the settings window. Zoom and offsets are guesses to tune
after the first capture; open every image before ordering them.
