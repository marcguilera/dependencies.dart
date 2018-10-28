part of 'package:dependencies/dependencies.dart';

class _SingletonRegistration<T> implements _Registration<T> {
  final T _instance;

  _SingletonRegistration(this._instance);

  @override
  T instance(Injector injector, Map params) {
    return _instance;
  }
}