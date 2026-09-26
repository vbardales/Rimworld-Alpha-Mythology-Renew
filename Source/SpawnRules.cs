namespace AlphaMythologyRenew
{
    // The rules of the wild-spawn settings, with no dependency on the game so that they can be
    // checked on their own (Tests/UnitTests). The settings window and the biome patch use them.
    public static class SpawnRules
    {
        public const float DefaultMultiplier = 1f;
        public const float MinMultiplier = 0.1f;
        public const float MaxMultiplier = 5f;

        // Brings any stored or typed value back into the allowed range; a corrupt one becomes the default.
        public static float Sanitize(float multiplier)
        {
            if (float.IsNaN(multiplier) || float.IsInfinity(multiplier))
            {
                return DefaultMultiplier;
            }
            return multiplier < MinMultiplier ? MinMultiplier : (multiplier > MaxMultiplier ? MaxMultiplier : multiplier);
        }

        // A blocked creature never turns up; the others are scaled.
        public static float AdjustCommonality(float commonality, float multiplier, bool blocked)
        {
            return blocked ? 0f : commonality * Sanitize(multiplier);
        }
    }
}
