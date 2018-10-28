part of 'package:dependencies/dependencies.dart';

class _FactoryRegistration<T> implements _Registration<T> {
  final ObjectFactory<T> _factory;

  _FactoryRegistration(this._factory);

  @override
  T instance(Injector injector, Map params) {
    return _factory(injector, params);
  }
}