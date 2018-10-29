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
    final item = contains<T>(name: name) ? get<T>(name: name, params: params) : null;
    return Optional.fromNullable(item);
  }

  _Registration getRegistration<T>(String name);

}