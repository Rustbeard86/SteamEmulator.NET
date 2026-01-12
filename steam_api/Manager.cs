using System;
using System.Collections.Concurrent;

namespace SteamEmulator;

public static partial class Manager
{
    private static readonly ConcurrentDictionary<Type, object> _implementations = new();

    static Manager()
    {
        RegisterGeneratedStubs();
    }

    /// <summary>
    ///     Implemented in generated code.
    /// </summary>
    static partial void RegisterGeneratedStubs();

    /// <summary>
    ///     Registers a custom implementation for a specific Interface Logic.
    /// </summary>
    public static void Register<T>(T implementation) where T : class
    {
        _implementations[typeof(T)] = implementation;
    }

    /// <summary>
    ///     Retrieves the registered implementation for the requested Interface Logic.
    ///     Defaults to the auto-generated Stub if no custom implementation is registered.
    /// </summary>
    public static T GetImplementation<T>() where T : class
    {
        if (_implementations.TryGetValue(typeof(T), out var impl)) return (T)impl;

        throw new InvalidOperationException(
            $"No implementation or default stub found for {typeof(T).Name}. Ensure the Stub exists or register a custom implementation.");
    }
}