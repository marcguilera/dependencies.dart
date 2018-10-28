part of 'package:dependencies/dependencies.dart';

class _LazySingletonRegistration<T> implements _Registration<T> {
  T _instance;
  final ObjectFactory<T> _factory;

  _LazySingletonRegistration(this._factory);

  @override
  T instance(Injector injector, Map params) {
    if (_instance == null) {
      _instance = _factory(injector, params);
    }
    return _instance;
  }

}