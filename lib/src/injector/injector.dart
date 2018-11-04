part of 'package:dependencies/dependencies.dart';

String _nameOrDefault(String name) => name ?? "injector";

/// Dependency injection container.
abstract class Injector implements Disposable {
  /// The name of the injector.
  String get name;

  /// Gets a list of all the [Binding] instances attached
  /// to this [Injector].
  Iterable<Binding> get bindings;

  /// Gets a dependency from the container with optional [name] and [params].
  T get<T>({String name, Params params});

  /// Gets an [Optional] to handle if the registration doesn't exist.
  Optional<T> getOptional<T>({String name, Params params});

  /// Checks whether the container has a given binding.
  bool contains<T>({String name});

  /// Disposes this [Injector] which will clear all the
  /// dependencies and call [Disposable.dispose] on all
  /// singletons implementing the [Disposable] interface.
  @override
  void dispose();

  /// Creates a [InjectorBuilder] to create [Injector] instances.
  static InjectorBuilder builder() {
    return InjectorBuilder();
  }
}
