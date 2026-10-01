using System;
using System.Linq;
using RimWorks.Pickle;
using Verse;

namespace AlphaMythologyRenew.PickleSteps
{
    /// <summary>
    /// What the three animal-mod patches (Mod/Patches/AlphaMythology/AnimalProsthetics2Patch.xml, DogsMatePatch.xml,
    /// BetterCrossbreedingPatch.xml) leave in the game's own data once every mod has loaded. They read the live
    /// definitions, not the patch files: the unit tests (Tests/UnitTests/PatchTests.cs) already prove the files;
    /// this proves the game, with the real providers loaded, ended up with the same result.
    /// </summary>
    [PickleSteps]
    public class AnimalPatchSteps
    {
        private static PawnKindDef Kind(PickleContext ctx, string defName)
        {
            var kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(defName);
            ctx.Require(kind != null, $"no PawnKindDef named '{defName}'");
            return kind;
        }

        private static bool FromMod(Def def, string packageId) =>
            def.modContentPack != null &&
            (string.Equals(def.modContentPack.PackageId, packageId, StringComparison.OrdinalIgnoreCase) ||
             string.Equals(def.modContentPack.PackageIdPlayerFacing, packageId, StringComparison.OrdinalIgnoreCase));

        /// <summary>
        /// A def of a type that belongs to another mod (the Achievements Expanded types, for instance) cannot be named
        /// at compile time here: the type is looked up by name once the game has loaded every assembly.
        /// </summary>
        [Then("Alpha Mythology Renew the def {string} of type {string} exists")]
        public void DefOfTypeExists(PickleContext ctx, string defName, string typeName)
        {
            var type = GenTypes.GetTypeInAnyAssembly(typeName);
            ctx.Require(type != null, $"no type named '{typeName}' is loaded");
            var db = typeof(DefDatabase<>).MakeGenericType(type);
            var found = db.GetMethod("GetNamedSilentFail", new[] { typeof(string), typeof(bool) }) ?? db.GetMethod("GetNamedSilentFail", new[] { typeof(string) });
            ctx.Require(found != null, "DefDatabase<T>.GetNamedSilentFail not found");
            var args = found.GetParameters().Length == 2 ? new object[] { defName, false } : new object[] { defName };
            ctx.Assert(found.Invoke(null, args) != null, $"no {typeName} named '{defName}'");
        }

        [Then("Alpha Mythology Renew the animal {string} is offered surgeries by mod {string}")]
        public void OffersSurgeries(PickleContext ctx, string kindName, string packageId)
        {
            var race = Kind(ctx, kindName).race;
            var recipes = race.AllRecipes.Where(r => FromMod(r, packageId)).ToList();
            ctx.Assert(recipes.Count > 0,
                $"'{kindName}' is offered no surgery recipe from {packageId} ({race.AllRecipes.Count()} recipes in all)");
        }

        [Then("Alpha Mythology Renew the animal {string} is offered no surgery by mod {string}")]
        public void OffersNoSurgery(PickleContext ctx, string kindName, string packageId)
        {
            var race = Kind(ctx, kindName).race;
            var recipes = race.AllRecipes.Where(r => FromMod(r, packageId)).Select(r => r.defName).ToList();
            ctx.Assert(recipes.Count == 0, $"'{kindName}' is offered {recipes.Count} recipe(s) from {packageId}: {string.Join(", ", recipes.Take(5))}");
        }

        [Then("Alpha Mythology Renew the animal {string} can cross-breed with {string}")]
        public void CanCrossBreed(PickleContext ctx, string kindName, string partnerName)
        {
            var race = Kind(ctx, kindName).race;
            var partner = Kind(ctx, partnerName).race;
            var list = race.race.canCrossBreedWith;
            ctx.Assert(list != null && list.Contains(partner),
                $"'{kindName}' does not list '{partnerName}' in canCrossBreedWith (it lists: {(list == null ? "nothing" : string.Join(", ", list.Select(d => d.defName)))})");
        }

        [Then("Alpha Mythology Renew the animal {string} cannot cross-breed with {string}")]
        public void CannotCrossBreed(PickleContext ctx, string kindName, string partnerName)
        {
            var race = Kind(ctx, kindName).race;
            var partner = Kind(ctx, partnerName).race;
            var list = race.race.canCrossBreedWith;
            ctx.Assert(list == null || !list.Contains(partner), $"'{kindName}' lists '{partnerName}' in canCrossBreedWith, which no patch should have written");
        }

        [Then("Alpha Mythology Renew the animal {string} carries the extension {string}")]
        public void CarriesExtension(PickleContext ctx, string kindName, string typeName)
        {
            var kind = Kind(ctx, kindName);
            var names = kind.modExtensions == null ? new string[0] : kind.modExtensions.Select(e => e.GetType().FullName).ToArray();
            ctx.Assert(names.Contains(typeName), $"'{kindName}' carries no {typeName} (it carries: {string.Join(", ", names)})");
        }
    }
}
