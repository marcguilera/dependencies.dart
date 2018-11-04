part of 'package:dependencies/dependencies.dart';

class _LazySingletonRegistration<T> extends _Registration<T>
    implements LazySingletonBinding<T> {
  @override
  T instance;
  @override
  final ObjectFactory<T> factory;
  @override
  bool get isInstantiated => instance != null;

  _LazySingletonRegistration(this.factory, String name) : super(name);

  @override
  T getInstance(Injector injector, Params params) {
    if (!isInstantiated) {
      instance = factory(injector, params);
      checkNotNull(instance, message: () => "factory returned a null instance");
    }
    return instance;
  }

  @override
  void doDispose() {
    if (isInstantiated && instance is Disposable) {
      final disposable = instance as Disposable;
      disposable.dispose();
    }
  }
}
