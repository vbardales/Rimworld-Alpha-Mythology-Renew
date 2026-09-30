# Protocols read (local note)

IMPORTANT: the protocol documents (AGENTS, AUDIT, PUBLISHING, TRANSLATIONS, STYLE_RIMWORLD, MOD_SETTINGS, WORKSHOP_COMMENTS, scripts/SEARCHING) live in `vbardales/Rimworld-protocols`; `git log` from the monorepo returns the commit that deleted them. Use `git --git-dir=../rimworld-protocols.git --work-tree=. log -1 --format=%h -- <file>` from `Documentsimworld`. The hashes recorded before 2026-09-30 (10cb2947, 90d51374) were wrong for that reason.

Purpose: avoid rereading documents that did not move. Compare the last commit of the file in its own repository
(`git -C <repo> log -1 --format=%h -- <file>`, run from `C:\Users\nelim\Documents\rimworld`) with the version below;
reread only what moved. Updated 2026-09-30 by the alphamythology session. "Version" is that commit hash.

| Document | Version | Read | Useful to this mod |
|---|---|---|---|
| AGENTS.md | 7fd7475 | full (loaded as project instructions) | yes: gate order, evidence rules, CI publishing rules |
| AUDIT.md | 7fd7475 | full, 2026-09-30 | yes: audit workflow, `tested` criteria (no `@wip`, every `@requires` pass run, no manual test left), Pickle rules, title format |
| MOD_SETTINGS.md | b83933b (2026-09-23) | full, 2026-09-26; older than that read | yes: settings gate |
| TRANSLATIONS.md | ebadb99 (2026-09-30, plus uncommitted edit) | full, 2026-09-30 (French gender rule, Virginie review, preTest entry needs all three fields complete) | yes: l10n gate, French review |
| PUBLISHING.md | e0411cc | 2026-09-26: "Juste après", "À chaque mise à jour", "Publier par la CI"; 2026-09-30: packageId, sources hors du dossier, animal-mod rule, Dépôt, "Au moment d'envoyer" | yes; image, licence, mentions, topics sections not reread |
| STYLE_RIMWORLD.md | ef7e7a9 (plus uncommitted edit; read at an older version) | headings + "ModIcon : contrôle", 2026-09-26 | partly: the icon is the owner's; Preview already passed |
| WORKSHOP_COMMENTS.md | 7fd7475 | 2026-09-30: diff since 10cb2947 only (new "Writing a comment" method, incident log, register rows) | yes for the thank-you drafts in PUBLICATION.md (method: voice, shape, hidden link, 150-350 chars) |
| scripts/SEARCHING.md | 50de695 (2026-09-28) | full, 2026-09-27; changed since, not reread | no: no corpus search needed so far |
| PickleTools/README.md | ff20d89 (read at 654b233) | headings only | superseded by the Authoring and RimmsqolSteps guides; changed since, not reread (no run filed this session) |
| PickleTools/Authoring/README.md | a47799f | sections 1-7, 2026-09-26 | yes: how the suite was written |
| PickleTools/RimmsqolSteps/README.md | 2421d68 (read at 654b233) | usage and vocabulary | yes: the RIMMSQOL pass |
| PickleTools/Headless/README.md | ed4e73a (read at 654b233) | headings only | needed when a run is requested; changed since, reread then |
| PickleTools/docs/steps.md | da7c3b0 (read at 654b233) | headings only | same |
| Rimworld-Release-Admin/docs/OPERATIONS.md | 3c03f51 (read at f196148) | headings + "First Workshop publication" | needed the day a workflow, tag or secret is touched; changed since, reread then |
| Rimworld-Ticket-Dispatcher/docs/SUBMIT.md | d07b2b8 (read at bd6e7bc) | options table, exit codes, examples | yes when filing a run; changed since, reread then |
| Rimworld-Ticket-Dispatcher/docs/WELCOME.md | 77ca9d7 | full, 2026-09-30 | same |

Mod documents: STATUS.md (front matter, 2026-09-26 to 2026-09-30 sections), TESTING.md, BACKLOG.md, CHANGELOG.md,
PUBLICATION.md (head) and docs/runs/ read or checked 2026-09-30. `NOTES.md` and `BUGS.md` do not exist in this mod.
README.md, ATTRIBUTION.md, LICENSE and `Mod/About/About.xml` (description, dependencies) were only checked for the
points that concern the audit (packageId, upstream link, THANKS).

Not read in full: everything marked "headings only", partial, or "changed since". Do not treat them as absorbed.
