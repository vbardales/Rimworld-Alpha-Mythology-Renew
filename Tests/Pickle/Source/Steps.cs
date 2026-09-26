using System;
using System.Collections.Generic;
using System.Linq;
using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace AlphaMythologyRenew.PickleSteps
{
    /// <summary>
    /// What only a running game can show about the settings: that the window belongs to this mod and edits
    /// the instance the patch reads from, that a changed value reaches the game's own spawn table, that the
    /// shortcut is hidden by its def and opens the same window, that the texts resolve in the language of the
    /// pass, and that a value outlives the process. The game-free rules (bounds, clamping) are proved by
    /// Tests/UnitTests and are not repeated here.
    /// </summary>
    [PickleSteps]
    public class SettingsSteps
    {
        private const string ShortcutDefName = "AMR_Settings";
        private const string KeyPrefix = "AMR_";

        /// <summary>Scenario-local record of the wild commonality, per creature, per biome.</summary>
        private sealed class Recorded
        {
            public readonly Dictionary<string, Dictionary<string, float>> ByKind =
                new Dictionary<string, Dictionary<string, float>>();
        }

        private static AlphaMythologyRenewMod Mod(PickleContext ctx)
        {
            var mod = LoadedModManager.GetMod<AlphaMythologyRenewMod>();
            ctx.Require(mod != null, "AlphaMythologyRenewMod is not loaded in this process");
            return mod;
        }

        private static AlphaMythologySettings Settings(PickleContext ctx)
        {
            var settings = AlphaMythologyRenewMod.Settings;
            ctx.Require(settings != null, "AlphaMythologyRenewMod.Settings is null");
            return settings;
        }

        private static PawnKindDef Kind(PickleContext ctx, string defName)
        {
            var kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(defName);
            ctx.Require(kind != null, $"no PawnKindDef named '{defName}'");
            return kind;
        }

        private static MainButtonDef Shortcut(PickleContext ctx)
        {
            var def = DefDatabase<MainButtonDef>.GetNamedSilentFail(ShortcutDefName);
            ctx.Require(def != null, $"no MainButtonDef named '{ShortcutDefName}'");
            return def;
        }

        private static Dialog_ModSettings OpenDialog(PickleContext ctx)
        {
            var dialog = Find.WindowStack.Windows.OfType<Dialog_ModSettings>().FirstOrDefault();
            ctx.Require(dialog != null, "no Dialog_ModSettings is open");
            return dialog;
        }

        private static Verse.Mod DialogMod(PickleContext ctx)
        {
            var dialog = OpenDialog(ctx);
            var field = typeof(Dialog_ModSettings)
                .GetFields(System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Public
                           | System.Reflection.BindingFlags.NonPublic)
                .FirstOrDefault(f => typeof(Verse.Mod).IsAssignableFrom(f.FieldType));
            ctx.Require(field != null, "Dialog_ModSettings has no Mod-typed field in this game build");
            return field.GetValue(dialog) as Verse.Mod;
        }

        private static Dictionary<string, float> Commonalities(PawnKindDef kind)
        {
            return DefDatabase<BiomeDef>.AllDefsListForReading
                .ToDictionary(b => b.defName, b => b.CommonalityOfAnimal(kind));
        }

        // --- what the mod loaded with ---------------------------------------------------------

        [Then("Alpha Mythology Renew setting {string} reads {float}")]
        public void SettingReads(PickleContext ctx, string field, float expected)
        {
            var settings = Settings(ctx);
            ctx.Require(field == "spawnMultiplier", $"this suite knows no numeric setting named '{field}'");
            ctx.Assert(Math.Abs(settings.spawnMultiplier - expected) < 1e-4f,
                $"'{field}' reads {settings.spawnMultiplier}, expected {expected}");
        }

        [Then("Alpha Mythology Renew {int} creatures are blocked")]
        public void BlockedCount(PickleContext ctx, int expected)
        {
            var actual = Settings(ctx).blockedKinds.Count;
            ctx.Assert(actual == expected, $"{actual} creatures are blocked, expected {expected}");
        }

        [Then("Alpha Mythology Renew the settings list {int} creatures of its own")]
        public void OwnKindCount(PickleContext ctx, int expected)
        {
            var kinds = AlphaMythologyRenewMod.OwnKinds();
            ctx.Assert(kinds.Count == expected,
                $"the window would list {kinds.Count} creatures, expected {expected}: "
                + string.Join(", ", kinds.Select(k => k.defName).ToArray()));
        }

        // --- the window and its two routes ----------------------------------------------------

        [When("Alpha Mythology Renew opens its settings window")]
        public void OpenSettings(PickleContext ctx)
        {
            Find.WindowStack.Add(new Dialog_ModSettings(Mod(ctx)));
        }

        [Then("Alpha Mythology Renew sees its own settings window open")]
        public void SeesOwnDialog(PickleContext ctx)
        {
            var mod = DialogMod(ctx);
            ctx.Assert(mod is AlphaMythologyRenewMod,
                $"the open settings window belongs to '{mod?.GetType().Name ?? "nothing"}'");
        }

        [Then("Alpha Mythology Renew the open window edits the same settings instance")]
        public void SameInstance(PickleContext ctx)
        {
            var mod = DialogMod(ctx) as AlphaMythologyRenewMod;
            ctx.Assert(mod != null, "the open settings window does not belong to Alpha Mythology Renew");
            ctx.Assert(ReferenceEquals(AlphaMythologyRenewMod.Settings, Settings(ctx)),
                "the window edits a different settings object than the one the patch reads");
        }

        // --- changing settings ----------------------------------------------------------------

        [When("Alpha Mythology Renew sets the spawn multiplier to {float}")]
        public void SetMultiplier(PickleContext ctx, float value) => Settings(ctx).spawnMultiplier = value;

        [When("Alpha Mythology Renew blocks the creature {string}")]
        public void Block(PickleContext ctx, string defName)
        {
            Kind(ctx, defName);
            Settings(ctx).blockedKinds.Add(defName);
        }

        [When("Alpha Mythology Renew allows the creature {string} again")]
        public void Allow(PickleContext ctx, string defName) => Settings(ctx).blockedKinds.Remove(defName);

        [When("Alpha Mythology Renew restores its defaults")]
        public void Restore(PickleContext ctx) => Settings(ctx).ResetToDefaults();

        // --- the effect on the game's own spawn table -----------------------------------------

        [When("Alpha Mythology Renew records the wild commonality of {string}")]
        public void Record(PickleContext ctx, string defName)
        {
            var recorded = ctx.Get<Recorded>() ?? new Recorded();
            var values = Commonalities(Kind(ctx, defName));
            ctx.Require(values.Values.Any(v => v > 0f),
                $"'{defName}' has a commonality of zero in every biome before any change: nothing to compare");
            recorded.ByKind[defName] = values;
            ctx.Set(recorded);
        }

        private static Dictionary<string, float> Before(PickleContext ctx, string defName)
        {
            var recorded = ctx.Get<Recorded>();
            ctx.Require(recorded != null && recorded.ByKind.ContainsKey(defName),
                $"no commonality was recorded for '{defName}' in this scenario");
            return recorded.ByKind[defName];
        }

        [Then("Alpha Mythology Renew the wild commonality of {string} is {float} times the recorded one")]
        public void ScaledBy(PickleContext ctx, string defName, float factor)
        {
            var before = Before(ctx, defName);
            var after = Commonalities(Kind(ctx, defName));
            foreach (var biome in before.Keys)
            {
                ctx.Assert(Math.Abs(after[biome] - before[biome] * factor) < 1e-4f,
                    $"in {biome} '{defName}' went from {before[biome]} to {after[biome]}, expected x{factor}");
            }
        }

        [Then("Alpha Mythology Renew the wild commonality of {string} equals the recorded one")]
        public void Unchanged(PickleContext ctx, string defName) => ScaledBy(ctx, defName, 1f);

        [Then("Alpha Mythology Renew the wild commonality of {string} is zero in every biome")]
        public void Zero(PickleContext ctx, string defName)
        {
            var after = Commonalities(Kind(ctx, defName));
            var alive = after.Where(p => p.Value != 0f).Select(p => $"{p.Key}={p.Value}").ToArray();
            ctx.Assert(alive.Length == 0, $"'{defName}' can still appear: {string.Join(", ", alive)}");
        }

        // --- the optional shortcut ------------------------------------------------------------

        [Then("Alpha Mythology Renew the shortcut is hidden on a clean configuration")]
        public void ShortcutHidden(PickleContext ctx)
        {
            var def = Shortcut(ctx);
            ctx.Assert(!def.buttonVisible && !def.Worker.Visible,
                $"the shortcut is visible with buttonVisible={def.buttonVisible} and Worker.Visible={def.Worker.Visible}");
        }

        [When("Alpha Mythology Renew reveals its shortcut as a customization mod would")]
        public void Reveal(PickleContext ctx) => Shortcut(ctx).buttonVisible = true;

        [When("Alpha Mythology Renew hides its shortcut again")]
        public void Hide(PickleContext ctx) => Shortcut(ctx).buttonVisible = false;

        [Then("Alpha Mythology Renew the shortcut is drawn and enabled")]
        public void ShortcutDrawn(PickleContext ctx)
        {
            var worker = Shortcut(ctx).Worker;
            ctx.Assert(worker.Visible, "the revealed shortcut is still not drawn");
            ctx.Assert(!worker.Disabled, "the revealed shortcut is greyed out");
        }

        [When("Alpha Mythology Renew activates its shortcut")]
        public void Activate(PickleContext ctx) => Shortcut(ctx).Worker.Activate();

        // --- translation ----------------------------------------------------------------------

        /// <summary>
        /// Against the language the pass was started in, never a language switched mid-run: that
        /// reloads every def under the runner.
        /// </summary>
        [Then("Alpha Mythology Renew every settings text exists in the language this pass runs")]
        public void EveryKey(PickleContext ctx)
        {
            var active = LanguageDatabase.activeLanguage;
            ctx.Require(active != null, "no active language is loaded");
            var keys = LanguageDatabase.defaultLanguage.keyedReplacements.Keys
                .Where(k => k.StartsWith(KeyPrefix)).ToList();
            ctx.Assert(keys.Count >= 5,
                $"only {keys.Count} English keys start with '{KeyPrefix}', expected at least 5");
            var missing = keys.Where(k => !active.HaveTextForKey(k)).ToList();
            ctx.Assert(missing.Count == 0,
                $"{active.folderName} has no text for: {string.Join(", ", missing.ToArray())}");
        }

        [Then("Alpha Mythology Renew the shortcut is named in the language this pass runs")]
        public void ShortcutLabelled(PickleContext ctx)
        {
            var def = Shortcut(ctx);
            ctx.Assert(!def.LabelCap.NullOrEmpty() && !def.description.NullOrEmpty(),
                "the shortcut carries no label or description");
        }

        // --- restart pair ---------------------------------------------------------------------

        /// <summary>
        /// Set by the writer, read by the reader, never serialized: false in the second process, the only
        /// way the reader can tell that it is a genuine new game rather than memory read back.
        /// </summary>
        private static bool wroteInThisProcess;

        /// <summary>Stands the teardown down for the writer, whose purpose is to leave values behind.</summary>
        private static bool keepSettings;

        [When("Alpha Mythology Renew keeps its settings for the next launch")]
        public void Keep(PickleContext ctx)
        {
            Mod(ctx).WriteSettings();
            wroteInThisProcess = true;
            keepSettings = true;
        }

        [Given("Alpha Mythology Renew the settings kept by the previous launch are in place")]
        public void KeptByPreviousLaunch(PickleContext ctx)
        {
            ctx.Assert(!wroteInThisProcess,
                "the writer ran in THIS process, so nothing here was read back from disk: this is a "
                + "restart test that never restarted. Play the pair with -Filter restart-write "
                + "-Then restart-read, which launches the game twice under one lock.");
            keepSettings = false;
        }

        /// <summary>The file the game holds, not the instance in memory.</summary>
        [Then("Alpha Mythology Renew its settings file records a multiplier of {float} and the blocked creature {string}")]
        public void FileRecords(PickleContext ctx, float multiplier, string blocked)
        {
            var mod = Mod(ctx);
            var path = System.IO.Path.Combine(GenFilePaths.ConfigFolderPath,
                GenText.SanitizeFilename($"Mod_{mod.Content.FolderName}_{mod.GetType().Name}.xml"));
            ctx.Require(System.IO.File.Exists(path), $"no settings file at '{path}'");
            var text = System.IO.File.ReadAllText(path);
            ctx.Assert(text.Contains($"<spawnMultiplier>{multiplier.ToString(System.Globalization.CultureInfo.InvariantCulture)}</spawnMultiplier>")
                       && text.Contains($"<li>{blocked}</li>"),
                $"the settings file does not record x{multiplier} and '{blocked}'. It holds: {text}");
        }

        // --- teardown -------------------------------------------------------------------------

        /// <summary>
        /// After every scenario: settings are global and outlive it, and the shortcut flag is a def field.
        /// A pass that left x5 or a blocked creature behind would change what every later scenario
        /// measures, and the failure would look like the mod's. Wrapped: anything escaping would redden a
        /// scenario whose own steps all passed.
        /// </summary>
        [AfterScenario]
        public void Teardown(PickleContext ctx)
        {
            try
            {
                var def = DefDatabase<MainButtonDef>.GetNamedSilentFail(ShortcutDefName);
                if (def != null) def.buttonVisible = false;
                if (keepSettings) return;
                AlphaMythologyRenewMod.Settings?.ResetToDefaults();
            }
            catch (Exception e)
            {
                Log.Warning($"[Alpha Mythology Renew tests] the scenario's state could not be restored: {e.Message}");
            }
        }
    }
}
