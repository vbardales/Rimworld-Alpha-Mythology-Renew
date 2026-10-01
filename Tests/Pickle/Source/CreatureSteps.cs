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
    /// The behaviour of the creatures themselves, which the functional scenarios F01 to F04 asked for by hand: every
    /// creature spawning at every life stage and drawing, the phoenix leaving its egg in the flames, the egg commands, and
    /// the recurring bleeding wound. The pure numbers (explosion radius by life stage, the one-or-two egg roll) are proved
    /// out of the game by Tests/UnitTests; what is here is what needs a map, a corpse, a hatcher or a ticking pawn.
    /// </summary>
    [PickleSteps]
    public class CreatureSteps
    {
        private const string OpenWoundDefName = "MM_OpenWound";

        private sealed class Batch
        {
            public readonly List<KeyValuePair<Pawn, int>> Pawns = new List<KeyValuePair<Pawn, int>>();
            public readonly List<Thing> Things = new List<Thing>();
        }

        private sealed class WoundRecord
        {
            public float Severity;
        }

        internal static T TryGet<T>(PickleContext ctx) where T : class
        {
            try { return ctx.Get<T>(); } catch (Exception) { return null; }
        }

        private static Batch BatchOf(PickleContext ctx)
        {
            var batch = TryGet<Batch>(ctx);
            if (batch == null)
            {
                batch = new Batch();
                ctx.Set(batch);
            }
            return batch;
        }

        internal static Map Map(PickleContext ctx)
        {
            ctx.Require(Current.Game != null && Find.CurrentMap != null, "no current map: load a fixture first");
            return Find.CurrentMap;
        }

        internal static IntVec3 FreeCell(PickleContext ctx, int radius = 40)
        {
            var map = Map(ctx);
            IntVec3 cell;
            var found = CellFinder.TryFindRandomCellNear(map.Center, map, radius,
                c => c.Standable(map) && c.GetFirstPawn(map) == null && c.GetEdifice(map) == null
                     && !c.GetThingList(map).Any(t => t.def.category == ThingCategory.Item), out cell);
            ctx.Require(found, "no free standable cell near the map centre");
            return cell;
        }

        internal static Pawn SpawnAtStage(PickleContext ctx, PawnKindDef kind, int stage, IntVec3 cell, Gender? gender = null)
        {
            var pawn = PawnGenerator.GeneratePawn(new PawnGenerationRequest(kind, Faction.OfPlayer,
                PawnGenerationContext.NonPlayer, -1, forceGenerateNewPawn: true, fixedGender: gender));
            var stages = pawn.RaceProps.lifeStageAges;
            ctx.Require(stage >= 0 && stage < stages.Count, $"'{kind.defName}' has no life stage {stage} (it has {stages.Count})");
            long ticks = (long)(stages[stage].minAge * 3600000f) + 3600000L / 10;
            pawn.ageTracker.AgeBiologicalTicks = ticks;
            pawn.ageTracker.AgeChronologicalTicks = ticks;
            GenSpawn.Spawn(pawn, cell, Map(ctx));
            BatchOf(ctx).Pawns.Add(new KeyValuePair<Pawn, int>(pawn, stage));
            return pawn;
        }

        internal static PawnKindDef Kind(PickleContext ctx, string defName)
        {
            var kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(defName);
            ctx.Require(kind != null, $"no PawnKindDef named '{defName}'");
            return kind;
        }

        private static int EggCountNear(Map map, ThingDef egg, IntVec3 centre, float radius)
        {
            return map.listerThings.ThingsOfDef(egg)
                .Where(t => t.Spawned && t.Position.DistanceTo(centre) <= radius).Sum(t => t.stackCount);
        }

        // --- F01: every creature, every life stage --------------------------------------------

        [When("Alpha Mythology Renew spawns every creature of this mod at every life stage")]
        public void SpawnEverything(PickleContext ctx)
        {
            foreach (var kind in AlphaMythologyRenewMod.OwnKinds())
            {
                int stages = kind.RaceProps.lifeStageAges.Count;
                for (int s = 0; s < stages; s++)
                {
                    // A creature that ships separate female graphics is spawned in both genders, so that the female textures
                    // are drawn too and not only whichever gender the generator happened to pick.
                    bool hasFemaleLook = s < kind.lifeStages.Count && kind.lifeStages[s].femaleGraphicData != null;
                    if (hasFemaleLook)
                    {
                        SpawnAtStage(ctx, kind, s, FreeCell(ctx), Gender.Male);
                        SpawnAtStage(ctx, kind, s, FreeCell(ctx), Gender.Female);
                    }
                    else
                    {
                        SpawnAtStage(ctx, kind, s, FreeCell(ctx));
                    }
                }
            }
        }

        [Then("Alpha Mythology Renew all {int} creatures are on the map and each draws its four facings and its dessicated body")]
        public void DrawEverything(PickleContext ctx, int expectedKinds)
        {
            var pawns = BatchOf(ctx).Pawns;
            var kinds = pawns.Select(p => p.Key.kindDef.defName).Distinct().ToList();
            ctx.Assert(kinds.Count == expectedKinds, $"{kinds.Count} kinds were spawned, expected {expectedKinds}");
            var failures = new List<string>();
            foreach (var entry in pawns)
            {
                var pawn = entry.Key;
                // The creature may already have aged into the next stage while the others were spawned (the first stage of
                // the fenghuang, the kitsune and the Stymphalian bird is a few ticks long): what is under test is the graphic of
                // the stage that was asked for, so that stage is read from the kind and not from the pawn's current age.
                int stage = entry.Value;
                if (stage >= pawn.kindDef.lifeStages.Count)
                {
                    failures.Add($"{pawn.kindDef.defName}: asked for life stage {stage}, the kind has {pawn.kindDef.lifeStages.Count}");
                    continue;
                }
                var lifeStage = pawn.kindDef.lifeStages[stage];
                bool female = pawn.gender == Gender.Female && lifeStage.femaleGraphicData != null;
                var data = female ? lifeStage.femaleGraphicData : lifeStage.bodyGraphicData;
                if (data == null) { failures.Add($"{pawn.kindDef.defName} stage {stage}: no body graphic data"); continue; }
                string look = female ? " (female)" : "";
                var graphic = data.GraphicColoredFor(pawn);
                foreach (var rot in new[] { Rot4.North, Rot4.East, Rot4.South, Rot4.West })
                {
                    var mat = graphic.MatAt(rot, pawn);
                    if (mat == null || mat == BaseContent.BadMat)
                    {
                        failures.Add($"{pawn.kindDef.defName} stage {stage}{look}: no material facing {rot}");
                    }
                }
                var dessicated = female && lifeStage.femaleDessicatedBodyGraphicData != null
                    ? lifeStage.femaleDessicatedBodyGraphicData : lifeStage.dessicatedBodyGraphicData;
                if (dessicated != null)
                {
                    var mat = dessicated.GraphicColoredFor(pawn).MatAt(Rot4.East, pawn);
                    if (mat == null || mat == BaseContent.BadMat)
                    {
                        failures.Add($"{pawn.kindDef.defName} stage {stage}{look}: no dessicated material");
                    }
                }
            }
            ctx.Assert(failures.Count == 0, $"{failures.Count} problems: " + string.Join("; ", failures.Take(12).ToArray()));
        }

        // --- F02: the phoenix's death ---------------------------------------------------------

        [Then("Alpha Mythology Renew {int} phoenixes of life stage {int} die and each death leaves one or two fertilized eggs, both counts being seen")]
        public void PhoenixDeaths(PickleContext ctx, int trials, int stage)
        {
            var map = Map(ctx);
            var kind = Kind(ctx, "MM_Phoenix");
            var eggDef = DefDatabase<ThingDef>.GetNamedSilentFail(PhoenixRules.EggDefName);
            ctx.Require(eggDef != null, $"no ThingDef named '{PhoenixRules.EggDefName}'");
            int ones = 0, twos = 0;
            var odd = new List<string>();
            for (int i = 0; i < trials; i++)
            {
                var cell = FreeCell(ctx);
                int before = EggCountNear(map, eggDef, cell, 12f);
                var phoenix = SpawnAtStage(ctx, kind, stage, cell);
                phoenix.Kill(null);
                int laid = EggCountNear(map, eggDef, cell, 12f) - before;
                if (laid == 1) ones++; else if (laid == 2) twos++; else odd.Add($"trial {i}: {laid} eggs");
                // Clear the scene so that the next trial counts only its own eggs.
                foreach (var thing in map.listerThings.ThingsOfDef(eggDef).Where(t => t.Position.DistanceTo(cell) <= 12f).ToList())
                {
                    thing.Destroy();
                }
                foreach (var corpse in map.listerThings.ThingsInGroup(ThingRequestGroup.Corpse).Where(c => c.Position.DistanceTo(cell) <= 12f).ToList())
                {
                    corpse.Destroy();
                }
                // The explosion lights fires that would otherwise spread over 40 trials and burn the base of the fixture.
                foreach (var fire in map.listerThings.ThingsOfDef(ThingDefOf.Fire).Where(f => f.Position.DistanceTo(cell) <= 20f).ToList())
                {
                    fire.Destroy();
                }
            }
            ctx.Assert(odd.Count == 0, "a death left neither one nor two eggs: " + string.Join("; ", odd.Take(5).ToArray()));
            ctx.Assert(ones > 0 && twos > 0, $"over {trials} deaths at stage {stage} one egg was seen {ones} times and two eggs {twos} times: both were expected");
        }

        [Then("Alpha Mythology Renew a phoenix dying on a tile that already holds an egg still leaves its own egg")]
        public void CrowdedTile(PickleContext ctx)
        {
            var map = Map(ctx);
            var eggDef = DefDatabase<ThingDef>.GetNamedSilentFail(PhoenixRules.EggDefName);
            ctx.Require(eggDef != null, $"no ThingDef named '{PhoenixRules.EggDefName}'");
            var cell = FreeCell(ctx);
            var old = ThingMaker.MakeThing(eggDef);
            GenSpawn.Spawn(old, cell, map);
            int oldBefore = old.stackCount;
            BatchOf(ctx).Things.Add(old);
            var phoenix = SpawnAtStage(ctx, Kind(ctx, "MM_Phoenix"), 2, cell);
            phoenix.Kill(null);
            // The phoenix's own egg must survive, whether it merged into the stack on the tile or was placed beside it. The egg
            // that was already there is not the parent's to protect: whether it survived is reported, not asserted.
            int total = EggCountNear(map, eggDef, cell, 12f);
            // The old egg's stack may have absorbed the new one: what counts is what lies there beyond the old egg as it was.
            int own = total - (old.Destroyed ? 0 : oldBefore);
            ctx.Assert(own >= 1, $"the phoenix's own egg was lost: {total} egg(s) within 12 cells, the old one held {oldBefore} (destroyed: {old.Destroyed})");
        }

        [Then("Alpha Mythology Renew a fertilized phoenix egg hatches into a phoenix when its incubation completes")]
        public void EggHatches(PickleContext ctx)
        {
            var map = Map(ctx);
            var eggDef = DefDatabase<ThingDef>.GetNamedSilentFail(PhoenixRules.EggDefName);
            ctx.Require(eggDef != null, $"no ThingDef named '{PhoenixRules.EggDefName}'");
            var egg = ThingMaker.MakeThing(eggDef);
            GenSpawn.Spawn(egg, FreeCell(ctx), map);
            var hatcher = egg.TryGetComp<CompHatcher>();
            ctx.Require(hatcher != null, "the fertilized phoenix egg carries no CompHatcher");
            int before = map.mapPawns.AllPawns.Count(p => p.kindDef.defName == "MM_Phoenix");
            hatcher.Hatch();
            var hatched = map.mapPawns.AllPawns.Where(p => p.kindDef.defName == "MM_Phoenix").ToList();
            ctx.Assert(hatched.Count == before + 1, $"{hatched.Count - before} phoenixes hatched, expected exactly one");
            ctx.Assert(egg.Destroyed, "the egg is still there after hatching");
            foreach (var pawn in hatched) BatchOf(ctx).Pawns.Add(new KeyValuePair<Pawn, int>(pawn, pawn.ageTracker.CurLifeStageIndex));
        }

        // --- F03: the egg commands ------------------------------------------------------------

        internal static Command FindCommand(Thing thing, string key)
        {
            var label = key.Translate().ToString();
            return thing.GetGizmos().OfType<Command>().FirstOrDefault(c => c.defaultLabel == label);
        }

        [Then("Alpha Mythology Renew a fertilized phoenix egg offers destroy and cancel commands whose labels and icons resolve in the language of this pass")]
        public void EggCommands(PickleContext ctx)
        {
            var map = Map(ctx);
            var eggDef = DefDatabase<ThingDef>.GetNamedSilentFail(PhoenixRules.EggDefName);
            ctx.Require(eggDef != null, $"no ThingDef named '{PhoenixRules.EggDefName}'");
            var egg = ThingMaker.MakeThing(eggDef);
            GenSpawn.Spawn(egg, FreeCell(ctx), map);
            BatchOf(ctx).Things.Add(egg);

            var destroy = FindCommand(egg, "MM_DestroyEggsLabel");
            ctx.Require(destroy != null, "the egg offers no command labelled 'MM_DestroyEggsLabel'.Translate(); it shows: "
                + string.Join(", ", egg.GetGizmos().OfType<Command>().Select(c => c.defaultLabel).ToArray()));
            ctx.Assert(destroy.icon != null && destroy.icon != BaseContent.BadTex, "the destroy command's icon does not resolve");
            ctx.Assert(!destroy.defaultLabel.Contains("MM_") && !destroy.defaultDesc.Contains("MM_"), "a raw key shows in the destroy command");

            (destroy as Command_Action)?.action();
            var cancel = FindCommand(egg, "MM_CancelDestroyEggsLabel");
            ctx.Assert(cancel != null, "after requesting destruction the egg offers no cancel command");
            if (cancel == null) return;
            ctx.Assert(cancel.icon != null && cancel.icon != BaseContent.BadTex, "the cancel command's icon does not resolve");
            (cancel as Command_Action)?.action();
            ctx.Assert(FindCommand(egg, "MM_DestroyEggsLabel") != null, "after cancelling, the destroy command is not offered again");
            ctx.Assert(!egg.Destroyed, "cancelling left the egg destroyed");
        }

        // --- F04: the recurring bleeding wound ------------------------------------------------

        internal static Pawn Live(PickleContext ctx, string name)
        {
            var pawn = Map(ctx).mapPawns.AllPawns.FirstOrDefault(p => p.LabelShort == name);
            ctx.Require(pawn != null, $"no living pawn named '{name}'");
            return pawn;
        }

        private static float OpenWoundSeverity(Pawn pawn)
        {
            return pawn.health.hediffSet.hediffs.Where(h => h.def.defName == OpenWoundDefName).Sum(h => h.Severity);
        }

        [Given("Alpha Mythology Renew spawns the adult creature {string} named {string} for the bleeding tests")]
        public void SpawnTank(PickleContext ctx, string kindDefName, string name)
        {
            var kind = Kind(ctx, kindDefName);
            var pawn = SpawnAtStage(ctx, kind, kind.RaceProps.lifeStageAges.Count - 1, FreeCell(ctx));
            pawn.Name = new NameSingle(name);
        }

        [When("Alpha Mythology Renew gives the bleeding wound to {string}")]
        public void GiveWound(PickleContext ctx, string name)
        {
            var pawn = Live(ctx, name);
            var def = DefDatabase<HediffDef>.GetNamedSilentFail("MM_BleedingWound");
            ctx.Require(def != null, "no HediffDef named 'MM_BleedingWound'");
            pawn.health.AddHediff(HediffMaker.MakeHediff(def, pawn));
        }

        [When("Alpha Mythology Renew removes the bleeding wound from {string}")]
        public void RemoveWound(PickleContext ctx, string name)
        {
            var pawn = Live(ctx, name);
            var wound = pawn.health.hediffSet.hediffs.FirstOrDefault(h => h.def.defName == "MM_BleedingWound");
            ctx.Require(wound != null, $"'{name}' carries no bleeding wound to remove");
            pawn.health.RemoveHediff(wound);
        }

        [Then("Alpha Mythology Renew {string} still carries the bleeding wound")]
        public void StillCarries(PickleContext ctx, string name)
        {
            // Looked up by name on the reloaded map: references taken before a save and reload are stale.
            var pawn = Live(ctx, name);
            var wound = pawn.health.hediffSet.hediffs.FirstOrDefault(h => h.def.defName == "MM_BleedingWound");
            ctx.Assert(wound != null, $"'{name}' no longer carries the bleeding wound after the save and reload");
            ctx.Assert(wound is Hediff_BleedingWound, $"the wound came back as a {wound?.GetType().Name}, not this mod's Hediff_BleedingWound");
        }

        [When("Alpha Mythology Renew records the open wound severity of {string}")]
        public void RecordSeverity(PickleContext ctx, string name)
        {
            ctx.Set(new WoundRecord { Severity = OpenWoundSeverity(Live(ctx, name)) });
        }

        [Then("Alpha Mythology Renew the open wound severity of {string} has grown since it was recorded")]
        public void SeverityGrew(PickleContext ctx, string name)
        {
            var before = TryGet<WoundRecord>(ctx);
            ctx.Require(before != null, "no severity was recorded in this scenario");
            var now = OpenWoundSeverity(Live(ctx, name));
            ctx.Assert(now > before.Severity + 0.5f, $"open wound severity went from {before.Severity} to {now}: no recurring damage was seen");
        }

        [Then("Alpha Mythology Renew the open wound severity of {string} has not grown since it was recorded")]
        public void SeverityFlat(PickleContext ctx, string name)
        {
            var before = TryGet<WoundRecord>(ctx);
            ctx.Require(before != null, "no severity was recorded in this scenario");
            var now = OpenWoundSeverity(Live(ctx, name));
            ctx.Assert(now <= before.Severity + 0.05f, $"open wound severity went from {before.Severity} to {now}: damage continued after the hediff was removed");
        }

        // --- teardown ---------------------------------------------------------------------------

        [AfterScenario]
        public void Teardown(PickleContext ctx)
        {
            try
            {
                var batch = TryGet<Batch>(ctx);
                if (batch == null) return;
                foreach (var entry in batch.Pawns)
                {
                    // After a save and reload the recorded objects belong to the game that was replaced: destroying them
                    // could touch the new game's registries. Only what still stands on the current map is ours to remove.
                    if (entry.Key != null && !entry.Key.Destroyed && entry.Key.Spawned && entry.Key.Map == Find.CurrentMap) entry.Key.Destroy();
                }
                foreach (var thing in batch.Things)
                {
                    if (thing != null && !thing.Destroyed && thing.Spawned && thing.Map == Find.CurrentMap) thing.Destroy();
                }
            }
            catch (Exception e)
            {
                Log.Warning($"[Alpha Mythology Renew tests] creatures of the scenario could not be removed: {e.Message}");
            }
        }
    }
}
