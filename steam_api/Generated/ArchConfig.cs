namespace SteamEmulator;

public static class ArchConfig
{
#if TARGET_64BIT
    public const int PACK = 8;
#else
    public const int PACK = 4;
#endif
}