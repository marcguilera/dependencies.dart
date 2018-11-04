part of 'package:dependencies/dependencies.dart';

class _FactoryRegistration<T> extends _Registration<T>
    implements FactoryBinding<T> {
  @override
  final ObjectFactory<T> factory;

  _FactoryRegistration(this.factory, String name) : super(name);

  @override
  T getInstance(Injector injector, Params params) {
    return factory(injector, params);
  }

  @override
  void doDispose() {}
}
