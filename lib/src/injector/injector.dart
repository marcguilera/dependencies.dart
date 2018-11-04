part of 'package:dependencies/dependencies.dart';

/// A function to set up bindings.
typedef void BinderFunc(Binder binder);

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

  /// Creates an [Injector] from it's bindings.
  factory Injector(BinderFunc binderFunc, {String name}) {
    checkNotNull(binderFunc, message: () => "binderFunc can't be null");
    final b = builder();
    if (name != null) b.setName(name);
    binderFunc(b);
    return b.build();
  }

  /// Creates a [InjectorBuilder] to create [Injector] instances.
  static InjectorBuilder builder() {
    return InjectorBuilder();
  }
}
