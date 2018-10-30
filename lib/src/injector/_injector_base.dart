part of 'package:dependencies/dependencies.dart';

abstract class _InjectorBase implements Injector {
  final String name;

  _InjectorBase({String name}) : this.name = _nameOrDefault(name);

  @override
  T get<T>({String name, Map<String, dynamic> params}) {
    return getRegistration<T>(name).getInstance(this, params ?? const {});
  }

  @override
  Optional<T> getOptional<T>({String name, Map<String, dynamic> params}) {
    return contains<T>(name: name)
        ? Optional.of(get<T>(name: name, params: params))
        : Optional.absent();
  }

  _Registration getRegistration<T>(String name);
}
