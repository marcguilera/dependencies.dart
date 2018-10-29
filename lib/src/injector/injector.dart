part of 'package:dependencies/dependencies.dart';

String _nameOrDefault(String name) => name ?? "injector";

/**
 * Dependency injection container.
 */
abstract class Injector {
  /**
   * The name of the injector.
   */
  String get name;

  /**
   * Gets a list of all the [Binding] instances atacched
   * to this [Injector].
   */
  Iterable<Binding> get bindings;

  /**
   * Gets a dependency from the container with optional [name] and [params].
   */
  T get<T>({String name, Map<String, dynamic> params});

  /**
   * Gets an [Optional] to handle if the registration doesn't exist.
   */
  Optional<T> getOptional<T>({String name, Map<String, dynamic> params});

  /**
   * Checks whether the container has a given binding.
   */
  bool contains<T>({String name});

  /**
   * Creates a [InjectorBuilder] to create [Injector] instances.
   */
  static InjectorBuilder builder() {
    return InjectorBuilder._internal();
  }
}
