part of 'package:dependencies/dependencies.dart';

class _InjectorContainer implements Injector {

  final _RegistrationContainer container;

  _InjectorContainer(this.container);

  @override
  bool contains<T>({String name}) {
    return container.contains<T>(name);
  }

  @override
  T get<T>({String name, Map params}) {
    final registration = container.get<T>(name);
    return registration.instance(this, params);
  }

  @override
  void dispose() {
    container.clear();
  }

}