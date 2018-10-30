part of 'package:dependencies/dependencies.dart';

class _SingletonRegistration<T> extends _Registration<T>
    implements SingletonBinding<T> {
  @override
  final T instance;

  _SingletonRegistration(this.instance, String name) : super(name);

  @override
  T getInstance(Injector injector, Map<String, dynamic> params) {
    return instance;
  }
}
