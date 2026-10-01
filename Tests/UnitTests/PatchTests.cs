using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Xml.XPath;

// The three animal-mod patches (A Dog Said... Animal Prosthetics 2, Dogs mate, Better Crossbreeding)
// applied for real to small stand-ins of the other mods' definitions. A minimal engine reads the same
// operations the game reads (Sequence, Conditional, Add, AddModExtension, FindMod) and evaluates xpath with
// System.Xml.XPath, which is XPath 1.0 like the game's own. What only the real mods can show (their load
// order, what they do with the lists at game start) is covered by the Pickle passes that load them.
internal static class PatchTests
{
    private static string patchDir;

    // Applies one operation to the document. activeMods holds the display names FindMod can see.
    private static bool Apply(XElement op, XDocument doc, string[] activeMods)
    {
        string cls = (string)op.Attribute("Class");
        switch (cls)
        {
            case "PatchOperationSequence":
                foreach (var li in op.Element("operations").Elements("li")) Apply(li, doc, activeMods);
                return true;
            case "PatchOperationFindMod":
                bool found = op.Element("mods").Elements("li").Any(m => activeMods.Contains((string)m));
                var branch = op.Element(found ? "match" : "nomatch");
                return branch == null || Apply(branch, doc, activeMods);
            case "PatchOperationConditional":
                bool exists = doc.XPathSelectElements((string)op.Element("xpath")).Any();
                var next = op.Element(exists ? "match" : "nomatch");
                return next == null || Apply(next, doc, activeMods);
            case "PatchOperationAdd":
                foreach (var target in doc.XPathSelectElements((string)op.Element("xpath")).ToList())
                    foreach (var node in op.Element("value").Elements()) target.Add(new XElement(node));
                return true;
            case "PatchOperationAddModExtension":
                foreach (var target in doc.XPathSelectElements((string)op.Element("xpath")).ToList())
                {
                    var ext = target.Element("modExtensions") ?? new XElement("modExtensions");
                    if (ext.Parent == null) target.Add(ext);
                    foreach (var node in op.Element("value").Elements()) ext.Add(new XElement(node));
                }
                return true;
            default:
                throw new InvalidOperationException("unknown operation " + cls);
        }
    }

    private static XDocument Run(string file, XDocument doc, params string[] activeMods)
    {
        var copy = new XDocument(doc);
        var patch = XDocument.Load(Path.Combine(patchDir, file));
        foreach (var op in patch.Root.Elements("Operation")) Apply(op, copy, activeMods);
        return copy;
    }

    private static string[] Users(XDocument d, string recipe) =>
        d.XPathSelectElements($"/Defs/RecipeDef[@Name=\"{recipe}\"]/recipeUsers/li").Select(x => (string)x).ToArray();

    private static XDocument Defs(string xml) => XDocument.Parse("<Defs>" + xml + "</Defs>");

    public static void Run(Action<bool, string> check)
    {
        string dir = AppContext.BaseDirectory;
        while (dir != null && !Directory.Exists(Path.Combine(dir, "Mod", "Patches"))) dir = Path.GetDirectoryName(dir);
        patchDir = Path.Combine(dir ?? ".", "Mod", "Patches", "AlphaMythology");

        // ---- A Dog Said... Animal Prosthetics 2 ----
        string adsFile = "AnimalProsthetics2Patch.xml";
        var ads = Defs(@"
            <RecipeDef Name=""ADS_Cat1"" Abstract=""True""><recipeUsers><li>Chicken</li></recipeUsers></RecipeDef>
            <RecipeDef Name=""ADS_Cat2"" Abstract=""True""><recipeUsers><li>Cow</li></recipeUsers></RecipeDef>
            <RecipeDef Name=""ADS_Cat3"" Abstract=""True""><recipeUsers><li>Horse</li></recipeUsers></RecipeDef>
            <RecipeDef Name=""Other""><recipeUsers><li>Colonist</li></recipeUsers></RecipeDef>");
        var adsOn = Run(adsFile, ads);
        check(Users(adsOn, "ADS_Cat3").Contains("MM_Cerberus") && Users(adsOn, "ADS_Cat2").Contains("MM_Cerberus") && Users(adsOn, "ADS_Cat1").Contains("MM_Cerberus"),
            "ADS 2: a Cat3 animal is in all three lists");
        check(!Users(adsOn, "ADS_Cat3").Contains("MM_CeryneianHind") && Users(adsOn, "ADS_Cat2").Contains("MM_CeryneianHind") && Users(adsOn, "ADS_Cat1").Contains("MM_CeryneianHind"),
            "ADS 2: a Cat2 animal is in Cat2 and Cat1, not Cat3");
        check(!Users(adsOn, "ADS_Cat3").Contains("MM_Basilisk") && !Users(adsOn, "ADS_Cat2").Contains("MM_Basilisk") && Users(adsOn, "ADS_Cat1").Contains("MM_Basilisk"),
            "ADS 2: a Cat1 animal is in Cat1 only");
        foreach (string left in new[] { "MM_LernaeanHydra", "MM_LesserWyvern", "MM_WillOWisp" })
            check(new[] { "ADS_Cat1", "ADS_Cat2", "ADS_Cat3" }.All(c => !Users(adsOn, c).Contains(left)), "ADS 2: " + left + " is left out on purpose");
        check(Users(adsOn, "ADS_Cat1").Contains("Chicken") && Users(adsOn, "ADS_Cat3").Contains("Horse"), "ADS 2: the existing users are kept");
        check(Users(adsOn, "Other").SequenceEqual(new[] { "Colonist" }), "ADS 2: a recipe that is not a category is untouched");
        check(XNode.DeepEquals(Run(adsFile, Defs("<ThingDef><defName>Core</defName></ThingDef>")).Root, Defs("<ThingDef><defName>Core</defName></ThingDef>").Root),
            "ADS 2: without ADS_Cat1 the document is unchanged");
        // The trap the patch comment names: the predicate without @Name= on every branch is true for every recipe.
        var trap = new XDocument(ads);
        foreach (var r in trap.XPathSelectElements("/Defs/RecipeDef[@Name=\"ADS_Cat3\" or \"ADS_Cat2\"]")) r.Add(new XAttribute("hit", "1"));
        check(trap.XPathSelectElements("/Defs/RecipeDef[@hit]").Count() == 4,
            "ADS 2: the trap predicate (branches without @Name=) does match every recipe, so the guard of the patch is the right one");

        // ---- Dogs mate (Continued) ----
        string dmFile = "DogsMatePatch.xml";
        var dm = Defs(@"
            <Revolus.DogsMate.AnimalGroupDef><defName>Dog</defName><pawnKinds><li>Husky</li></pawnKinds></Revolus.DogsMate.AnimalGroupDef>
            <Revolus.DogsMate.AnimalGroupDef><defName>Pig</defName><pawnKinds><li>Pig</li></pawnKinds></Revolus.DogsMate.AnimalGroupDef>
            <Revolus.DogsMate.AnimalGroupDef><defName>Deer</defName><pawnKinds><li>Deer</li></pawnKinds></Revolus.DogsMate.AnimalGroupDef>
            <Revolus.DogsMate.AnimalGroupDef><defName>Horse</defName><pawnKinds><li>Horse</li></pawnKinds></Revolus.DogsMate.AnimalGroupDef>
            <Revolus.DogsMate.AnimalGroupDef><defName>Cat</defName><pawnKinds><li>Cat</li></pawnKinds></Revolus.DogsMate.AnimalGroupDef>");
        var dmOn = Run(dmFile, dm);
        string[] Kinds(string g) => dmOn.XPathSelectElements($"/Defs/Revolus.DogsMate.AnimalGroupDef[defName=\"{g}\"]/pawnKinds/li").Select(x => (string)x).ToArray();
        check(Kinds("Dog").SequenceEqual(new[] { "Husky", "MM_Cerberus" }), "Dogs mate: Cerberus joins the Dog group after its existing kinds");
        check(Kinds("Pig").SequenceEqual(new[] { "Pig", "MM_ErymanthianBoar" }), "Dogs mate: the Erymanthian boar joins the Pig group");
        check(Kinds("Deer").SequenceEqual(new[] { "Deer", "MM_CeryneianHind" }), "Dogs mate: the Ceryneian hind joins the Deer group");
        check(Kinds("Horse").SequenceEqual(new[] { "Horse", "MM_Pegasus" }), "Dogs mate: Pegasus joins the Horse group");
        check(Kinds("Cat").SequenceEqual(new[] { "Cat" }), "Dogs mate: a group that is not named is untouched");
        var noDm = Defs("<ThingDef><defName>Husky</defName></ThingDef>");
        check(XNode.DeepEquals(Run(dmFile, noDm).Root, noDm.Root), "Dogs mate: without its groups the document is unchanged");

        // ---- Better Crossbreeding ----
        string bcFile = "BetterCrossbreedingPatch.xml";
        var bc = Defs(@"
            <ThingDef><defName>MM_Cerberus</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>MM_ErymanthianBoar</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>MM_CeryneianHind</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>MM_Pegasus</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>Husky</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>LabradorRetriever</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>YorkshireTerrier</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>WildBoar</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>Pig</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>Deer</defName><race><body>x</body><canCrossBreedWith><li>Elk</li></canCrossBreedWith></race></ThingDef>
            <ThingDef><defName>Elk</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>Caribou</defName><race><body>x</body></race></ThingDef>
            <ThingDef><defName>Horse</defName><race><body>x</body></race></ThingDef>
            <PawnKindDef><defName>MM_Cerberus</defName></PawnKindDef>
            <PawnKindDef><defName>MM_ErymanthianBoar</defName></PawnKindDef>
            <PawnKindDef><defName>MM_CeryneianHind</defName></PawnKindDef>
            <PawnKindDef><defName>MM_Pegasus</defName></PawnKindDef>
            <PawnKindDef><defName>Husky</defName></PawnKindDef>
            <PawnKindDef><defName>LabradorRetriever</defName></PawnKindDef>
            <PawnKindDef><defName>YorkshireTerrier</defName></PawnKindDef>
            <PawnKindDef><defName>WildBoar</defName></PawnKindDef>
            <PawnKindDef><defName>Pig</defName></PawnKindDef>
            <PawnKindDef><defName>Deer</defName><modExtensions><li Class=""DZY.CrossBreeding.Extension""><outcomes><Elk><Paternal /></Elk></outcomes></li></modExtensions></PawnKindDef>
            <PawnKindDef><defName>Elk</defName></PawnKindDef>
            <PawnKindDef><defName>Caribou</defName></PawnKindDef>
            <PawnKindDef><defName>Horse</defName></PawnKindDef>");
        var bcOff = Run(bcFile, bc, "Core");
        check(XNode.DeepEquals(bcOff.Root, bc.Root), "Better Crossbreeding: without the mod the document is unchanged");
        var bcOn = Run(bcFile, bc, "Better Crossbreeding");
        string[] Seeks(string d) => bcOn.XPathSelectElements($"/Defs/ThingDef[defName=\"{d}\"]/race/canCrossBreedWith/li").Select(x => (string)x).ToArray();
        int Lists(string d) => bcOn.XPathSelectElements($"/Defs/ThingDef[defName=\"{d}\"]/race/canCrossBreedWith").Count();
        check(Seeks("MM_Cerberus").OrderBy(x => x).SequenceEqual(new[] { "Husky", "LabradorRetriever", "YorkshireTerrier" }), "Better Crossbreeding: Cerberus seeks the three dogs");
        check(new[] { "Husky", "LabradorRetriever", "YorkshireTerrier" }.All(d => Seeks(d).SequenceEqual(new[] { "MM_Cerberus" })), "Better Crossbreeding: each dog seeks Cerberus (both directions)");
        check(Seeks("MM_ErymanthianBoar").SequenceEqual(new[] { "WildBoar", "Pig" }) && Seeks("Pig").SequenceEqual(new[] { "MM_ErymanthianBoar" }), "Better Crossbreeding: the boar and the pigs seek each other");
        check(Seeks("Horse").SequenceEqual(new[] { "MM_Pegasus" }) && Seeks("MM_Pegasus").SequenceEqual(new[] { "Horse" }), "Better Crossbreeding: Pegasus and the horse seek each other");
        check(Seeks("Deer").SequenceEqual(new[] { "Elk", "MM_CeryneianHind" }) && Lists("Deer") == 1,
            "Better Crossbreeding: an existing list is appended to, never doubled (one <canCrossBreedWith>)");
        check(new[] { "MM_Cerberus", "Husky", "Deer", "Pig", "Horse" }.All(d => Lists(d) == 1), "Better Crossbreeding: every race has exactly one list");
        string[] Outcomes(string kind) => bcOn.XPathSelectElements($"/Defs/PawnKindDef[defName=\"{kind}\"]/modExtensions/li[@Class=\"DZY.CrossBreeding.Extension\"]/outcomes/*").Select(x => x.Name.LocalName).ToArray();
        check(Outcomes("MM_Cerberus").OrderBy(x => x).SequenceEqual(new[] { "Husky", "LabradorRetriever", "YorkshireTerrier" }), "Better Crossbreeding: Cerberus as mother has an outcome per dog father");
        check(Outcomes("Husky").SequenceEqual(new[] { "MM_Cerberus" }), "Better Crossbreeding: a dog as mother has Cerberus as father");
        check(Outcomes("Deer").SequenceEqual(new[] { "Elk", "MM_CeryneianHind" }) &&
              bcOn.XPathSelectElements("/Defs/PawnKindDef[defName=\"Deer\"]/modExtensions/li[@Class=\"DZY.CrossBreeding.Extension\"]").Count() == 1,
            "Better Crossbreeding: an existing extension is kept, one extension only");
        check(bcOn.XPathSelectElements("/Defs/PawnKindDef/modExtensions/li/outcomes/*/Random").Count() == 18, "Better Crossbreeding: the 18 new outcomes are Random");
        check(bcOn.XPathSelectElements("/Defs/PawnKindDef/modExtensions/li[@Class=\"DZY.Crossbreeding.Extension\"]").Count() == 0, "Better Crossbreeding: the class is spelled with a capital B, as in the assembly");
    }
}
