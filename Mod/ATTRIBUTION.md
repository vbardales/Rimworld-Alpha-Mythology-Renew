# Attribution

Original mod: Alpha Mythology by Sarg Bjornson. Original preview: Oskar Potocki.
Original Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=1821617793
Original source: https://github.com/juanosarg/AlphaMythology

No project licence or explicit republication permission was found. The upstream remake timetable is not used to determine this port's status. The bundled Harmony MIT licence does not apply to Alpha Mythology.

## Original description and sound credits

Adds multiple unique new animals to Rimworld.

<size=24>Features</size>

Adds 25 new creatures to the diverse biomes of your Rimworlds, all of them based on mythological and magical creatures from different ancient cultures and sources. Similar to Alpha Animals, the philosophy of this mod is that every new creature tries to bring some new mechanic into the game, whether it be fire breathing cattle, acid and poison spewing behemoth, or faster than average steed. Some of the mechanics are simple, others much more complex.

Animals will spawn with different rates in different biomes, and should appear at about half the rate as vanilla animals (wolves have been taken as a benchmark, not rats).

Bear in mind that spawn probabilities have been calculated with no other animal mods installed. If you have, for example, Vanilla Animals Expanded, less animals from this mod will appear, obviously.

<size=24>Issues</size>

There shouldn't be any. Balance is obviously always a concern, although it has been playtested. Feel free to tell me if you think something is too wacky.

<size=24>Plans for the future</size>

Obviously, more animals!

<size=24>Compatibility</size>
Compatible with A Dog Said...
Compatible with the implants from Vanilla Genetics Expanded and gene extraction 
Compatible with Alpha Biomes
Compatible with Advanced Biomes
Compatible with Lords of the Rims - Elves (mallorn biome)
Compatible with A RimWorld of Magic (animals drop Raw Magicyte)

<size=24>Credit</size>
Some sounds by Mike Koenig at http://soundbible.com
Some sounds by Stephan Schutze at http://soundbible.com
Fire sound by JaBa at http://soundbible.com/1902-Fire-Burning.html
https://www.freesoundeffects.com/
Horse sounds by soundslikewillem https://freesound.org/people/soundslikewillem/sounds/418428/
"Horse Whinny, Close, A.wav" by InspectorJ (www.jshaw.co.uk) of Freesound.org

<size=24>Changelog</size>

Full changelog on GitHub
	

## Historical Animal Ark port notes

- **The pack's trap, at its largest.** Twenty-five races failed to load entirely, each on a
  `<li Class="AnimalBehaviours.*">` that 1.6 no longer resolves. An unresolved class takes the
  whole def down with it, hence twenty-five `Config error: no race` behind the load exceptions.
- **But the rename does not apply to everything.** The mod declares **its own** classes in the
  `AnimalBehaviours` namespace — the very one VEF used to occupy — so renaming blindly breaks
  them just as surely as doing nothing. The three that matter are reimplemented in
  `AnimalArk.dll` under `Bastyon.*` rather than shipping a DLL compiled for 1.5:
  `DeathActionWorker_ExplodeAndSpawnEggs` (the phoenix explodes and leaves an egg),
  `Hediff_BleedingWound` and `Recipe_ShutDown` (unplug a mechanical beast). A fourth,
  `MMToggleableSpawnDef`, only served the original mod's settings window and is not carried
  over.
- **Texture collision with Steve's Animals**: both mods ship a different
  `Things/Projectiles/Proj_FireStream` for their flame breath, and whichever loaded last
  overwrote the other. Alpha Mythology's is isolated under `AM_FireStream`.
- **The achievements were declared, not patched.** The mod's nine `AchievementsExpanded` defs
  came across as a plain `Defs` file, so RimWorld tried to resolve a type owned by Vanilla
  Achievements Expanded whether or not that mod was loaded, and logged an unknown def type for
  each. Moved into `Patches/AlphaMythology/AchievementsPatch.xml` behind the same
  `PatchOperationFindMod` the Steve's Animals achievements use. Patches run before inheritance
  is resolved, so the abstract `MM_AchievementParent` and its `ParentName` children still work
  inside the patch.
- `hideAtSnowDepth` no longer exists on `ThingDef`.
- Two think trees, `VEF_AnimalHarvester` and `VEF_AnimalHarvesterConstant`, were reported
  missing by the validator but exist in VEF 1.6. The validator was reading only the game and
  the mod, never the dependencies — hence its `-AlsoScan` option.
- **It stays, and the split prepared for it was dropped on 2026-09-12.** Its author answers the 1.6
  question on the Workshop page with *This mod is scheduled for a future remake*, with a further comment on 29 August saying the work will take a long time. A mod whose author has said he is coming back to it is a live mod, whatever version
  its `About.xml` declares, and this pack does not republish live mods.


These historical notes predate the user's decision to extract this unofficial continuation. Alpha has now left Animal Ark. Port and extraction: nelim, assisted by OpenAI Codex.

