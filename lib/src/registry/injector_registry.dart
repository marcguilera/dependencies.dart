part of 'package:dependencies/dependencies.dart';

/**
 * Dependency injection container static factory.
 */
abstract class InjectorRegistry {

  /**
   * Gets the singleton instance.
   */
  static InjectorRegistry get instance => _InjectorRegistryContainer.instance;

  /**
   * Allows to use the new syntax but will always
   * return the same instance for the [InjectorRegistry].
   * Equivalent to calling [InjectorRegistry.instance].
   */
  factory InjectorRegistry() => instance;

  /**
   * Enables overriding of [Injector] instances.
   */
  void enableOverriding();

  /**
   * Gets an injector from this [InjectorRegistry].
   */
  Injector get({String name});

  /**
   * Registers the given [Injector] in this [InjectorRegistry].
   */
  void register(Injector injector, {bool override});

  /**
   * Registers many the [Injector] instances in this [InjectorRegistry].
   */
  void registerAll(Iterable<Injector> injectors, {bool override});

  /**
   * Checks whether this [InjectorRegistry] contains an [Injector] instance.
   */
  bool contains({String name});

  /**
   * Cleans up the [Injector] instances.
   */
  void clear();
}