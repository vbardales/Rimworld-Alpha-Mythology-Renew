using System.Collections.Generic;
using RimWorld;
using Verse;
using Verse.AI.Group;

namespace AlphaMythologyRenew
{
    // Alpha Mythology shipped these classes in its own
    // MagicalAnimalBehavioursAndEvents.dll, under the AnimalBehaviours namespace --
    // the very one VEF used before it moved everything under VEF.AnimalBehaviours.
    // Taking them over here avoids shipping a foreign DLL compiled for 1.5, and above all
    // keeps the namespace from colliding with that of another mod in the series.
    //
    // Two more types are not taken over: MMToggleableSpawnDef only served the settings window of the original mod,
    // and Recipe_ShutDown (a surgery that killed a mechanoid through the brain) was offered by no race of this pack:
    // its only user was the Mechataur, which the port does not ship.

    // The phoenix explodes as it dies and leaves an egg in the flames.
    public class DeathActionWorker_ExplodeAndSpawnEggs : DeathActionWorker
    {
        public override void PawnDied(Corpse corpse, Lord prevLord)
        {
            Map map = corpse.Map;
            if (map == null)
            {
                return;
            }

            float radius = PhoenixRules.ExplosionRadius(corpse.InnerPawn.ageTracker.CurLifeStageIndex);

            ThingDef eggDef = DefDatabase<ThingDef>.GetNamedSilentFail(PhoenixRules.EggDefName);
            List<Thing> spawned = null;

            if (eggDef != null)
            {
                Thing egg = ThingMaker.MakeThing(eggDef);
                egg.stackCount = PhoenixRules.EggCount(Rand.Value);
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
}

