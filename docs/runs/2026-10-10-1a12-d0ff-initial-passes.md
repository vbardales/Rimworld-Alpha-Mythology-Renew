# Runs 1a12 (English) and d0ff (French), initial full pass, sans-facultatifs, revision eba7208 (+docs)

Both `exitReason: failed`, exit 1, set `sans-facultatifs`, 84 scenarios discovered and played: 49 passed, 5 failed, 30 skipped by requirement, 0 flaky, in both languages. Evidence: `Tests/Pickle/Evidence/initial-en`, `initial-fr`.

Red, in both: (1) the restart read scenario ran alone (my filing error: the pair is played as `-Filter restart-write -Then restart-read`, not inside a full pass); (2) two scenarios of feature 11 (phoenix egg in flames, wisp inspection text): undefined step `Alpha Mythology Renew spawns the player animal`, a step I removed at 2a27b0b as "dead" while feature 11 still uses it (suite defect, restored); (3) the egg destruction: "the colonist did not take the destruction job (taken True, current job none)".
Red in one language only: English, `MM_StymphalianBird` ranged attack shows no injury; French, the Kitsune heal scenario "the colonists were not injured". These passed in the 2026-10-05 baselines: to replay alone.
