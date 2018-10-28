part of 'package:dependencies/dependencies.dart';

/**
 * Represents a factory able to create instances of type [T].
 */
typedef T ObjectFactory<T>(Injector injector, Map args);

/**
 * Represents an object able to bind instances to the dependency injection
 * container.
 */
abstract class Binder {
  /**
   * Creates a binding in the dependency injection container.
   */
  void bind<T>({ObjectFactory<T> factory, T instance, bool isSingleton});

  /**
   * Binds a factory which will create a new instance every time.
   */
  void bindFactory<T>(ObjectFactory<T> factory, {String name});

  /**
   * Binds an instance.
   */
  void bindSingleton<T>(T instance, {String name});

  /**
   * Binds a lazy loaded singleton.
   */
  void bindLazySingleton<T>(ObjectFactory<T> factory, {String name});

  /**
   * Installs all the dependencies from the given [Module].
   */
  void install(Module module);
}