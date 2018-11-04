part of 'package:dependencies/dependencies.dart';

/// Represents a factory able to create instances of type [T].
typedef T ObjectFactory<T>(Injector injector, Params params);

/// A function used to add the bindings to an [Injector].
typedef void BindFunc(Binder binder);

/// Represents an object able to bind instances to the dependency injection
/// container.
abstract class Binder implements Installer {
  /// Binds a factory which will create a new instance every time.
  FactoryBinding<T> bindFactory<T>(ObjectFactory<T> factory,
      {String name, bool override});

  /// Binds an instance.
  SingletonBinding<T> bindSingleton<T>(T instance,
      {String name, bool override});

  /// Binds a lazy loaded singleton.
  LazySingletonBinding<T> bindLazySingleton<T>(ObjectFactory<T> factory,
      {String name, bool override});
}
