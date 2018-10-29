part of 'package:dependencies/dependencies.dart';

class _SingletonRegistration<T> extends _Registration<T> {
  @override
  bool get isSingleton => true;

  final T instance;

  _SingletonRegistration(this.instance, String name) : super(name);

  @override
  T getInstance(Injector injector, Map<String, dynamic> params) {
    return instance;
  }
}
