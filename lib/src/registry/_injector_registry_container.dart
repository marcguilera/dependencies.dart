part of 'package:dependencies/dependencies.dart';

class _InjectorRegistryContainer extends Object with OverrideMixin implements InjectorRegistry {

  static final _InjectorRegistryContainer instance = _InjectorRegistryContainer();

  final Map<String, Injector> _map = const {};

  @override
  Injector get({String name}) {
    final injector = _map[_nameOrDefault(name)];
    if (injector == null) {
      throw InjectionException._internal("Injector with name `$name` does not exist");
    }
    return injector;
  }

  @override
  void register(Injector injector, {bool override}) {
    notNull(injector, message: () => "injector can't be null");

    final name = injector.name;

    if (_map.containsKey(name) && !shouldOverride(override)) {
      throw InjectionException._internal("Injector with name `$name` already exists");
    }

    _map[name] = injector;
  }

  @override
  void registerAll(Iterable<Injector> injectors, {bool override}) {
    notNull(injectors, message: () => "injectors can't be null");
    injectors.forEach((injector) => register(injector, override: override));
  }

  @override
  bool contains({String name}) {
    return _map.containsKey(_nameOrDefault(name));
  }

  @override
  void clear() {
    _map.clear();
  }

}