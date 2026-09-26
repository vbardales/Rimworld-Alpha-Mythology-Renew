namespace AlphaMythologyRenew
{
    // The numbers of the phoenix's death, with no dependency on the game so that they can be checked on their own
    // (Tests/UnitTests). DeathActionWorker_ExplodeAndSpawnEggs uses them.
    public static class PhoenixRules
    {
        public const string EggDefName = "MM_EggPhoenixFertilized";

        // An adult phoenix goes off harder than a chick: radius by life stage index (0 chick, 1 juvenile, 2 and above adult).
        public static float ExplosionRadius(int lifeStageIndex)
        {
            return lifeStageIndex <= 0 ? 3.9f : (lifeStageIndex == 1 ? 4.9f : 5.9f);
        }

        // One egg, or two three times in ten: the roll is a uniform value in [0, 1].
        public static int EggCount(float roll)
        {
            return roll <= 0.3f ? 2 : 1;
        }
    }
}
