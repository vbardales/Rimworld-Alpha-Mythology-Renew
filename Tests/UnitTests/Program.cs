using System;
using AlphaMythologyRenew;

// Rules of the wild-spawn settings that can be proved outside the game. What only a running game
// shows (the window, the effect on real spawns, saving and reloading) is covered by in-game tests.
internal static class Program
{
    private static int failures;

    private static void Check(bool condition, string name)
    {
        Console.WriteLine((condition ? "PASS " : "FAIL ") + name);
        if (!condition) failures++;
    }

    private static bool Near(float a, float b) => Math.Abs(a - b) < 1e-4f;

    private static int Main()
    {
        Check(SpawnRules.DefaultMultiplier == 1f, "default multiplier is 1");
        Check(SpawnRules.MinMultiplier == 0.1f && SpawnRules.MaxMultiplier == 5f, "range is 0.1 to 5");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, 1f, false), 0.5f), "default leaves commonality unchanged");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, 2f, false), 1f), "multiplier scales commonality");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, 0.1f, false), 0.05f), "lower bound 0.1 is accepted");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, 5f, false), 2.5f), "upper bound 5 is accepted");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, 100f, false), 2.5f), "above the range is clamped to 5");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, -3f, false), 0.05f), "below the range is clamped to 0.1");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, float.NaN, false), 0.5f), "NaN falls back to the default");
        Check(Near(SpawnRules.AdjustCommonality(0.5f, float.PositiveInfinity, false), 0.5f), "infinity falls back to the default");
        Check(SpawnRules.AdjustCommonality(0.5f, 3f, true) == 0f, "a blocked creature never spawns");
        Check(SpawnRules.AdjustCommonality(0f, 5f, false) == 0f, "zero commonality stays zero");
        Check(Near(SpawnRules.Sanitize(2.5f), 2.5f), "an in-range value is kept");

        Check(PhoenixRules.ExplosionRadius(0) == 3.9f, "a chick explodes with radius 3.9");
        Check(PhoenixRules.ExplosionRadius(1) == 4.9f, "a juvenile explodes with radius 4.9");
        Check(PhoenixRules.ExplosionRadius(2) == 5.9f && PhoenixRules.ExplosionRadius(5) == 5.9f, "an adult explodes with radius 5.9");
        Check(PhoenixRules.EggCount(0f) == 2 && PhoenixRules.EggCount(0.3f) == 2, "a low roll leaves two eggs");
        Check(PhoenixRules.EggCount(0.31f) == 1 && PhoenixRules.EggCount(1f) == 1, "a higher roll leaves one egg");
        Check(PhoenixRules.EggDefName == "MM_EggPhoenixFertilized", "the egg def name is the fertilized phoenix egg");

        PatchTests.Run(Check);

        Console.WriteLine(failures == 0 ? "ALL PASSED" : failures + " FAILED");
        return failures == 0 ? 0 : 1;
    }
}
