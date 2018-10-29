part of 'package:dependencies/dependencies.dart';

abstract class _InjectorBase implements Injector {

  final String name;

  _InjectorBase({String name}):
      this.name = _nameOrDefault(name);

  @override
  T get<T>({String name, Map<String, dynamic> params}) {
    return getRegistration<T>(name).getInstance(this, params ?? const {});
  }

  @override
  Optional<T> getOptional<T>({String name, Map<String, dynamic> params}) {

    if (!contains<T>(name: name)) {
      return Optional.empty();
    }

    return Optional.of(get<T>(name: name, params: params));
  }

  _Registration getRegistration<T>(String name);

}