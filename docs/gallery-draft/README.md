# Gallery scenarios (draft, 2026-09-26)

Pictures for the Steam page, as a Pickle pass. Kept here because `Tests/Pickle/` is frozen until the first run
of the settings suite (request `20260926-111909-647-4d36`) is done: a request stages the working tree when it is
played, so anything added there now would change the run under test.

| File | Goes to | State |
|---|---|---|
| `09-publication-shots.feature` | `Tests/Pickle/Mod/Pickle/Features/` | written, never played |
| `GallerySteps.cs` | `Tests/Pickle/Source/` (rebuild the steps DLL) | compiles against the 1.6 reference assemblies; never played |
| `wsl-deps.studio.map` | `Tests/Pickle/` | copied from the other mods' studio pass |

## To do when the tree is free

1. Move the three files, rebuild `AlphaMythologyRenew.PickleSteps.dll`, re-run the step-text check.
2. Add `!09-publication-shots` to the `PLAIN` filter of the ordinary passes (the scenarios are tagged
   `@requires:nelim.pickletools.screenshotstudio` and would show as skipped there, which is fine, but the studio
   pass is the only one that should count them).
3. File one request: `-DepMap wsl-deps.studio.map -Filter '09-publication-shots' -Language English`, evidence in
   `Tests/Pickle/Evidence/studio`.
4. Open every image. Tune the zoom and the offsets (values are guesses). Check that no pawn's tooltip sits on the
   creature, that the interface is really off in scenes 1 to 4 and on in scene 5, and that no developer tool shows.
5. Decide the order and the captions in `PUBLICATION.md`; the first image is the most demonstrative one.
6. Answer the adult-content boxes only after opening these images and the 25 creature textures.

## Why these five

The Preview already shows the griffin and the hound in a stable, so the gallery must not repeat it: a close griffin
(the flagship), a line-up that says "25 creatures" better than a list, the hound and the phoenix as two very
different silhouettes, and the settings window as the one feature this port adds. Not covered: the eggs, the
phoenix death, the wisp reproduction and the optional integrations, which need behaviour to be shown and are not
staged here.

Lessons taken from ContentedLivestock's `16-publication-shots.feature`: names absent from the fixture, letters
dismissed, camera framed by the studio preset before the subject, subject shifted off the screen centre so the
pointer's tooltip does not land on it, presentation mode only where the interface is not the subject.
