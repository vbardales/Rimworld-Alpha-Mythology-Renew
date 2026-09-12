---
mod: Alpha Mythology Renew (unofficial)
packageId: nelim.alphamythologyrenew
repo: https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew
visibility: public
local_path: C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew
git_root: C:/Users/nelim/Documents/rimworld/AlphaMythologyRenew
git_isolation: standalone; removed from parent index and ignored there
remote: origin https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew.git
maintainer: Codex task dedicated to AlphaMythologyRenew; maintain this STATUS.md as work progresses
stage: preTest
licence: silent
licence_at: 2026-09-12; upstream master 53a5518008821188009bbf996b7120ad9593cb5f and Workshop description reviewed; no project redistribution grant found
showcase: preview validated and pushed; icon optimized to 128 x 128 locally (21666 bytes)
remaining:
  - unverified: manual gameplay and save migration
  - unverified: optional legacy integrations with their providers
  - publication: Workshop item not created
  - parent: removal is staged in parent index; parent ignore edit is uncommitted alongside unrelated user work
updated: 2026-09-13
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
