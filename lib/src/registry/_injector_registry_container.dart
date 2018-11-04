part of 'package:dependencies/dependencies.dart';

class _InjectorRegistryContainer extends Object
    with DisposableMixin
    implements InjectorRegistry {
  final Map<String, Injector> _map = {};

  @override
  Injector get({String name}) {
    final injector = _map[_nameOrDefault(name)];
    if (injector == null) {
      throw InjectionException._internal(
          "Injector with name `$name` does not exist");
    }
    return injector;
  }

  @override
  void register(Injector injector, {bool override}) {
    checkNotNull(injector, message: () => "injector can't be null");

    final name = injector.name;

    if (_map.containsKey(name) && !override) {
      throw InjectionException._internal(
          "Injector with name `$name` already exists");
    }

    _map[name] = injector;
  }

  @override
  void registerAll(Iterable<Injector> injectors, {bool override}) {
    checkNotNull(injectors, message: () => "injectors can't be null");
    injectors.forEach((injector) => register(injector, override: override));
  }

  @override
  bool contains({String name}) {
    return _map.containsKey(_nameOrDefault(name));
  }

  @override
  void doDispose() {
    _map.values.forEach((injector) => injector.dispose());
    _map.clear();
  }
}
