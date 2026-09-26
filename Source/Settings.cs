using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using RimWorld;
using UnityEngine;
using Verse;

namespace AlphaMythologyRenew
{
    // What the player can tune without editing XML: how often the 25 creatures turn up in the wild,
    // and which of them may not turn up at all. The original mod had the same two controls in its
    // own settings window (a frequency multiplier and one switch per creature); this is the port of
    // that idea, not of its code.
    public class AlphaMythologySettings : ModSettings
    {
        public float spawnMultiplier = SpawnRules.DefaultMultiplier;
        // defNames of the creatures that must never appear in the wild. Empty by default.
        public HashSet<string> blockedKinds = new HashSet<string>();

        public bool IsBlocked(string kindDefName) => blockedKinds.Contains(kindDefName);

        public void ResetToDefaults()
        {
            spawnMultiplier = SpawnRules.DefaultMultiplier;
            blockedKinds.Clear();
        }

        public override void ExposeData()
        {
            base.ExposeData();
            Scribe_Values.Look(ref spawnMultiplier, "spawnMultiplier", SpawnRules.DefaultMultiplier);
            List<string> blocked = blockedKinds?.ToList();
            Scribe_Collections.Look(ref blocked, "blockedKinds", LookMode.Value);
            if (Scribe.mode == LoadSaveMode.PostLoadInit)
            {
                // A hand-edited or older file must not break the game: clamp, and tolerate a missing list.
                spawnMultiplier = SpawnRules.Sanitize(spawnMultiplier);
                blockedKinds = new HashSet<string>(blocked ?? new List<string>());
            }
        }
    }

    public class AlphaMythologyRenewMod : Mod
    {
        public const string PackageId = "nelim.alphamythologyrenew";
        private const float RowHeight = 28f;

        public static AlphaMythologyRenewMod Instance;
        public static AlphaMythologySettings Settings;

        private Vector2 scroll;

        public AlphaMythologyRenewMod(ModContentPack content) : base(content)
        {
            Instance = this;
            Settings = GetSettings<AlphaMythologySettings>();
            new Harmony("nelim.alphamythologyrenew.settings").PatchAll(typeof(AlphaMythologyRenewMod).Assembly);
        }

        public override string SettingsCategory() => "AMR_SettingsCategory".Translate();

        // The creatures this mod adds, found by the pack that defines them rather than by a name
        // prefix, so that a creature added later needs no edit here.
        public static List<PawnKindDef> OwnKinds()
        {
            return DefDatabase<PawnKindDef>.AllDefsListForReading
                .Where(IsOwnKind)
                .OrderBy(k => k.label)
                .ToList();
        }

        public static bool IsOwnKind(PawnKindDef kind)
        {
            return kind?.modContentPack != null && kind.modContentPack.PackageId == PackageId
                   && kind.RaceProps != null && kind.RaceProps.Animal;
        }

        public override void DoSettingsWindowContents(Rect inRect)
        {
            var listing = new Listing_Standard();
            listing.Begin(inRect);
            listing.Label("AMR_SpawnMultiplier".Translate(Settings.spawnMultiplier.ToString("0.##")),
                tooltip: "AMR_SpawnMultiplierTip".Translate());
            float value = listing.Slider(Settings.spawnMultiplier,
                SpawnRules.MinMultiplier, SpawnRules.MaxMultiplier);
            Settings.spawnMultiplier = Mathf.Round(value * 20f) / 20f;
            if (listing.ButtonText("AMR_ResetDefaults".Translate()))
            {
                Settings.ResetToDefaults();
            }
            listing.GapLine();
            listing.Label("AMR_AllowedHeader".Translate());
            float used = listing.CurHeight;
            listing.End();

            List<PawnKindDef> kinds = OwnKinds();
            var outRect = new Rect(inRect.x, inRect.y + used + 6f, inRect.width, inRect.height - used - 6f);
            var viewRect = new Rect(0f, 0f, outRect.width - 16f, kinds.Count * RowHeight);
            Widgets.BeginScrollView(outRect, ref scroll, viewRect);
            for (int i = 0; i < kinds.Count; i++)
            {
                PawnKindDef kind = kinds[i];
                float y = i * RowHeight;
                Widgets.ThingIcon(new Rect(0f, y, RowHeight, RowHeight), kind.race);
                bool allowed = !Settings.IsBlocked(kind.defName);
                bool before = allowed;
                Widgets.CheckboxLabeled(new Rect(RowHeight + 6f, y, viewRect.width - RowHeight - 6f, RowHeight),
                    kind.LabelCap, ref allowed);
                if (allowed != before)
                {
                    if (allowed) Settings.blockedKinds.Remove(kind.defName);
                    else Settings.blockedKinds.Add(kind.defName);
                }
            }
            Widgets.EndScrollView();
        }
    }

    // The same settings, opened from a MainButtons shortcut that is hidden by default.
    public class MainButtonWorker_AlphaMythologySettings : MainButtonWorker
    {
        public override void Activate()
        {
            if (AlphaMythologyRenewMod.Instance != null)
            {
                Find.WindowStack.Add(new Dialog_ModSettings(AlphaMythologyRenewMod.Instance));
            }
        }
    }

    // Wild spawns and migrations ask the biome how common a creature is: answer it here.
    [HarmonyPatch(typeof(BiomeDef), nameof(BiomeDef.CommonalityOfAnimal))]
    public static class BiomeDef_CommonalityOfAnimal_Patch
    {
        public static void Postfix(PawnKindDef animalDef, ref float __result)
        {
            if (AlphaMythologyRenewMod.Settings == null || !AlphaMythologyRenewMod.IsOwnKind(animalDef))
            {
                return;
            }
            __result = SpawnRules.AdjustCommonality(__result,
                AlphaMythologyRenewMod.Settings.spawnMultiplier,
                AlphaMythologyRenewMod.Settings.IsBlocked(animalDef.defName));
        }
    }
}
