part of 'package:dependencies/dependencies.dart';

class _LazySingletonRegistration<T> extends _Registration<T>
    implements LazySingletonBinding<T> {
  @override
  T instance;
  @override
  final ObjectFactory<T> factory;
  @override
  bool isInstantiated = false;

  _LazySingletonRegistration(this.factory, String name) : super(name);

  @override
  T getInstance(Injector injector, Map<String, dynamic> params) {
    if (!isInstantiated) {
      instance = factory(injector, params);
      isInstantiated = true;
    }
    return instance;
  }
}
