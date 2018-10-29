part of 'package:dependencies/dependencies.dart';

class _LazySingletonRegistration<T> extends _Registration<T> {
  T instance;
  final ObjectFactory<T> factory;

  @override
  bool get isSingleton => true;

  _LazySingletonRegistration(this.factory, String name) : super(name);

  @override
  T getInstance(Injector injector, Map<String, dynamic> params) {
    if (instance == null) {
      instance = factory(injector, params);
    }
    return instance;
  }
}
