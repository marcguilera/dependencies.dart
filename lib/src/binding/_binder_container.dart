part of 'package:dependencies/dependencies.dart';

class _BinderContainer extends _RegistrationContainer implements Binder {

  @override
  _Registration<T> bindFactory<T>(ObjectFactory<T> factory, {String name, bool override}) {
    notNull(factory, message: () => "Factory can't be null");
    final registration = _FactoryRegistration(factory, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  _Registration<T> bindLazySingleton<T>(ObjectFactory<T> factory, {String name, bool override}) {
    notNull(factory, message: () => "Factory can't be null");
    final registration = _LazySingletonRegistration(factory, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  _Registration<T> bindSingleton<T>(T instance, {String name, bool override}) {
    notNull(instance, message: () => "Singleton can't be null");
    final registration = _SingletonRegistration(instance, name);
    put(T, name, registration, override: override);
    return registration;
  }

  @override
  Iterable<_Registration> install(Module module) {
    notNull(module, message: () => "Module can't be null");

    final before = registrations.values.toSet();

    try {
      module.configure(this);
    } on InjectionException catch(e) {
      throw InjectionException._internal("Module installation failed with reason: ${e.message}");
    }

    return registrations.values.toSet().difference(before);

  }



}