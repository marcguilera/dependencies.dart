part of 'package:dependencies/dependencies.dart';

/// Dependency injection container static factory.
abstract class InjectorRegistry implements Disposable {
  /// Gets the singleton instance.
  static final InjectorRegistry instance = InjectorRegistry();

  /// Creates a new [InjectorRegistry] to keep track of different named [Injector].
  /// To use a singleton call [InjectorRegistry.instance].
  factory InjectorRegistry() => _InjectorRegistryContainer();

  /// Gets an injector from this [InjectorRegistry].
  Injector get({String name});

  /// Registers the given [Injector] in this [InjectorRegistry].
  void register(Injector injector, {bool override});

  /// Registers many the [Injector] instances in this [InjectorRegistry].
  void registerAll(Iterable<Injector> injectors, {bool override});

  /// Checks whether this [InjectorRegistry] contains an [Injector] instance.
  bool contains({String name});
}
