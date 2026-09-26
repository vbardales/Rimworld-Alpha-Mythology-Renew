---
localization: complete
translation_en: complete
translation_fr: complete
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythologyrenew
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
visibility: public
local_path: C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew
git_root: C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew
git_isolation: standalone; removed from parent index and ignored there
remote: origin https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
maintainer: Codex task dedicated to AlphaMythologyRenew; maintain this STATUS.md as work progresses
stage: preOptions
settings_audit: partial
audit_at: 2026-09-26
audit_revision: 3d88314fbeec0b037a884839f43689de1b4f2a90
automated_tests: passed; static contracts and negative cases only
xml_tests: passed
functional_tests: unverified; not run in game
licence: silent
licence_at: 2026-09-12; upstream master 53a5518008821188009bbf996b7120ad9593cb5f and Workshop description reviewed; no project redistribution grant found
showcase: directly inspected; committed Preview 896 x 504 (564630 bytes), ModIcon 128 x 128 (21666 bytes)
remaining:
  - unverified: relevance assessment of omitted spawn controls in the current port; their historical existence does not require restoration or establish a defect
  - unverified: English and French in-game translation acceptance, including optional integrations and wisp inspection/gizmos
  - unverified: manual gameplay and save migration
  - unverified: optional legacy integrations with their providers
  - publication: 0.1.0 pre-published by the owner on 2026-09-26 (item private); About/PublishedFileId.txt is NOT yet in the repository: commit it as "Add published Workshop file ID for 0.1.0"; Workshop ID not yet recorded here
  - parent: removal is staged in parent index; parent ignore edit is uncommitted alongside unrelated user work
updated: 2026-09-26
---

This task manages this standalone mod repository and keeps this status current.
The folder has its own .git and origin. The parent monorepo no longer tracks its
files in the index and ignores /AlphaMythologyRenew/. Existing parent history is
preserved. Parent changes have not been committed together with unrelated work.
The initial standalone snapshot includes the local working files, with provenance
from parent commit 4d30c6822034b6822124449ca1f170188d7f3e53; no unrelated monorepo
history is imported. Build intermediates remain inside the ignored local .build/.

## Title and description

Keep Alpha Mythology Renew (unofficial): Renew denotes the port and (unofficial)
matches the current disclosure. No additional suffix is needed.
Mod/About/About.xml links the original source and ends with a separate
Source code on GitHub link to this public port repository.
Publication policy confirmed by the user: silent = public. GitHub visibility
was changed to public and verified on 2026-09-12; licence classification stays silent.

## TODO — définir et justifier le statut `silent`

Checklist à reprendre à chaque nouvel audit. Une case cochée signifie que la
vérification a été faite, pas qu'une autorisation a été obtenue. Si une source
nécessaire n'a pas été examinée, indiquer cette limite et garder la conclusion
provisoire. Ne jamais déduire `silent` du seul champ GitHub `license: null`.

- [x] Identifier le mod original, son auteur, son dépôt et son item Workshop.
- [x] Dater l'audit et enregistrer le commit exact du dépôt original examiné.
- [x] Examiner l'arborescence complète : LICENSE/LICENCE, COPYING, README,
  About.xml, mentions dans les sources et documents de redistribution.
- [x] Distinguer les licences du mod de celles des dépendances et contenus tiers.
- [x] Lire la description Workshop et ses mentions de droits ou de réutilisation.
- [x] Récupérer toutes les pages de commentaires accessibles, vérifier le total
  et les doublons : 602/602 commentaires uniques lors de cet audit.
- [x] Rechercher les déclarations sur les permissions, portages, republications,
  réutilisations, refus et retraits ; identifier l'auteur et lire le contexte.
- [x] Examiner les discussions du mod : fil Bug Reports, 30/30 réponses.
- [x] Consigner les déclarations pertinentes avec date, lien direct et portée :
  la réponse du 21 août 2022 concerne une retexture, pas explicitement ce port complet.
- [x] Distinguer une licence, une permission limitée, un refus explicite et
  l'absence de déclaration trouvée. Un projet de refonte ou le refus de répondre
  aux demandes de mise à jour ne suffit pas à établir un refus de redistribution.
- [x] Consigner les limites : commentaires supprimés/privés et accords privés
  inconnus ; l'audit du dépôt porte sur le snapshot indiqué, pas tout son historique.
- [x] Reporter les preuves et la conclusion dans STATUS.md ; garder LICENSE et
  Mod/LICENSE comme notices tant qu'aucune licence applicable n'est identifiée.
- [x] Appliquer la règle de visibilité de l'utilisateur : **`silent` = public**.
  Conserver la mention `(unofficial)` et le lien vers le dépôt du port.
- [ ] Lors du prochain audit ou avant publication Workshop, actualiser les sources
  et les commentaires ; examiner toute politique générale de l'auteur ou autre
  déclaration applicable nouvellement signalée, puis réévaluer la classification.

Critère de décision : retenir `silent` lorsque les sources examinées ne donnent
ni licence/autorisation explicite applicable à la redistribution du port complet,
ni interdiction explicite applicable. Ce constat reste limité aux sources et à la
date documentées. Une permission ambiguë ou limitée doit être signalée, jamais
transformée en autorisation générale. Une nouvelle preuve peut changer le statut.

## Licence verification — 2026-09-12

Sources: https://github.com/juanosarg/AlphaMythology/tree/53a5518008821188009bbf996b7120ad9593cb5f
and https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793 .
The complete upstream default-branch tree (not truncated), About/About.xml,
project and source text were checked. GitHub reports license: null. No project
LICENSE/COPYING or redistribution grant was found. The only LICENSE is in the
bundled Lib.Harmony.2.3.1.1 package and applies to that dependency, not this mod.
The reviewed Workshop description contains credits but no project licence grant.
Thus silent means no explicit project licence found in these reviewed sources;
it is not a licence or permission, nor proof about private author agreements.
LICENSE and Mod/LICENSE remain identical disclosure notices, not an MIT grant.
Third-party sound attribution is preserved in ATTRIBUTION.md. Remake timing is
not used to infer licensing or permission.

### Workshop comments audit — 2026-09-12

Retrieved all 602 currently exposed main-page comments in seven batches: 602
unique comment IDs, including 163 comments attributed to Sarg Bjornson. Searched
the corpus for redistribution, reuse and permission statements and reviewed author
responses and relevant conversational context. Also reviewed the Bug Reports
thread's 30 replies across both pages. Deleted/private comments are outside scope.

One relevant statement was found: on 21 August 2022, Sarg responded to a request
to make a retexture with permission conditional on the game's EULA and a refusal
to endorse it. This is not silence about all derivative work; its context is a
retexture, not an explicit licence for republishing the complete mod as this port.
Response: https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793#c3428948355375415583
Question: https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793#c3428948355374816701
No explicit full-mod redistribution grant or prohibition was found in the reviewed
comments. Classification stays silent for this port, with this qualification;
visibility remains public under the user's rule.

The author's July 2026 statement concerns a future remake and removal of comments
asking for 1.6 updates; it is not classified as a redistribution prohibition.
Bug Reports supplies historical reproduction cases, not an automated test suite:
https://steamcommunity.com/workshop/filedetails/discussion/1821617793/3130541756142153070/
Local raw audit files are kept under ignored .build/workshop-audit/.

## Validation

Readiness recheck on 2026-09-12: the C# source and shipped DLL are present and
tracked. All three custom classes are referenced by the intended XML definitions;
the phoenix egg and bleeding damage defs used by the code exist. XML checks and
Release compilation were rerun successfully and the shipped DLL rebuilt.
Stage is preTest; this workflow label is independent of in-game testing. No gameplay execution has been validated.

- Local Check-Mod.ps1: PASS, 63 XML files, 25 creatures, unique defs, race references,
  XPath syntax, isolated namespace and publication notices.
- Release compilation: PASS, .NET SDK 8.0.424, zero warnings and zero errors.
- Upstream snapshot: no automated test suite, test project or CI workflow found;
  description mentions playtesting without a reproducible protocol. See TESTING.md.
- Twelve functional scenario groups in Tests/FUNCTIONAL.md remain NOT RUN, including save migration.
- Earlier local audit recorded 129 named defs and four parents resolving with VEF,
  no unknown fields, and 65 type names examined. These checks were not rerun in
  this repository-separation audit; ten optional legacy types still require providers.
- GitHub CI: PASS for initial code commit 37c56e1eab9ae8968e46d6cd43b75090c209f380,
  XML checks and compilation on Ubuntu, run
  https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew/actions/runs/34714005350 .
- Initial snapshot pushed to origin/main and remote SHA verified against local HEAD.

Three ported classes use AlphaMythologyRenew rather than Bastyon to avoid collisions.
All 25 original PawnKindDef names are preserved. No Workshop upload is claimed.

## Preview — 2026-09-12

Generated with built-in image_gen following ../STYLE_RIMWORLD.md. Source: Art/Preview-source.png; prompt: Art/PROMPT_ALPHA_MYTHOLOGY.md; reproducible text composition: Art/render-preview.cjs. Installed Mod/About/Preview.png: 896 x 504, 560866 bytes. Visual QA completed; minimum sampled text contrast 4.76:1. Griffin and Cerberus enclosure; English title and summary, unofficial label. Existing icon deletion left untouched.


Typography corrected to Segoe UI for title and supporting text, matching MoreStorylikeTraits and SoftWarmPrimitiveBedsRenew engraving templates. Re-rendered and visually checked.

## Test suite expansion — 2026-09-12

Tests/FUNCTIONAL.md now defines 12 functional scenario groups with reproducible
steps, expected outcomes and a result template; all remain NOT RUN.
Tests/Check-Mod.ps1 passes 302 static assertions covering metadata, definition
links, hatchers, custom worker bindings, phoenix egg fire resistance, notices,
PNG signatures and assembly packaging. Tests/Test-Validator.ps1 passes six negative
cases in an isolated temporary copy. CI runs both scripts and compilation.
These results do not establish runtime gameplay correctness. This does not determine the preTest workflow stage.

## TODO verification — 2026-09-12

- [x] Cross-check the completed silent checklist against the recorded source and
  Workshop audit evidence: 602 archived comments with 602 unique IDs; the earlier
  two-page Bug Reports audit covers 30 replies. No full comment re-read in this check.
- [x] Verify upstream master still resolves to the audited commit
  53a5518008821188009bbf996b7120ad9593cb5f and GitHub visibility remains PUBLIC.
- [x] Verify LICENSE and ATTRIBUTION copies match the versions shipped in Mod/.
- [x] Rerun static tests: 302 assertions PASS.
- [x] Confirm expanded-suite CI success for b86e4dcdcbaebc08c3adb8c2029d7214279f5d20:
  https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew/actions/runs/34715873368
- [x] Verify standalone Git isolation: parent index contains no mod files and the
  folder is ignored; 317 removals remain staged against the parent HEAD.
- [x] Correct stale icon-absence and nine-scenario statements. Local Preview is
  896 x 504 (560866 bytes); local ModIcon is 1254 x 1254 (1241845 bytes).
- [ ] Execute the 12 functional scenario groups and attach results/logs.
- [ ] Verify supported optional integrations and migration separately.
- [x] Commit and push preview artwork, overlay, metadata and icon sources: 97a3091 and cae4b3b on origin/main.
- [x] Optimize the shipped ModIcon to 128 x 128 (21666 bytes) and visually check at 128 px and 32 px on 2026-09-13.
- [ ] Commit the separation on the parent side without including unrelated work.
- [ ] Refresh the licence/comment audit before Workshop publication; this remains
  an open future checkpoint, not a failed check or a claim of author permission.

The Preview section above records the earlier artwork session; its statement
about an absent/deleted icon is superseded by the current file check here.

## Preview overlay recomposition — 2026-09-12

Current source: `Art/Preview.png`, copied unchanged from the existing text-free `Art/Preview-source.png`, which remains preserved. No replacement illustration was generated and no old source was overwritten. Final overlay: `Mod/About/Preview.png`. Existing title and summary retained; the actual unofficial status appears as `(unofficial)` on its dedicated line. Version 1.6 is read from the delivered About.xml supportedVersions.

Palette reference: `Art/preview-palette.json` only. The veil follows the extensive slate paving. The secondary ink is a light, still chromatic blue from that dominant stone family, rather than a pixel average. The vivid accent follows the warm orange-gold illumination on the griffin, strengthened in saturation for the rule and badge. Title and summary share the same primary ink. Palette values are not duplicated here.

Composition and parameters: `Art/render-preview.cjs`, generating `Art/Preview-layout.html` from the palette JSON at 896 x 504. Actual Chrome platform fonts verified after document.fonts.ready: Segoe UI Semibold (title), Segoe UI regular (tag and summary), Segoe UI Bold (badge); no fallback. Layout uses the prescribed offsets, metrics, shadow and triangle coordinates.

Verification: `Art/verify-preview.py`; detailed results and actual font records in `Art/Preview-qa.json`; text-free rendered background in `Art/Preview-background-qa.png`; thumbnail in `Art/Preview-thumbnail-qa.png`. Minimum contrast across entire text bounding rectangles against the real rendered background: title 6.110:1, tag 4.682:1, summary 5.412:1; badge digits against its opaque accent 8.863:1. Visually checked at 896 x 504 and 268 pixels wide: title and version identifiable, rule visible, no clipping or overlap. Final PNG: 565367 bytes, below 900 KB. Nothing published. This recomposition supersedes the earlier overlay measurements above.

## Preview title hierarchy update — 2026-09-12

Applied the revised STYLE_RIMWORLD.md title hierarchy in `Art/render-preview.cjs` and regenerated `Art/Preview-layout.html` and `Mod/About/Preview.png`. Alpha Mythology retains the 46 px primary ink; Renew is a direct title span at 0.65em (29.9 px), weight 600, using the secondary ink. Existing name, summary and separate unofficial tag preserved. `Art/Preview.png` remains the unchanged text-free illustration; `Art/Preview-source.png` is preserved, with no illustration replacement.

The single palette reference remains `Art/preview-palette.json`: blue slate paving supplies the veil and the light blue secondary family; the orange-gold illuminated griffin supplies the saturated accent. Warm orange contrasts distinctly with the dominant cool blue rather than repeating it. No palette change was necessary.

Verified actual platform fonts after document.fonts.ready: Segoe UI Semibold for both title spans, Segoe UI regular for tag and summary, Segoe UI Bold for badge; no fallback. `Art/verify-preview.py` now checks the reduced suffix separately. `Art/Preview-qa.json` records minimum real-background contrasts: main title 7.752:1, suffix 7.319:1, tag 4.682:1, summary 5.412:1, badge 8.863:1. Final image visually checked at 896 x 504 and in `Art/Preview-thumbnail-qa.png` at 268 px wide: reduced Renew remains readable, title and version identifiable, rule visible, no clipping or overlaps. Version 1.6 re-read from delivered About.xml. PNG size 564630 bytes. Nothing published. These results supersede previous overlay measurements.

## Current delivery status — 2026-09-12

Preview and metadata changes were committed and pushed in 97a3091; the icon and its source artwork followed in cae4b3b. Local HEAD and origin/main both resolve to cae4b3b27df3dab07ad5a3ce2150cce330da8ec7 at this check. The working tree was clean before this STATUS update. The delivered preview is 896 x 504, 564630 bytes; the icon remains 1241845 bytes and still requires the optimization recorded above.

Stage remains preTest. No additional gameplay, save migration, optional integration, parent-repository or licence audit checks were performed in this documentation update. Their pending items remain open; historical measurements above describe earlier revisions. No Workshop publication was performed.

## Icon optimization and stage clarification — 2026-09-13

Optimized Mod/About/ModIcon.png from 1254 x 1254 / 1241845 bytes to 128 x 128 / 21666 bytes (98.26% smaller). Resampled with Pillow Lanczos and saved as an optimized RGB PNG. The identical full-resolution original remains in Art/Icons/queue-alpha-mythology.png, verified by SHA-256 before resizing. Visually checked at native 128 px and at 32 px (Art/Icons/ModIcon-32-qa.png): face, wink, wings and tail remain identifiable with no clipping. This completes the icon optimization item; earlier icon dimensions and pending notes are historical.

User clarification: preTest is not tied to in-game tests. The stage is retained without inventing a new transition criterion. Gameplay, save migration and optional integration checks remain separately documented as unverified; they do not define this stage. Icon optimization and this STATUS update are local changes, not committed or pushed in this operation.

## Translation audit — 2026-09-13

Applied the new translation gate from the parent PUBLISHING.md and TRANSLATIONS.md
to local work based on ad6dc835c81e90735f9873d9db963d5a6147b8ef. Detailed inventory,
scope, dependency checks, commands and runtime acceptance cases are in
`Tests/TRANSLATIONS.md` and `Tests/TranslationInventory.json`.

All owned text mechanisms and English/French resources pass the static audit:
591 inventoried Def/patch fields, 590 French injections and 49 bilingual Keyed
pairs. The remaining inventoried field is the wisp's inspection prefix, replaced
as part of a fully parameterized sentence by a postfix scoped to MM_WillOWisp.
Missing egg-command and animal-role keys were restored; two English role tooltips
were absent upstream. Qilin and salamander role/tooltip mismatches were corrected.
The wisp birth message is now explicitly keyed, and its developer command is
localized. Six shared VEF keys supplement its English-only installed resources.

The shared DefInjected checker passes 590 paths, 0 errors, with VEF, MVCF and
Achievements assemblies and explicit provider targets; no path remained
unverified. Its unsupported AddModExtension operations were inspected directly
and add no owned prose. Achievement translations load only with their provider.
The translation coverage test and four negative cases pass. Existing checks pass
321 assertions and six negative cases. Release build passes with zero warnings
and errors; the shipped DLL is rebuilt. CI includes translation validation, but
these local edits have not been pushed or checked by a new remote CI run.

`localization`, `translation_en` and `translation_fr` are complete for this
inventory/resource gate. Historical stage preTest is retained. Neither language
has been tested in game; display, generated grammar, the new Harmony postfixes
and optional integration behavior remain unverified in `remaining`. Reset the
affected fields to unchecked after subsequent text/UI/Def/patch/resource changes
until revalidation. No Workshop publication or gameplay test was performed.

## Workflow audit — 2026-09-13

This section supersedes historical readiness conclusions, not historical results.
The user's supplied nine-transition workflow takes precedence over the parent
PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md, all read for
this audit. Stage names are literal workflow labels: `preOptions` means the
Preview, palette, English description and naming gate has passed; `options`
requires the settings audit. Gameplay is required only for `tested`.

Scope: standalone repository `C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew`,
distributed directory `Mod/`. The audit started at ad6dc835c81e90735f9873d9db963d5a6147b8ef
with 35 staged changed/added files. During read-only checks HEAD advanced to
9634a431ad553bc7bcd4c36ce693256af39d86e9, containing that translation work; the worktree
then became clean. This audit did not commit, stage, push or discard those changes.
The final revision above is the audited delivery. Only STATUS.md is edited by this
audit; isolated build outputs are under ignored `.build/audit-20260913/`.

| Transition | Result | Evidence / remaining criterion |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated | Own .git and Git root, configured GitHub origin; live `gh repo view` reports PUBLIC and `git ls-remote origin HEAD` returns the audited revision. README, ATTRIBUTION, CHANGELOG and licensing notices exist; distributed notice copies match. Names consistently identify the continuation without requiring literal folder/repository/package identity. |
| horsMonoRepo -> ModIcon generated | Validated for delivered implementation scope | Release build succeeds; shipped DLL reproduced byte-for-byte as explained below. PNG directly inspected, 128 x 128, 21666 bytes. Settings are assessed at their dedicated gate below. |
| ModIcon generated -> Preview generated | Validated | Direct inspection and Pillow decoding: PNG, 896 x 504, 564630 bytes, below 1 MB. High overhead view, tiled ground and legible subjects; no concrete camera defect found. |
| Preview generated -> preOptions | Validated | English About description and preview, Renew reduced and blue, separate unofficial tag; blue secondary #BEDFFF and orange accent #F5A126 visibly distinct. No connecting word needs reduction in this title. |
| preOptions -> options | Not verified | No owned settings page or shortcut. The relevance of historical spawn controls to the current port remains to be established; their omission is not a confirmed defect. settings_audit remains partial pending that assessment, not gameplay tests. |
| options -> l10n | Independent resource validation retained | 591 inventoried fields, 590 French injection paths, 49 bilingual Keyed pairs pass current checks. English Def source is valid native coverage. Future settings text must be audited when introduced. |
| l10n -> preTest | Partial independent verification | Required Harmony and VEF IDs/loadAfter match usage; VEF supplies MVCF. Achievements name gate matches the installed provider and its conditional language folder uses its package ID. Legacy optional providers' full type/reference/version compatibility is still unverified, not a confirmed defect. |
| preTest -> done | Independent test artifacts validated | Written F01-F12 preconditions/actions/expectations and bilingual acceptance cases; executable static XML and translation suites pass with negative cases. These are packaging/definition/resource tests, not C# gameplay execution. Global done remains unavailable because earlier gates are unresolved. |
| done -> tested | Not verified | No gameplay executed, no current Player.log review or bilingual UI interaction. New game, existing save, persistence, migration and provider matrix remain NOT RUN. No RIMMSQOL or other customization integration was tested. |

Licensing: retain the documented `silent` classification and public/unofficial
policy; this is not a permission grant. The archived corpus was directly counted:
602 comments, 602 unique IDs; the cited 2022 author response is present and its
retexture context remains qualified in the earlier audit. LICENSE grants no rights
to upstream content and the shipped copies match. The historical 2026-09-12
source-rights audit is retained, not represented as a fresh full online rights
investigation. No new contrary evidence was established here; refresh before
Workshop publication remains a separate checkpoint.

### Settings audit

Reviewed both owned C# files, all shipped Defs/patches and the upstream 1.5 DLL
archived under `.build/upstream-audit/`. The port contains no Verse.Mod subclass,
ModSettings implementation, SettingsCategory/DoSettingsWindowContents entry or
MainButtonDef. This proves absence of an empty page and shortcut, but alone does
not establish that no useful settings exist.

Candidate player use to assess: control wild appearances of the 25 added creatures,
including excluding an unwanted species without editing XML. The archived original
`MagicalMenagerie_Settings` exposes per-creature pawnSpawnStates and a commonality
multiplier (default 1, UI range 0.1-5, reset and Scribe persistence). Its
`AlphaMythology_BiomeDef_CommonalityOfAnimal_Patch` actually multiplies MM_ animal
commonality. The delivered port has fixed wildBiomes values and omits that settings
implementation; README only says the window was not carried over from Animal Ark.
That records a scope difference but does not settle whether configuration is needed
in this port. The original audit overstated this as a confirmed need and defect.
Historical settings alone do not require restoration. The absence of a page and
shortcut is established; whether that absence violates the access contract remains
unverified until the relevance assessment is complete. No implementation defect
or failed runtime test is established by these observations.

Inherited settings were also inspected in the installed VEF 1.6 assembly:
AnimalBehaviours_Settings exposes global asexual-reproduction, exploding-egg,
regeneration and other flags with default true and Scribe persistence. The port's
wisp postfix reads flagAsexualReproduction. These provider-wide controls are not
owned per-creature spawn controls. No request to duplicate all VEF controls or
expose combat constants is implied. Egg destroy/cancel and ranged-attack commands
are gameplay actions, not a substitute for the mod configuration page.

Next gate: resolve the omitted spawn controls with a documented relevance decision.
For retained useful settings, provide the mod-options entry and the same-settings
MainButtons shortcut hidden by default, then execute applicable defaults, bounds,
effect/application and serialization tests. A reasoned exclusion may support
not_applicable only if the full inventory establishes no relevant owned settings;
the already verified absence of page/shortcut then suffices under the user's rule.
No feature was created in this audit. Interactive FR/EN and RIMMSQOL checks belong
to the final gameplay gate, not this transition.

### Checks executed against the delivery

- `pwsh -NoProfile -File Tests/Check-Mod.ps1`: PASS, 321 assertions, 82 XML files,
  25 creatures; includes matching LICENSE/ATTRIBUTION copies.
- `pwsh -NoProfile -File Tests/Test-Validator.ps1`: PASS, all six deliberate
  regressions rejected in temporary copies.
- Bundled Python running `Tests/Check-Translations.py --self-test`: PASS,
  591 fields, 590 injections, 49 EN/FR pairs and four negative cases. System
  `python` was absent; the bundled interpreter successfully completed the check.
- `../scripts/Check-DefInjected.ps1 -TransMod <Mod> -Targets <Mod>,<VEF>,<Achievements>
  -ExtraAssemblies <VEF.dll>,<MVCF.dll>,<AchievementsExpanded.dll>`: PASS,
  12502 defs indexed, 590 keys, zero errors and no unresolved-path report. Providers
  are installed Workshop 2023507013 and 2288125657, using their 1.6 assemblies.
  The checker explicitly does not implement PatchOperationAddModExtension; those
  shipped operations were read and add classes/data rather than owned prose.
- `dotnet build Source/AlphaMythologyRenew.csproj -c Release --no-restore --nologo
  -p:OutputPath=../.build/audit-20260913/bin/`: PASS, SDK 8.0.424, zero warnings/errors.
  Sandbox SDK access initially failed; the same build with local SDK access passed.
  Output was isolated to preserve the shipped assembly.
- A second isolated build with
  `-p:SourceRevisionId=ad6dc835c81e90735f9873d9db963d5a6147b8ef` reproduced the shipped
  DLL exactly: SHA-256 `13095401976479427F0307652AFCC34350AD53E939293AD91EDCD6B2B953CA74`.
  The default build differed only because it embeds the newly created commit ID;
  this is not stale implementation code and does not require replacing the DLL.
- Direct PNG inspection and Pillow format/dimension/byte checks were performed.
  No historical generation record or side-by-side gameplay screenshot was required.

Documentation correction after the audit: About.xml now locates README.md and
TESTING.md in the GitHub repository and identifies only ATTRIBUTION.md as included.
This metadata wording change does not affect code, Defs or in-game translations.
The settings finding above was also corrected from a defect to an unverified
relevance assessment; no settings restoration is mandated by this audit. An old
French checklist remains in this STATUS history; it was preserved as requested.
Neither observation invalidates the shipped license/attribution copies, the image
checks or the current English README/CHANGELOG. No optional recommendation is
being treated as a missing gameplay proof.

## Workflow audit — 2026-09-26

Revision audited: 3d88314fbeec0b037a884839f43689de1b4f2a90, working tree clean before this
audit (only STATUS.md, CHANGELOG.md, TESTING.md, .gitignore and docs/PROTOCOLS-READ.md edited by it).
Documents read: see `docs/PROTOCOLS-READ.md`. Session title: `Alpha Mythology Renew (unofficial) / preOptions`.

Result: **preOptions retained** (was preOptions). No transition earlier than `options` regressed;
`options` is still not reached.

- `options` blocked: `settings_audit: partial`. The port has no page and no shortcut (verified in
  sources 2026-09-13), but whether the omitted per-creature spawn controls of the original are wanted is
  still a decision for the owner, not a defect. Nothing was created by this audit.
- `localization`/`translation_*` stay `complete` for the static inventory; per MOD_SETTINGS.md they can
  only be *finalized* once the settings gate is settled, and any new settings text will reopen them.
- `l10n → preTest` and beyond: dependencies (Harmony, VEF) unchanged since 2026-09-13; not re-run here.
- Not rerun this session: Check-Mod, Test-Validator, translation checks, build (no code changed since).

Housekeeping done: `*.dds` and `Tests/Pickle/Evidence/`, `evidence/` added to `.gitignore` (no `.dds`
and no evidence was tracked or present on disk); CHANGELOG now opens with `## [0.1.0]`
(creation of a publishIdFile) under `## [unreleased]`; TESTING.md states which evidence to keep and the
new `tested` conditions (no `@wip`, every `@requires` pass run, no manual test left).
No Pickle suite exists yet (`Tests/Pickle/` absent): `tested` remains far off; no run was requested.

Upstream: `juanosarg/AlphaMythology` (default branch `master`, last push 2024-10-17, no licence) is a
public git repository; the port is based on its commit 53a5518. Any fix worth returning goes as a PR
there, only with the owner's agreement.
