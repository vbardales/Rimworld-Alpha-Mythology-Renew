using System;
using System.Linq;
using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace AlphaMythologyRenew.PickleSteps
{
    /// <summary>
    /// DRAFT (docs/scenarios-draft, not yet in Tests/Pickle/Source, which is frozen until the first run is done).
    /// Steps for the two behaviours of this mod that only a running game shows: the phoenix leaving an egg in its
    /// flames when it dies, and the will-o'-wisp's translated fission progress in its inspection string. They need a
    /// creature on the map: use "Alpha Mythology Renew spawns the player animal ..." from docs/gallery-draft.
    /// </summary>
    [PickleSteps]
    public class BehaviourSteps
    {
        private static Map Map(PickleContext ctx)
        {
            ctx.Require(Current.Game != null && Find.CurrentMap != null, "no current map: load a fixture first");
            return Find.CurrentMap;
        }

        private static Pawn Live(PickleContext ctx, string name)
        {
            var pawn = Map(ctx).mapPawns.AllPawns.FirstOrDefault(p => p.LabelShort == name);
            ctx.Require(pawn != null, $"no living pawn named '{name}' on the map");
            return pawn;
        }

        /// <summary>
        /// Pickle's own vocabulary (AUDIT.md, PickleTools/Headless/README.md) documents "an error matching {string}
        /// was logged", but RimWorks.Pickle.Vanilla 4.9.1 (the build staged here) has no such step: only the
        /// negative "no errors were logged" and the warning-matching family exist (found running 778c, "Undefined
        /// step"). Reading through <see cref="Verse.Log.Messages"/> ourselves instead of waiting on that gap.
        /// </summary>
        [Then("Alpha Mythology Renew an error matching {string} was logged")]
        public void ErrorMatching(PickleContext ctx, string pattern)
        {
            var hit = Log.Messages.LastOrDefault(m => m.type == LogMessageType.Error && m.text.Contains(pattern));
            ctx.Assert(hit != null, $"no logged error contains '{pattern}'");
        }

        [When("Alpha Mythology Renew kills the creature {string}")]
        public void Kill(PickleContext ctx, string name)
        {
            var pawn = Live(ctx, name);
            pawn.Kill(null);
            ctx.Assert(pawn.Dead, $"'{name}' is still alive after Kill");
        }

        [Then("Alpha Mythology Renew an egg {string} lies within {int} cells of the corpse of {string}")]
        public void EggNearCorpse(PickleContext ctx, string eggDefName, int cells, string name)
        {
            var map = Map(ctx);
            var corpse = map.listerThings.ThingsInGroup(ThingRequestGroup.Corpse)
                .OfType<Corpse>().FirstOrDefault(c => c.InnerPawn != null && c.InnerPawn.LabelShort == name);
            ctx.Require(corpse != null, $"no corpse of '{name}' on the map");
            var def = DefDatabase<ThingDef>.GetNamedSilentFail(eggDefName);
            ctx.Require(def != null, $"no ThingDef named '{eggDefName}'");
            var eggs = map.listerThings.ThingsOfDef(def)
                .Where(t => t.Position.DistanceTo(corpse.Position) <= cells).ToList();
            ctx.Assert(eggs.Count >= 1,
                $"no '{eggDefName}' within {cells} cells of the corpse at {corpse.Position}; eggs on the map: {map.listerThings.ThingsOfDef(def).Count}");
        }

        /// <summary>
        /// Language-agnostic: the expected text is the template of the active language, cut at its first
        /// placeholder, so the same step holds in the English pass and in the French one.
        /// </summary>
        [Then("Alpha Mythology Renew the inspection text of {string} carries the fission progress text of the language this pass runs")]
        public void FissionProgress(PickleContext ctx, string name)
        {
            var pawn = Live(ctx, name);
            var active = LanguageDatabase.activeLanguage;
            ctx.Require(active != null && active.keyedReplacements.ContainsKey("AMR_AsexualReproductionProgress"),
                "the active language has no AMR_AsexualReproductionProgress");
            var template = active.keyedReplacements["AMR_AsexualReproductionProgress"].value;
            var prefix = template.Substring(0, template.IndexOf('{'));
            ctx.Require(prefix.Length > 3, $"template '{template}' has no usable prefix");
            var text = pawn.GetInspectString();
            ctx.Assert(text.Contains(prefix.Trim()),
                $"the inspection text of '{name}' does not contain '{prefix.Trim()}'. It reads: {text}");
            ctx.Assert(!text.Contains("AMR_"), $"a raw key shows in the inspection text: {text}");
            // The cycle length is a counted phrase (15 days in the Def): the plural form of the active language.
            // Translate colours the number with a rich-text tag; the inspection text is read without tags on both sides.
            var cycle = System.Text.RegularExpressions.Regex.Replace("AMR_AsexualReproductionDays.Many".Translate(15).Resolve(), "<[^>]+>", "");
            text = System.Text.RegularExpressions.Regex.Replace(text, "<[^>]+>", "");
            ctx.Assert(text.Contains(cycle), $"the inspection text of '{name}' does not name the cycle as '{cycle}'. It reads: {text}");
        }
    }
}
