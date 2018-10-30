part of 'package:dependencies/dependencies.dart';

class _BinderContainer extends _RegistrationContainer implements Binder {
  @override
  _FactoryRegistration<T> bindFactory<T>(ObjectFactory<T> factory,
      {String name, bool override}) {
    checkNotNull(factory, message: () => "Factory can't be null");
    final registration = _FactoryRegistration(factory, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  _LazySingletonRegistration<T> bindLazySingleton<T>(ObjectFactory<T> factory,
      {String name, bool override}) {
    checkNotNull(factory, message: () => "Factory can't be null");
    final registration = _LazySingletonRegistration(factory, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  _SingletonRegistration<T> bindSingleton<T>(T instance,
      {String name, bool override}) {
    checkNotNull(instance, message: () => "Singleton can't be null");
    final registration = _SingletonRegistration(instance, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  Iterable<_Registration> install(Module module) {
    checkNotNull(module, message: () => "module can't be null");

    final binder = _ModuleBinderContainer(this);

    try {
      module.configure(binder);
    } catch (e) {
      throw InjectionException._internal(
          "Module installation failed with reason: $e");
    }

    return binder.registrations.values;
  }
}
