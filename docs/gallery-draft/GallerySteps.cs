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
    /// Steps for the Workshop pictures: put this mod's creatures on the photographic colony, frame them, and
    /// select them. DRAFT: not yet in Tests/Pickle/Source, which is frozen until the first run is done.
    /// Built after ContentedLivestock's publication-shots steps and what that session learned: creature names
    /// must not exist in the fixture (the steps take the first pawn of that name, and the zen meadow already
    /// has a macaw called "Clover"), letters have to be dismissed, and after a camera jump the pointer rests at
    /// the screen centre and the game draws the tooltip of whatever is under it.
    /// </summary>
    [PickleSteps]
    public class GallerySteps
    {
        private sealed class Spawned
        {
            public readonly Dictionary<string, Pawn> ByName = new Dictionary<string, Pawn>();
        }

        private static Map Map(PickleContext ctx)
        {
            ctx.Require(Current.Game != null && Find.CurrentMap != null, "no current map: load a fixture first");
            return Find.CurrentMap;
        }

        private static Pawn Creature(PickleContext ctx, string name)
        {
            var spawned = ctx.Get<Spawned>();
            ctx.Require(spawned != null && spawned.ByName.ContainsKey(name), $"no creature named '{name}' was spawned in this scenario");
            var pawn = spawned.ByName[name];
            ctx.Require(pawn.Spawned, $"'{name}' is no longer on the map");
            return pawn;
        }

        [Given("Alpha Mythology Renew spawns the player animal {string} as {string} near x {int} and z {int}")]
        public void SpawnPlayerAnimal(PickleContext ctx, string name, string kindDefName, int x, int z)
        {
            var map = Map(ctx);
            var kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(kindDefName);
            ctx.Require(kind != null, $"no PawnKindDef named '{kindDefName}'");
            ctx.Require(map.mapPawns.AllPawns.All(p => p.LabelShort != name),
                $"a pawn called '{name}' already exists in the fixture: pick a name it does not have");

            var pawn = PawnGenerator.GeneratePawn(new PawnGenerationRequest(kind, Faction.OfPlayer,
                PawnGenerationContext.NonPlayer, -1, forceGenerateNewPawn: true));
            // An adult, so that the picture shows the creature and not a juvenile.
            var lastStage = pawn.RaceProps.lifeStageAges.Last();
            pawn.ageTracker.AgeBiologicalTicks = (long)((lastStage.minAge + 1f) * 3600000f);
            pawn.Name = new NameSingle(name);

            IntVec3 cell;
            var found = CellFinder.TryFindRandomCellNear(new IntVec3(x, 0, z), map, 6,
                c => c.Standable(map) && c.GetFirstPawn(map) == null && c.GetEdifice(map) == null, out cell);
            ctx.Require(found, $"no free cell near {x},{z}");
            GenSpawn.Spawn(pawn, cell, map);

            var spawned = ctx.Get<Spawned>() ?? new Spawned();
            spawned.ByName[name] = pawn;
            ctx.Set(spawned);
        }

        [Then("Alpha Mythology Renew the creature {string} is standing on the map as {string}")]
        public void StandsAs(PickleContext ctx, string name, string kindDefName)
        {
            var pawn = Creature(ctx, name);
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
            var pawn = Creature(ctx, name);
            Find.Selector.ClearSelection();
            Find.Selector.Select(pawn, playSound: false, forceDesignatorDeselect: false);
            var target = pawn.DrawPos + new Vector3(left, 0f, -up);
            Find.CameraDriver.JumpToCurrentMapLoc(target);
            Find.CameraDriver.SetRootSize(zoom);
        }

        [When("Alpha Mythology Renew frames the animal {string} at zoom {float}")]
        public void FrameCentred(PickleContext ctx, string name, float zoom) => Frame(ctx, name, zoom, 0, 0);

        [AfterScenario]
        public void Teardown(PickleContext ctx)
        {
            try
            {
                var spawned = ctx.Get<Spawned>();
                if (spawned == null) return;
                foreach (var pawn in spawned.ByName.Values)
                {
                    if (pawn != null && !pawn.Destroyed) pawn.Destroy();
                }
            }
            catch (Exception e)
            {
                Log.Warning($"[Alpha Mythology Renew tests] gallery creatures could not be removed: {e.Message}");
            }
        }
    }
}
