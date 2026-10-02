using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using RimWorld;
using RimWorks.Pickle;
using UnityEngine;
using Verse;
using Verse.AI;

namespace AlphaMythologyRenew.PickleSteps
{
    /// <summary>
    /// F06 to F12 of Tests/FUNCTIONAL.md, the scenarios that were left to a person: the ranged attacks, the products,
    /// the Kitsune's regeneration, the dead plants, the tlilcoatl's damage and the kappa's harvest. Each is a start step,
    /// a wait made in the feature (`I wait N ticks`, which keeps the tick loop running) and a check step. The framework
    /// pieces (VEF's projectiles, its regeneration comp) are exercised through the port's own definitions: the port owns
    /// their wiring, and a wiring error is its defect.
    /// </summary>
    [PickleSteps]
    public class ActionSteps
    {
        private sealed class HurtRecord
        {
            public readonly Dictionary<string, int> Hediffs = new Dictionary<string, int>();
            public readonly Dictionary<string, float> Values = new Dictionary<string, float>();
        }

        private static HurtRecord Record(PickleContext ctx)
        {
            var record = CreatureSteps.TryGet<HurtRecord>(ctx);
            if (record == null) { record = new HurtRecord(); ctx.Set(record); }
            return record;
        }

        private static int HediffCount(Pawn pawn) => pawn.health.hediffSet.hediffs.Count;

        private static float InjurySeverity(Pawn pawn)
        {
            return pawn.health.hediffSet.hediffs.OfType<Hediff_Injury>().Sum(h => h.Severity);
        }

        /// <summary>A standable cell in line of sight of the origin at about the given distance.</summary>
        private static IntVec3 CellAtDistance(PickleContext ctx, IntVec3 origin, int distance)
        {
            var map = CreatureSteps.Map(ctx);
            // Any cell of the ring around the origin, nearest to the wanted distance first: the four straight lines alone can
            // all be blocked by a wall or a tree in the fixture.
            var candidates = GenRadial.RadialCellsAround(origin, distance + 2f, true)
                .Where(c => c.DistanceTo(origin) >= distance - 1f)
                .OrderBy(c => System.Math.Abs(c.DistanceTo(origin) - distance));
            foreach (var cell in candidates)
            {
                if (cell.InBounds(map) && cell.Standable(map) && cell.GetFirstPawn(map) == null
                    && GenSight.LineOfSight(origin, cell, map))
                {
                    return cell;
                }
            }
            ctx.Require(false, $"no free cell {distance} cells from {origin} with a line of sight");
            return origin;
        }

        private static Pawn SpawnTarget(PickleContext ctx, string kindDefName, string name, Pawn near, int distance, bool colonist)
        {
            var map = CreatureSteps.Map(ctx);
            PawnKindDef kind = colonist ? PawnKindDefOf.Colonist : CreatureSteps.Kind(ctx, kindDefName);
            var pawn = PawnGenerator.GeneratePawn(new PawnGenerationRequest(kind, colonist ? Faction.OfPlayer : null,
                PawnGenerationContext.NonPlayer, -1, forceGenerateNewPawn: true));
            pawn.Name = new NameSingle(name);
            GenSpawn.Spawn(pawn, CellAtDistance(ctx, near.Position, distance), map);
            TargetsToClean(ctx).Add(pawn);
            return pawn;
        }

        private static List<Pawn> TargetsToClean(PickleContext ctx)
        {
            var list = CreatureSteps.TryGet<TargetList>(ctx);
            if (list == null) { list = new TargetList(); ctx.Set(list); }
            return list.Pawns;
        }

        private sealed class TargetList { public readonly List<Pawn> Pawns = new List<Pawn>(); }

        // --- F06 and F09: ranged attacks ------------------------------------------------------

        [Given("Alpha Mythology Renew spawns the tamed adult {string} named {string} for the combat tests")]
        public void SpawnShooter(PickleContext ctx, string kindDefName, string name)
        {
            var kind = CreatureSteps.Kind(ctx, kindDefName);
            var pawn = CreatureSteps.SpawnAtStage(ctx, kind, kind.RaceProps.lifeStageAges.Count - 1, CreatureSteps.FreeCell(ctx));
            pawn.Name = new NameSingle(name);
        }

        [Given("Alpha Mythology Renew spawns the target {string} of kind {string} {int} cells from {string}")]
        public void SpawnAnimalTarget(PickleContext ctx, string name, string kindDefName, int distance, string shooter)
        {
            SpawnTarget(ctx, kindDefName, name, CreatureSteps.Live(ctx, shooter), distance, false);
        }

        [Given("Alpha Mythology Renew spawns the colonist target {string} {int} cells from {string}")]
        public void SpawnColonistTarget(PickleContext ctx, string name, int distance, string shooter)
        {
            SpawnTarget(ctx, null, name, CreatureSteps.Live(ctx, shooter), distance, true);
        }

        [Given("Alpha Mythology Renew gives a shield belt to {string}")]
        public void GiveShieldBelt(PickleContext ctx, string name)
        {
            var pawn = CreatureSteps.Live(ctx, name);
            var belt = (Apparel)ThingMaker.MakeThing(ThingDefOf.Apparel_ShieldBelt);
            pawn.apparel.Wear(belt, false);
            ctx.Require(pawn.apparel.WornApparel.Contains(belt), $"'{name}' does not wear the shield belt");
        }

        [Given("Alpha Mythology Renew records the injury severity and the condition count of {string}")]
        public void RecordHurt(PickleContext ctx, string name)
        {
            var pawn = CreatureSteps.Live(ctx, name);
            var record = Record(ctx);
            record.Hediffs[name] = HediffCount(pawn);
            record.Values[name] = InjurySeverity(pawn);
        }

        [When("Alpha Mythology Renew {string} fires its first ranged attack at {string}")]
        public void Fire(PickleContext ctx, string shooter, string target)
        {
            var pawn = CreatureSteps.Live(ctx, shooter);
            var victim = CreatureSteps.Live(ctx, target);
            var verb = pawn.VerbTracker.AllVerbs.FirstOrDefault(v => v.verbProps.range > 2f && v.verbProps.defaultProjectile != null);
            ctx.Require(verb != null, $"'{shooter}' ({pawn.kindDef.defName}) has no ranged verb with a projectile");
            var record = Record(ctx);
            if (!record.Hediffs.ContainsKey(target))
            {
                record.Hediffs[target] = HediffCount(victim);
                record.Values[target] = InjurySeverity(victim);
            }
            ctx.Assert(verb.TryStartCastOn(new LocalTargetInfo(victim)),
                $"'{shooter}' cannot start its '{verb.verbProps.label}' attack on '{target}' ({verb.verbProps.defaultProjectile.defName})");
        }

        /// <summary>
        /// Second volley, for a projectile that missed. Nothing to do when the first one already did its work (the
        /// target is dead or changed: fix-en 4c41, the hydra killed it and the next lookup found no living pawn), and a
        /// verb still cooling down is not a defect here: the first volley is the one that must start.
        /// </summary>
        [When("Alpha Mythology Renew {string} fires again at {string} if it is not yet affected")]
        public void FireAgain(PickleContext ctx, string shooter, string target)
        {
            var victim = CreatureSteps.TryGet<TargetList>(ctx)?.Pawns.FirstOrDefault(p => p.LabelShort == target);
            var record = Record(ctx);
            ctx.Require(victim != null && record.Hediffs.ContainsKey(target), $"no state was recorded for '{target}'");
            bool changed = victim.Dead || victim.Destroyed || HediffCount(victim) > record.Hediffs[target] || InjurySeverity(victim) > record.Values[target] + 0.01f;
            if (changed) return;
            var pawn = CreatureSteps.Live(ctx, shooter);
            var verb = pawn.VerbTracker.AllVerbs.FirstOrDefault(v => v.verbProps.range > 2f && v.verbProps.defaultProjectile != null);
            ctx.Require(verb != null, $"'{shooter}' has no ranged verb with a projectile");
            verb.TryStartCastOn(new LocalTargetInfo(victim));
        }

        [Then("Alpha Mythology Renew {string} has been hurt or otherwise affected by the attack")]
        public void WasAffected(PickleContext ctx, string target)
        {
            // A target the attack killed is no longer among the map's living pawns: it is found among the ones this suite spawned.
            var victim = CreatureSteps.TryGet<TargetList>(ctx)?.Pawns.FirstOrDefault(p => p.LabelShort == target) ?? CreatureSteps.Live(ctx, target);
            var record = Record(ctx);
            ctx.Require(record.Hediffs.ContainsKey(target), $"no state was recorded for '{target}'");
            bool changed = victim.Dead || HediffCount(victim) > record.Hediffs[target] || InjurySeverity(victim) > record.Values[target] + 0.01f;
            ctx.Assert(changed, $"'{target}' shows no injury or new condition after the attack (conditions {record.Hediffs[target]} -> {HediffCount(victim)})");
        }

        [Then("Alpha Mythology Renew {string} has no toxic buildup")]
        public void NoToxicBuildup(PickleContext ctx, string target)
        {
            var victim = CreatureSteps.Live(ctx, target);
            var buildup = victim.health.hediffSet.hediffs.Where(h => h.def == HediffDefOf.ToxicBuildup).ToList();
            ctx.Assert(buildup.Count == 0, $"'{target}' carries toxic buildup at severity {buildup.Sum(h => h.Severity)}");
        }

        [Then("Alpha Mythology Renew the shield belt of {string} took the attack or the wearer was hurt")]
        public void ShieldInteracted(PickleContext ctx, string target)
        {
            var victim = CreatureSteps.Live(ctx, target);
            var belt = victim.apparel.WornApparel.FirstOrDefault(a => a.def == ThingDefOf.Apparel_ShieldBelt);
            ctx.Require(belt != null, $"'{target}' does not wear a shield belt");
            var record = Record(ctx);
            // In 1.6 the belt is an ordinary apparel with a CompShield (there is no ShieldBelt class any more). Its energy is not
            // public API: read the property or the field by reflection, on the comp.
            var shield = belt.AllComps.FirstOrDefault(c => c.GetType().Name == "CompShield");
            ctx.Require(shield != null, "the shield belt carries no CompShield in this game build");
            var flags = BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public;
            var property = shield.GetType().GetProperty("Energy", flags);
            var field = shield.GetType().GetField("energy", flags);
            ctx.Require(property != null || field != null, "CompShield exposes neither an 'Energy' property nor an 'energy' field in this game build");
            float energy = property != null ? (float)property.GetValue(shield, null) : (float)field.GetValue(shield);
            float max = belt.GetStatValue(StatDefOf.EnergyShieldEnergyMax);
            bool hurt = InjurySeverity(victim) > record.Values[target] + 0.01f;
            ctx.Assert(energy < max - 0.01f || hurt,
                $"neither the shield ({energy} of {max}) nor the wearer's health reacted to the attack");
        }

        // --- F03: the destruction of an egg, end to end through VEF ---------------------------

        private sealed class EggRecord
        {
            public Thing Egg;
            public int PhoenixesBefore;
        }

    internal class DestroyWatch { public Pawn Colonist; }

        private static EggRecord TheEgg(PickleContext ctx)
        {
            var record = CreatureSteps.TryGet<EggRecord>(ctx);
            ctx.Require(record != null && record.Egg != null, "no egg was spawned in this scenario");
            ctx.Require(!record.Egg.Destroyed, "the egg is already gone");
            return record;
        }

        [Given("Alpha Mythology Renew spawns a fertilized phoenix egg for the destruction tests")]
        public void SpawnEgg(PickleContext ctx)
        {
            var map = CreatureSteps.Map(ctx);
            var def = DefDatabase<ThingDef>.GetNamedSilentFail(PhoenixRules.EggDefName);
            ctx.Require(def != null, $"no ThingDef named '{PhoenixRules.EggDefName}'");
            var egg = ThingMaker.MakeThing(def);
            // No SetFaction: an egg thing cannot take a faction and the game logs an error (run a022).
            GenSpawn.Spawn(egg, CreatureSteps.FreeCell(ctx), map);
            ctx.Set(new EggRecord { Egg = egg, PhoenixesBefore = map.mapPawns.AllPawns.Count(p => p.kindDef.defName == "MM_Phoenix") });
        }

        private static void Press(PickleContext ctx, string key)
        {
            var egg = TheEgg(ctx).Egg;
            var command = CreatureSteps.FindCommand(egg, key);
            ctx.Require(command != null, $"the egg offers no command labelled '{key}'.Translate()");
            var action = command as Command_Action;
            ctx.Require(action != null, $"the command '{key}' is a {command.GetType().Name}, not a Command_Action");
            action.action();
        }

        [When("Alpha Mythology Renew requests the destruction of the egg")]
        public void RequestDestroy(PickleContext ctx) => Press(ctx, "MM_DestroyEggsLabel");

        [When("Alpha Mythology Renew cancels the destruction of the egg")]
        public void CancelDestroy(PickleContext ctx) => Press(ctx, "MM_CancelDestroyEggsLabel");

        private static Job DestructionJob(PickleContext ctx, Pawn colonist, Thing egg)
        {
            var giverDef = DefDatabase<WorkGiverDef>.GetNamedSilentFail("VEF_DestroyItems");
            ctx.Require(giverDef != null, "VEF defines no WorkGiverDef 'VEF_DestroyItems' in this build");
            var scanner = giverDef.Worker as WorkGiver_Scanner;
            ctx.Require(scanner != null, "VEF_DestroyItems has no scanner worker");
            return scanner.HasJobOnThing(colonist, egg, false) ? scanner.JobOnThing(colonist, egg, false) : null;
        }

        private static Pawn FreeColonist(PickleContext ctx)
        {
            var colonist = CreatureSteps.Map(ctx).mapPawns.FreeColonists.FirstOrDefault(p => !p.Downed && !p.Dead);
            ctx.Require(colonist != null, "the map has no free colonist");
            return colonist;
        }

        [Then("Alpha Mythology Renew a colonist is offered a destruction job for the egg")]
        public void JobOffered(PickleContext ctx)
        {
            var egg = TheEgg(ctx).Egg;
            ctx.Assert(DestructionJob(ctx, FreeColonist(ctx), egg) != null, "no colonist is offered the destruction job although the destruction was requested");
        }

        [Then("Alpha Mythology Renew no colonist is offered a destruction job for the egg")]
        public void NoJobOffered(PickleContext ctx)
        {
            var egg = TheEgg(ctx).Egg;
            ctx.Assert(DestructionJob(ctx, FreeColonist(ctx), egg) == null, "a colonist is offered the destruction job although it was cancelled");
        }

        [When("Alpha Mythology Renew a colonist carries out the destruction job for the egg")]
        public void CarryOut(PickleContext ctx)
        {
            var egg = TheEgg(ctx).Egg;
            var colonist = FreeColonist(ctx);
            colonist.jobs.StopAll();
            colonist.Position = egg.Position + IntVec3.East;
            colonist.Notify_Teleported(false);
            var job = DestructionJob(ctx, colonist, egg);
            ctx.Require(job != null, "the colonist is offered no destruction job");
            bool taken = colonist.jobs.TryTakeOrderedJob(job);
            ctx.Assert(taken && colonist.CurJob != null && colonist.CurJob.def == job.def,
                $"the colonist did not take the destruction job (taken {taken}, current job {(colonist.CurJob == null ? "none" : colonist.CurJob.def.defName)})");
            ctx.Set(new DestroyWatch { Colonist = colonist });
        }

        [Then("Alpha Mythology Renew the egg is destroyed and no phoenix has hatched from it")]
        public void EggDestroyed(PickleContext ctx)
        {
            var record = CreatureSteps.TryGet<EggRecord>(ctx);
            ctx.Require(record != null, "no egg was spawned in this scenario");
            var watch = CreatureSteps.TryGet<DestroyWatch>(ctx);
            string where = watch == null ? "" : $" (the colonist is at {watch.Colonist.Position}, the egg at {record.Egg.Position}, current job: {(watch.Colonist.CurJob == null ? "none" : watch.Colonist.CurJob.def.defName)})";
            ctx.Assert(record.Egg.Destroyed || !record.Egg.Spawned, "the egg is still there: the destruction job did not finish" + where);
            int phoenixes = CreatureSteps.Map(ctx).mapPawns.AllPawns.Count(p => p.kindDef.defName == "MM_Phoenix");
            ctx.Assert(phoenixes == record.PhoenixesBefore, $"{phoenixes - record.PhoenixesBefore} phoenix(es) appeared although the egg was destroyed");
        }

        // --- F07: products and regeneration ---------------------------------------------------

        [Then("Alpha Mythology Renew a female {string} produces an unfertilized egg of its own kind")]
        public void EggLayerProduces(PickleContext ctx, string kindDefName)
        {
            var kind = CreatureSteps.Kind(ctx, kindDefName);
            var pawn = CreatureSteps.SpawnAtStage(ctx, kind, kind.RaceProps.lifeStageAges.Count - 1, CreatureSteps.FreeCell(ctx));
            pawn.gender = Gender.Female;
            var comp = pawn.TryGetComp<CompEggLayer>();
            ctx.Require(comp != null, $"'{kindDefName}' carries no CompEggLayer");
            var props = comp.Props;
            var egg = comp.ProduceEgg();
            ctx.Assert(egg != null, "the egg layer produced nothing");
            ctx.Assert(egg.def == props.eggUnfertilizedDef, $"produced '{egg.def.defName}', expected '{props.eggUnfertilizedDef.defName}'");
            ctx.Assert((props.eggCountRange.min <= egg.stackCount && egg.stackCount <= props.eggCountRange.max), $"produced {egg.stackCount}, the definition allows {props.eggCountRange}");
            // The hatcher is vanilla's CompProperties_Hatcher or a VEF subclass of it (the salamander's exploding egg): what they
            // share is the hatcherPawn field.
            ctx.Require(props.eggFertilizedDef != null, "the egg layer names no fertilized egg");
            var hatcherPawn = props.eggFertilizedDef.comps
                .Select(c => c.GetType().GetField("hatcherPawn", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic)?.GetValue(c) as PawnKindDef)
                .FirstOrDefault(k => k != null);
            ctx.Assert(hatcherPawn != null, "the fertilized egg names no hatcher pawn");
        }

        [Then("Alpha Mythology Renew a {string} gives milk when it is full")]
        public void MilkableGives(PickleContext ctx, string kindDefName)
        {
            var kind = CreatureSteps.Kind(ctx, kindDefName);
            var pawn = CreatureSteps.SpawnAtStage(ctx, kind, kind.RaceProps.lifeStageAges.Count - 1, CreatureSteps.FreeCell(ctx), Gender.Female);
            var comp = pawn.TryGetComp<CompMilkable>();
            ctx.Require(comp != null, $"'{kindDefName}' carries no CompMilkable");
            var map = CreatureSteps.Map(ctx);
            var doer = map.mapPawns.FreeColonists.FirstOrDefault();
            ctx.Require(doer != null, "the map has no colonist to milk");
            var fullness = typeof(CompMilkable).GetField("fullness", BindingFlags.Instance | BindingFlags.NonPublic);
            ctx.Require(fullness != null, "CompMilkable has no 'fullness' field in this game build");
            fullness.SetValue(comp, 1f);
            var milk = comp.Props.milkDef;
            ctx.Require(milk != null, "the definition names no milk def");
            ctx.Require(comp.ActiveAndFull, $"'{kindDefName}' cannot be milked although its fullness was set (gender {pawn.gender}, life stage {pawn.ageTracker.CurLifeStage.defName})");
            // The milk is placed beside whoever gathers it: stand the gatherer on a free cell next to the animal, so a crowded
            // spot (base-fr, 2026-10-01: the hind, 0 -> 0 while the chimera passed) cannot swallow it.
            doer.Position = pawn.Position;
            doer.Notify_Teleported(false);
            int before = map.listerThings.ThingsOfDef(milk).Sum(t => t.stackCount);
            comp.Gathered(doer);
            int after = map.listerThings.ThingsOfDef(milk).Sum(t => t.stackCount);
            ctx.Assert(after > before, $"no milk was produced when full ({before} -> {after})");
        }

        private sealed class HealRecord
        {
            public Pawn Near, Far;
            public float NearBefore, FarBefore;
        }

        [When("Alpha Mythology Renew injures two colonists equally, one within {int} cells of {string} and one far away")]
        public void InjureTwo(PickleContext ctx, int nearCells, string healer)
        {
            var map = CreatureSteps.Map(ctx);
            var kitsune = CreatureSteps.Live(ctx, healer);
            var colonists = map.mapPawns.FreeColonists.Where(p => !p.Downed && !p.Dead).Take(2).ToList();
            ctx.Require(colonists.Count == 2, "the map needs two free colonists");
            // Draft every colonist: a drafted colonist neither walks off nor tends anybody, and tending would change the healing
            // asymmetrically (the injured one next to the doctor would heal faster for that reason, not the Kitsune's).
            foreach (var pawn in map.mapPawns.FreeColonists)
            {
                if (pawn.drafter != null) pawn.drafter.Drafted = true;
            }
            var near = colonists[0];
            var far = colonists[1];
            var nearCell = CellAtDistance(ctx, kitsune.Position, nearCells);
            var farCell = CreatureSteps.FreeCell(ctx, 45);
            ctx.Require(farCell.DistanceTo(kitsune.Position) > 15f, "no cell far enough from the healer was found");
            foreach (var pair in new[] { new KeyValuePair<Pawn, IntVec3>(near, nearCell), new KeyValuePair<Pawn, IntVec3>(far, farCell) })
            {
                pair.Key.jobs.StopAll();
                pair.Key.Position = pair.Value;
                pair.Key.Notify_Teleported(false);
                pair.Key.jobs.StopAll();
                var torso = pair.Key.RaceProps.body.corePart;
                pair.Key.TakeDamage(new DamageInfo(DamageDefOf.Cut, 12f, 0f, -1f, null, torso));
            }
            ctx.Set(new HealRecord { Near = near, Far = far, NearBefore = InjurySeverity(near), FarBefore = InjurySeverity(far) });
            ctx.Require(InjurySeverity(near) > 0.5f && InjurySeverity(far) > 0.5f, "the colonists were not injured");
        }

        [Then("Alpha Mythology Renew the colonist near the healer has healed more than the one far away")]
        public void NearHealedMore(PickleContext ctx)
        {
            var record = CreatureSteps.TryGet<HealRecord>(ctx);
            ctx.Require(record != null, "no colonists were injured in this scenario");
            float nearNow = InjurySeverity(record.Near), farNow = InjurySeverity(record.Far);
            float nearHealed = record.NearBefore - nearNow, farHealed = record.FarBefore - farNow;
            ctx.Assert(nearHealed > farHealed + 0.05f,
                $"near colonist healed {nearHealed} ({record.NearBefore} -> {nearNow}), far colonist {farHealed} ({record.FarBefore} -> {farNow}): no faster healing inside the radius");
        }

        // --- F08 and F12: plants ----------------------------------------------------------------

        [Given("Alpha Mythology Renew spawns the dead plant {string} and a colonist beside it")]
        public void SpawnDeadPlant(PickleContext ctx, string plantDefName)
        {
            var map = CreatureSteps.Map(ctx);
            var def = DefDatabase<ThingDef>.GetNamedSilentFail(plantDefName);
            ctx.Require(def != null, $"no ThingDef named '{plantDefName}'");
            // FreeCell only excludes pawns, edifices and items: a wild plant already growing there would survive the cut and
            // make the cell look like the job failed, when it is the fixture's own vegetation. Pick a cell bare of any plant.
            IntVec3 cell = default;
            bool found = false;
            for (int i = 0; i < 20; i++)
            {
                cell = CreatureSteps.FreeCell(ctx);
                if (cell.GetPlant(map) == null) { found = true; break; }
            }
            ctx.Require(found, "no cell free of any plant was found near the map centre after 20 attempts");
            var plant = (Plant)ThingMaker.MakeThing(def);
            GenSpawn.Spawn(plant, cell, map);
            ctx.Set(new PlantRecord { Plant = plant, Cell = cell });
        }

        private sealed class PlantRecord { public Plant Plant; public IntVec3 Cell; }

        [When("Alpha Mythology Renew orders a colonist to cut the plant")]
        public void OrderCut(PickleContext ctx)
        {
            var record = CreatureSteps.TryGet<PlantRecord>(ctx);
            ctx.Require(record != null, "no plant was spawned in this scenario");
            var map = CreatureSteps.Map(ctx);
            var colonist = map.mapPawns.FreeColonists.FirstOrDefault(p => !p.Downed && !p.Dead);
            ctx.Require(colonist != null, "the map has no free colonist");
            colonist.Position = record.Cell + IntVec3.East;
            colonist.Notify_Teleported(false);
            var job = JobMaker.MakeJob(JobDefOf.CutPlant, record.Plant);
            colonist.jobs.TryTakeOrderedJob(job);
        }

        [Then("Alpha Mythology Renew the plant is gone and its cell is free again")]
        public void PlantGone(PickleContext ctx)
        {
            var record = CreatureSteps.TryGet<PlantRecord>(ctx);
            ctx.Require(record != null, "no plant was spawned in this scenario");
            var map = CreatureSteps.Map(ctx);
            ctx.Assert(record.Plant.Destroyed || !record.Plant.Spawned, "the plant is still there: the cutting job did not finish");
            ctx.Assert(record.Cell.GetPlant(map) == null, "the cell still holds a plant");
        }

        [Then("Alpha Mythology Renew a tamed {string} may be asked whether it will cut a mature crop without an exception")]
        public void WillingToCut(PickleContext ctx, string kindDefName)
        {
            var map = CreatureSteps.Map(ctx);
            var kind = CreatureSteps.Kind(ctx, kindDefName);
            var pawn = CreatureSteps.SpawnAtStage(ctx, kind, kind.RaceProps.lifeStageAges.Count - 1, CreatureSteps.FreeCell(ctx));
            var plantDef = DefDatabase<ThingDef>.GetNamedSilentFail("Plant_Rice") ?? DefDatabase<ThingDef>.AllDefs.First(d => d.plant != null && d.plant.Harvestable);
            var plant = (Plant)ThingMaker.MakeThing(plantDef);
            plant.Growth = 1f;
            GenSpawn.Spawn(plant, CellAtDistance(ctx, pawn.Position, 2), map);
            try
            {
                PlantUtility.PawnWillingToCutPlant_Job(plant, pawn);
            }
            catch (Exception e)
            {
                ctx.Assert(false, $"asking whether '{kindDefName}' will cut a mature crop threw {e.GetType().Name}: {e.Message}");
            }
            if (!plant.Destroyed) plant.Destroy();
        }

        // --- F12: the harvest path of the report, through VEF's own job giver -----------------------

        private sealed class HarvestRecord
        {
            public Zone_Growing Zone;
            public Plant Plant;
            public Exception Error;
            public bool Issued;
            public string JobDefName;
        }

        [Given("Alpha Mythology Renew spawns a growing zone with a mature crop beside the tamed {string} named {string}")]
        public void CropBesideAnimal(PickleContext ctx, string kindDefName, string name)
        {
            var map = CreatureSteps.Map(ctx);
            var kind = CreatureSteps.Kind(ctx, kindDefName);
            var animal = CreatureSteps.SpawnAtStage(ctx, kind, kind.RaceProps.lifeStageAges.Count - 1, CreatureSteps.FreeCell(ctx));
            animal.Name = new NameSingle(name);
            var plantDef = DefDatabase<ThingDef>.GetNamedSilentFail("Plant_Rice");
            ctx.Require(plantDef != null, "no ThingDef named 'Plant_Rice'");
            var cell = CellAtDistance(ctx, animal.Position, 3);
            var zone = new Zone_Growing(map.zoneManager);
            map.zoneManager.RegisterZone(zone);
            zone.AddCell(cell);
            zone.SetPlantDefToGrow(plantDef);
            var plant = (Plant)ThingMaker.MakeThing(plantDef);
            plant.Growth = 1f;
            GenSpawn.Spawn(plant, cell, map);
            ctx.Require(plant.HarvestableNow, "the spawned crop is not harvestable: the test cannot reach the harvest path");
            ctx.Set(new HarvestRecord { Zone = zone, Plant = plant });
        }

        /// <summary>
        /// The trace of the report: VEF's JobGiver_Harvest asks WorkGiver_GrowerHarvest, which asks
        /// PlantUtility.PawnWillingToCutPlant_Job. The giver is built by reflection (this project does not reference VEF).
        /// </summary>
        [When("Alpha Mythology Renew VEF's harvest job giver is asked for a job for {string}")]
        public void AskHarvestGiver(PickleContext ctx, string name)
        {
            var record = CreatureSteps.TryGet<HarvestRecord>(ctx);
            ctx.Require(record != null, "no crop was spawned in this scenario");
            var pawn = CreatureSteps.Live(ctx, name);
            var type = GenTypes.GetTypeInAnyAssembly("VEF.AnimalBehaviours.JobGiver_Harvest");
            ctx.Require(type != null, "VEF defines no JobGiver_Harvest in this build");
            var giver = (ThinkNode)Activator.CreateInstance(type);
            try
            {
                var result = giver.TryIssueJobPackage(pawn, default(JobIssueParams));
                record.Issued = result.IsValid;
                record.JobDefName = result.Job?.def.defName;
            }
            catch (Exception e)
            {
                record.Error = e;
            }
        }

        [Then("Alpha Mythology Renew the harvest job giver answered without an exception")]
        public void GiverAnswered(PickleContext ctx)
        {
            var record = CreatureSteps.TryGet<HarvestRecord>(ctx);
            ctx.Require(record != null, "no crop was spawned in this scenario");
            ctx.Assert(record.Error == null,
                $"the harvest job giver threw {record.Error?.GetType().Name}: {record.Error?.Message} at "
                + string.Join(" <- ", (record.Error?.StackTrace ?? "").Split('\n').Select(l => l.Trim()).Take(4).ToArray()));
        }

        // --- teardown ---------------------------------------------------------------------------

        [AfterScenario]
        public void Teardown(PickleContext ctx)
        {
            try
            {
                var list = CreatureSteps.TryGet<TargetList>(ctx);
                if (list != null)
                {
                    foreach (var pawn in list.Pawns)
                    {
                        if (pawn != null && !pawn.Destroyed) pawn.Destroy();
                    }
                }
                var egg = CreatureSteps.TryGet<EggRecord>(ctx);
                if (egg?.Egg != null && !egg.Egg.Destroyed) egg.Egg.Destroy();
                var harvest = CreatureSteps.TryGet<HarvestRecord>(ctx);
                if (harvest != null)
                {
                    if (harvest.Plant != null && !harvest.Plant.Destroyed) harvest.Plant.Destroy();
                    harvest.Zone?.Delete();
                }
                var plant = CreatureSteps.TryGet<PlantRecord>(ctx);
                if (plant?.Plant != null && !plant.Plant.Destroyed) plant.Plant.Destroy();
            }
            catch (Exception e)
            {
                Log.Warning($"[Alpha Mythology Renew tests] action scenario clean-up failed: {e.Message}");
            }
        }
    }
}
