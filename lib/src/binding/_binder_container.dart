part of 'package:dependencies/dependencies.dart';

class _BinderContainer extends _RegistrationContainer implements Binder {

  @override
  void bindFactory<T>(ObjectFactory<T> factory, {String name}) {
    notNull(factory, message: () => "Factory can't be null");
    final key = getName(T, name);
    final registration = _FactoryRegistration(factory);
    put(key, registration);
  }

  @override
  void bindLazySingleton<T>(ObjectFactory<T> factory, {String name}) {
    notNull(factory, message: () => "Factory can't be null");
    final key = getName(T, name);
    final registration = _LazySingletonRegistration(factory);
    put(key, registration);
  }

  @override
  void bindSingleton<T>(T instance, {String name}) {
    notNull(instance, message: () => "Singleton can't be null");
    final key = getName(T, name);
    final registration = _SingletonRegistration(instance);
    put(key, registration);
  }

  @override
  void bind<T>({ObjectFactory<T> factory, T instance, bool isSingleton, String name}) {
    isSingleton ??= false;

    if (isSingleton && instance != null) {
      bindSingleton(instance, name: name);
      return;
    }

    if (isSingleton && factory != null) {
      bindLazySingleton(factory, name: name);
      return;
    }

    if (!isSingleton && factory != null) {
      bindFactory(factory, name: name);
      return;
    }

    throw ArgumentError("Factory and instance are null");
  }

  @override
  void install(Module module) {
    notNull(module, message: () => "Module can't be null");
    module.configure(this);
  }

  String getName(Type type, String name) => "${type}_${name ?? "default"}";



}