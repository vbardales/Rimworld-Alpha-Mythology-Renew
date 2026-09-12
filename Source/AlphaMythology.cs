using System.Collections.Generic;
using RimWorld;
using Verse;
using Verse.AI.Group;

namespace AlphaMythologyRenew
{
    // Alpha Mythology shipped these three classes in its own
    // MagicalAnimalBehavioursAndEvents.dll, under the AnimalBehaviours namespace --
    // the very one VEF used before it moved everything under VEF.AnimalBehaviours.
    // Taking them over here avoids shipping a foreign DLL compiled for 1.5, and above all
    // keeps the namespace from colliding with that of another mod in the series.
    //
    // The mod's fourth type, MMToggleableSpawnDef, is not taken over: it only served the
    // settings window of the original mod, which the pack does not have.

    // The phoenix explodes as it dies and leaves an egg in the flames.
    public class DeathActionWorker_ExplodeAndSpawnEggs : DeathActionWorker
    {
        private const string EggDefName = "MM_EggPhoenixFertilized";

        public override void PawnDied(Corpse corpse, Lord prevLord)
        {
            Map map = corpse.Map;
            if (map == null)
            {
                return;
            }

            // An adult phoenix goes off harder than a chick.
            int stage = corpse.InnerPawn.ageTracker.CurLifeStageIndex;
            float radius = stage == 0 ? 3.9f : (stage == 1 ? 4.9f : 5.9f);

            ThingDef eggDef = DefDatabase<ThingDef>.GetNamedSilentFail(EggDefName);
            List<Thing> spawned = null;

            if (eggDef != null)
            {
                Thing egg = ThingMaker.MakeThing(eggDef);
                egg.stackCount = Rand.Value <= 0.3f ? 2 : 1;
                GenPlace.TryPlaceThing(egg, corpse.Position, map, ThingPlaceMode.Near);
                spawned = new List<Thing> { egg };
            }

            GenExplosion.DoExplosion(corpse.Position, map, radius, DamageDefOf.Flame, corpse.InnerPawn,
                ignoredThings: spawned);
        }
    }

    // A wound that never closes: it bleeds of its own accord, once a second.
    public class Hediff_BleedingWound : HediffWithComps
    {
        private const int IntervalTicks = 64;
        private const string DamageDefName = "MM_UncontrollableBleeding";

        private int tickCounter;

        public override void Tick()
        {
            base.Tick();

            tickCounter++;
            if (tickCounter <= IntervalTicks)
            {
                return;
            }

            tickCounter = 0;

            DamageDef damage = DefDatabase<DamageDef>.GetNamedSilentFail(DamageDefName);
            if (damage != null)
            {
                pawn.TakeDamage(new DamageInfo(damage, 1f, 0f, -1f, null, null, null,
                    DamageInfo.SourceCategory.ThingOrUnknown, null, true, true));
            }
        }

        public override void ExposeData()
        {
            base.ExposeData();
            Scribe_Values.Look(ref tickCounter, "tickCounter", 0);
        }
    }

    // Shutting a mechanical beast down: the operation is done on the brain, and kills it.
    public class Recipe_ShutDown : RecipeWorker
    {
        public override IEnumerable<BodyPartRecord> GetPartsToApplyOn(Pawn pawn, RecipeDef recipe)
        {
            BodyPartRecord brain = pawn.health.hediffSet.GetBrain();
            if (brain != null)
            {
                yield return brain;
            }
        }

        public override void ApplyOnPawn(Pawn pawn, BodyPartRecord part, Pawn billDoer, List<Thing> ingredients, Bill bill)
        {
            pawn.Kill(null);
            ThoughtUtility.GiveThoughtsForPawnExecuted(pawn, billDoer, PawnExecutionKind.OrganHarvesting);
        }
    }
}

