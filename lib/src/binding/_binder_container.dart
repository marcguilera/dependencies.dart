part of 'package:dependencies/dependencies.dart';

class _BinderContainer extends _RegistrationContainer implements Binder {
  @override
  _FactoryRegistration<T> bindFactory<T>(ObjectFactory<T> factory,
      {String? name, bool? override}) {
    ArgumentError.checkNotNull(factory, "Factory can't be null");
    final registration = _FactoryRegistration(factory, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  _LazySingletonRegistration<T> bindLazySingleton<T>(ObjectFactory<T> factory,
      {String? name, bool? override}) {
    ArgumentError.checkNotNull(factory, "Factory can't be null");
    final registration = _LazySingletonRegistration(factory, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  _SingletonRegistration<T> bindSingleton<T>(T instance,
      {String? name, bool? override}) {
    ArgumentError.checkNotNull(instance, "Singleton can't be null");
    final registration = _SingletonRegistration(instance, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  Iterable<_Registration> install(Configurer configurer) {
    ArgumentError.checkNotNull(configurer, "configurer can't be null");

    final binder = _ConfigurerBinderContainer(this);

    try {
      configurer.configure(binder);
    } catch (e) {
      throw InjectionException._internal(
          "Configurer installation failed with reason: $e");
    }

    return binder.registrations.values;
  }
}
