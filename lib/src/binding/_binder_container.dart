part of 'package:dependencies/dependencies.dart';

class _BinderContainer extends _RegistrationContainer implements Binder {
  @override
  _Registration<T> bindFactory<T>(ObjectFactory<T> factory,
      {String name, bool override}) {
    checkNotNull(factory, message: () => "Factory can't be null");
    final registration = _FactoryRegistration(factory, name);
    return put(T, name, registration, override: override);
  }

  @override
  _Registration<T> bindLazySingleton<T>(ObjectFactory<T> factory,
      {String name, bool override}) {
    checkNotNull(factory, message: () => "Factory can't be null");
    final registration = _LazySingletonRegistration(factory, name);
    return put(T, name, registration, override: override);
  }

  @override
  _Registration<T> bindSingleton<T>(T instance, {String name, bool override}) {
    checkNotNull(instance, message: () => "Singleton can't be null");
    final registration = _SingletonRegistration(instance, name);
    return put(T, name, registration, override: override);
  }

  @override
  Iterable<_Registration> install(Module module) {
    checkNotNull(module, message: () => "module can't be null");

    final binder = _newModuleBinder();

    try {
      module.configure(binder);
    } catch (e) {
      throw InjectionException._internal(
          "Module installation failed with reason: $e");
    }

    return binder.registrations.values;
  }

  @override
  Iterable<Binding> installAll(Iterable<Module> modules) {
    checkNotNull(modules, message: () => "modules can't be null");

    final module = Module.compose(modules);
    return install(module);
  }

  _ModuleBinderContainer _newModuleBinder() {
    return _ModuleBinderContainer(this);
  }
}
