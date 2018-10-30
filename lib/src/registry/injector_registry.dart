part of 'package:dependencies/dependencies.dart';

/// Dependency injection container static factory.
abstract class InjectorRegistry {

  /// Gets the singleton instance.
  static final InjectorRegistry instance = InjectorRegistry();

  /// Creates a new [InjectorRegistry] to keep track of different named [Injector].
  /// To use a singleton call [InjectorRegistry.instance].
  factory InjectorRegistry() => _InjectorRegistryContainer();

  /// Enables overriding of [Injector] instances.
  void enableOverriding();


  /// Gets an injector from this [InjectorRegistry].
  Injector get({String name});

  /// Registers the given [Injector] in this [InjectorRegistry].
  void register(Injector injector, {bool override});

  /// Registers many the [Injector] instances in this [InjectorRegistry].
  void registerAll(Iterable<Injector> injectors, {bool override});

  /// Checks whether this [InjectorRegistry] contains an [Injector] instance.
  bool contains({String name});

  /// Cleans up the [Injector] instances.
  void clear();
}

/// Shortcut to inject dependencies using the default injector
/// [InjectorRegistry.instance] default [Injector].
T inject<T>({String name, Map<String, dynamic> params, String injectorName}) {
  return InjectorRegistry.instance
      .get(name: injectorName)
      .get(name: name, params: params);
}

/// Shortcut to inject optional dependencies using the default injector
/// [InjectorRegistry.instance] default [Injector].
Optional<T> injectOptional<T>(
    {String name, String, Map<String, dynamic> params, String injectorName}) {
  return InjectorRegistry.instance
      .get(name: injectorName)
      .getOptional(name: name, params: params);
}