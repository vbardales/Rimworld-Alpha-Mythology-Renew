using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using Verse;

namespace AlphaMythologyRenew
{
    // VEF's inspection string concatenates an XML prefix, a percentage and English
    // "days". Replace only this mod's wisp text, leaving VEF reproduction untouched.
    [StaticConstructorOnStartup]
    public static class TranslationPatches
    {
        private static readonly FieldInfo Counter;
        private static readonly FieldInfo TicksPerDay;
        private static readonly FieldInfo IntervalDays;
        private static readonly FieldInfo Enabled;

        static TranslationPatches()
        {
            var comp = AccessTools.TypeByName("VEF.AnimalBehaviours.CompAsexualReproduction");
            var props = AccessTools.TypeByName("VEF.AnimalBehaviours.CompProperties_AsexualReproduction");
            var settings = AccessTools.TypeByName("VEF.AnimalBehaviours.AnimalBehaviours_Settings");
            Counter = comp == null ? null : AccessTools.Field(comp, "asexualFissionCounter");
            TicksPerDay = comp == null ? null : AccessTools.Field(comp, "ticksInday");
            IntervalDays = props == null ? null : AccessTools.Field(props, "reproductionIntervalDays");
            Enabled = settings == null ? null : AccessTools.Field(settings, "flagAsexualReproduction");
            var inspect = comp == null ? null : AccessTools.Method(comp, "CompInspectStringExtra");
            var gizmos = comp == null ? null : AccessTools.Method(comp, "CompGetGizmosExtra");
            if (Counter == null || TicksPerDay == null || IntervalDays == null || Enabled == null
                || inspect == null || gizmos == null)
            {
                Log.Error("[AlphaMythologyRenew] VEF reproduction translation bindings changed; translation patches were not installed.");
                return;
            }

            var harmony = new Harmony("nelim.alphamythologyrenew.translations");
            harmony.Patch(inspect, postfix: new HarmonyMethod(typeof(TranslationPatches), nameof(InspectPostfix)));
            harmony.Patch(gizmos, postfix: new HarmonyMethod(typeof(TranslationPatches), nameof(GizmosPostfix)));
        }

        public static void InspectPostfix(ThingComp __instance, ref string __result)
        {
            if (__instance.parent.def.defName != "MM_WillOWisp") return;
            if (!(bool)Enabled.GetValue(null))
            {
                __result = "AMR_AsexualReproductionDisabled".Translate();
                return;
            }

            // An empty result means VEF has hidden the counter (wild or juvenile).
            if (string.IsNullOrEmpty(__result)) return;
            int days = (int)IntervalDays.GetValue(__instance.props);
            int ticks = (int)TicksPerDay.GetValue(__instance);
            float progress = (float)(int)Counter.GetValue(__instance) / (ticks * (float)days);
            __result = "AMR_AsexualReproductionProgress".Translate(progress.ToStringPercent(), days);
        }

        public static void GizmosPostfix(ThingComp __instance, ref IEnumerable<Gizmo> __result)
        {
            if (__instance.parent.def.defName == "MM_WillOWisp")
                __result = TranslateReproductionGizmos(__result);
        }

        private static IEnumerable<Gizmo> TranslateReproductionGizmos(IEnumerable<Gizmo> gizmos)
        {
            foreach (var gizmo in gizmos)
            {
                if (gizmo is Command command && command.defaultLabel == "DEV: Reproduce now")
                {
                    command.defaultLabel = "AMR_DevReproduce".Translate();
                    command.defaultDesc = "AMR_DevReproduceDesc".Translate();
                }
                yield return gizmo;
            }
        }
    }
}
