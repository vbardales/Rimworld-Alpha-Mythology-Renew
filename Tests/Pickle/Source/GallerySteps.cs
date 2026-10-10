using System;
using System.Collections.Generic;
using System.Linq;
using RimWorld;
using RimWorks.Pickle;
using UnityEngine;
using Verse;

namespace AlphaMythologyRenew.PickleSteps
{
    /// <summary>
    /// Steps for the Workshop pictures: check this mod's creatures (spawned by PickleTools' own animal steps on the sanctuary), frame them,
    /// and select them.
    /// Built after ContentedLivestock's publication-shots steps and what that session learned: creature names
    /// must not exist in the fixture (the steps take the first pawn of that name, and the zen meadow already
    /// has a macaw called "Clover"), letters have to be dismissed, and after a camera jump the pointer rests at
    /// the screen centre and the game draws the tooltip of whatever is under it.
    /// </summary>
    [PickleSteps]
    public class GallerySteps
    {
        [Given("Alpha Mythology Renew spawns the player animal {string} as {string} near x {int} and z {int}")]
        public void SpawnPlayerAnimal(PickleContext ctx, string name, string kindDefName, int x, int z)
        {
            var map = CreatureSteps.Map(ctx);
            var kind = CreatureSteps.Kind(ctx, kindDefName);
            ctx.Require(map.mapPawns.AllPawns.All(p => p.LabelShort != name),
                $"a pawn called '{name}' already exists in the fixture: pick a name it does not have");

            // Coordinates come from the studio fixture; on another map they may lie outside it: use the centre then.
            var origin = new IntVec3(x, 0, z);
            if (!origin.InBounds(map)) origin = map.Center;
            IntVec3 cell;
            var found = CellFinder.TryFindRandomCellNear(origin, map, 6,
                c => c.Standable(map) && c.GetFirstPawn(map) == null && c.GetEdifice(map) == null, out cell);
            ctx.Require(found, $"no free cell near {x},{z}");
            // An adult, so that the picture shows the creature and not a juvenile. CreatureSteps records it for the teardown.
            var pawn = CreatureSteps.SpawnAtStage(ctx, kind, kind.RaceProps.lifeStageAges.Count - 1, cell);
            pawn.Name = new NameSingle(name);
            // GenSpawn.Spawn places a thing facing north (its back to the camera) and a paused game never turns it: every
            // picture of studio pass 2a77 showed the creature from behind. South is the front view.
            pawn.Rotation = Rot4.South;
        }
        [Then("Alpha Mythology Renew the creature {string} is standing on the map as {string}")]
        public void StandsAs(PickleContext ctx, string name, string kindDefName)
        {
            var pawn = CreatureSteps.Live(ctx, name);
            ctx.Assert(pawn.kindDef.defName == kindDefName,
                $"'{name}' is a {pawn.kindDef.defName}, expected {kindDefName}");
            ctx.Assert(pawn.Faction == Faction.OfPlayer, $"'{name}' does not belong to the player");
        }

        [When("Alpha Mythology Renew dismisses every letter")]
        public void DismissLetters(PickleContext ctx)
        {
            foreach (var letter in Find.LetterStack.LettersListForReading.ToList())
            {
                Find.LetterStack.RemoveLetter(letter);
            }
        }

        /// <summary>
        /// Selects the creature and puts the camera on it at the given zoom, shifted so that it is not under the
        /// pointer, which rests at the screen centre after a jump (the tooltip of what is there would be drawn).
        /// </summary>
        [When("Alpha Mythology Renew frames the animal {string} at zoom {float}, shown {int} cells left and {int} cells up")]
        public void Frame(PickleContext ctx, string name, float zoom, int left, int up)
        {
            var pawn = CreatureSteps.Live(ctx, name);
            // The spawn step sets Rot4.South too, but the wait between spawn and this framing lets the
            // pawn's own AI re-face it (wander/idle jobs), so studio7 still showed several creatures from
            // behind despite that earlier fix. Set it again here, last, right before the capture.
            pawn.Rotation = Rot4.South;
            Find.Selector.ClearSelection();
            Find.Selector.Select(pawn, playSound: false, forceDesignatorDeselect: false);
            var target = pawn.DrawPos + new Vector3(left, 0f, -up);
            Find.CameraDriver.JumpToCurrentMapLoc(target);
            // The camera clamps its size to config.sizeRange (a floor near 7-8 in this build: a request for 4 gave the
            // same picture as 7, studio pass c928). The range is a public field: lower its floor to what was asked
            // for, so a close-up can be closer than the game lets a player zoom.
            var config = Find.CameraDriver.config;
            if (config != null && zoom < config.sizeRange.min)
            {
                config.sizeRange = new FloatRange(zoom, config.sizeRange.max);
            }
            Find.CameraDriver.SetRootSize(zoom);
        }
    }
}
