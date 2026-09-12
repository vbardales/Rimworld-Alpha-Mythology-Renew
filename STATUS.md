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
showcase: original preview and icon reused with credit
remaining:
  - unverified: manual gameplay and save migration
  - unverified: optional legacy integrations with their providers
  - publication: Workshop item not created
  - parent: removal is staged in parent index; parent ignore edit is uncommitted alongside unrelated user work
updated: 2026-09-12
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

- Local Check-Mod.ps1: PASS, 63 XML files, 25 creatures, unique defs, race references,
  XPath syntax, isolated namespace and publication notices.
- Release compilation: PASS, .NET SDK 8.0.424, zero warnings and zero errors.
- Upstream snapshot: no automated test suite, test project or CI workflow found;
  description mentions playtesting without a reproducible protocol. See TESTING.md.
- Nine manual gameplay scenarios remain NOT RUN, including save migration.
- Earlier local audit recorded 129 named defs and four parents resolving with VEF,
  no unknown fields, and 65 type names examined. These checks were not rerun in
  this repository-separation audit; ten optional legacy types still require providers.
- GitHub CI: PASS for initial code commit 37c56e1eab9ae8968e46d6cd43b75090c209f380,
  XML checks and compilation on Ubuntu, run
  https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew/actions/runs/34714005350 .
- Initial snapshot pushed to origin/main and remote SHA verified against local HEAD.

Three ported classes use AlphaMythologyRenew rather than Bastyon to avoid collisions.
All 25 original PawnKindDef names are preserved. No Workshop upload is claimed.
