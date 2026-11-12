# Review refusals

ChatGPT suggestions of /review-translation that were not applied. One row per suggestion.

| Date | Key or text | Proposal | Reason |
|---|---|---|---|
| 2026-11-12 | French `MM_Grabbed.label` | `agrippé` to `agrippement` | A hediff label is an adjective like the other state labels; the stage `grabbed` already reads `agrippement` and the description agrees (`agrippée`). Wording validated by Virginie (2026-10-17 and 2026-11-12). |
| 2026-11-12 | French `MM_Ranged` | `lui fera chercher` to `le fera chercher` | `chercher un abri` and `utiliser son attaque` are transitive, so the indirect `lui` is correct in the causative. The same fix is applied to `MM_NoRanged` (intransitive `attaquer`). |
| 2026-11-12 | English `MM_Cerberus.description`, `MM_ErymanthianBoar.description`, `MM_Pegasus.description` | three typo fixes | Correct, but the English source belongs to the upstream author: carried as upstream pull request candidates (STATUS.md), not edited here. |
| 2026-11-12 | English and French `MM_CeryneianHind.description`, `MM_Pegasus.description` | singular/plural fix; `stallions` to `horses` | Correct, but the English source belongs to the upstream author: upstream pull request candidates (STATUS.md). French stays aligned with the shipped English until upstream takes it. |
| 2026-11-12 | (superseded) the six English candidates above | applied locally by the owner's word ("send upstream and update locally meanwhile") | Cerberus especially, boar, Pegasus (two fixes), Ceryneian Hind; French aligned for Hind and Pegasus. Upstream PR still to send; if upstream words it differently, align here.
