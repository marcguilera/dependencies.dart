part of 'package:dependencies/dependencies.dart';

class _EmptyInjector extends Object with DisposableMixin implements Injector {
  @override
  final String name;
  @override
  final Iterable<Binding> bindings = const [];

  _EmptyInjector({String name}) : this.name = _nameOrDefault(name);

  @override
  bool contains<T>({String name}) => false;

  @override
  T get<T>({String name, Params params}) {
    throw InjectionException._internal(
        "Can't get instance from empty injector");
  }

  @override
  Optional<T> getOptional<T>({String name, Params params}) {
    return Optional.absent();
  }

  @override
  void doDispose() {}
}
