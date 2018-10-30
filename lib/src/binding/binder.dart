part of 'package:dependencies/dependencies.dart';

/**
 * Represents a factory able to create instances of type [T].
 */
typedef T ObjectFactory<T>(Injector injector, Map<String, dynamic> params);

/**
 * Represents an object able to bind instances to the dependency injection
 * container.
 */
abstract class Binder {
  /**
   * Call this if this [Binder] should override registrations instead of throwing.
   */
  void enableOverriding();

  /**
   * Binds a factory which will create a new instance every time.
   */
  FactoryBinding<T> bindFactory<T>(ObjectFactory<T> factory,
      {String name, bool override});

  /**
   * Binds an instance.
   */
  SingletonBinding<T> bindSingleton<T>(T instance,
      {String name, bool override});

  /**
   * Binds a lazy loaded singleton.
   */
  LazySingletonBinding<T> bindLazySingleton<T>(ObjectFactory<T> factory,
      {String name, bool override});

  /**
   * Installs all the dependencies from the given [Module].
   */
  Iterable<Binding> install(Module module);
}
