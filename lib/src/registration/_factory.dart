part of 'package:dependencies/dependencies.dart';

class _FactoryRegistration<T> extends _Registration<T> {
  @override
  bool get isSingleton => false;

  final ObjectFactory<T> factory;

  _FactoryRegistration(this.factory, String name) : super(name);

  @override
  T getInstance(Injector injector, Map<String, dynamic> params) {
    return factory(injector, params);
  }
}
