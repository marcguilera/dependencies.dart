part of 'package:dependencies/dependencies.dart';

/**
 * Dependency injection container.
 */
abstract class Injector {
  /**
   * Gets a dependency from the container with optional [name] and [params].
   */
  T get<T>({String name, Map params});

  /**
   * Checks whether the container has a given binding.
   */
  bool contains<T>({String name});

  /**
   * Deletes all registrations.
   */
  void dispose();

  /**
   * Creates a [InjectorBuilder] instance to create an [Injector].
   */
  static InjectorBuilder builder() => _InjectorBuilderContainer();
}