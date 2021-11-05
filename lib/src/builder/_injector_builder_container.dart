part of 'package:dependencies/dependencies.dart';

class _InjectorBuilderContainer extends _BinderContainer
    implements InjectorBuilder {
  String? name;

  void setName(String name) {
    this.name = name;
  }

  @override
  InjectorBuilder child() {
    return _clone();
  }

  @override
  Injector build() {
    return registrations.isNotEmpty
        ? _InjectorContainer(_clone(), name: name)
        : _EmptyInjector(name: name);
  }

  _InjectorBuilderContainer _clone() {
    return _InjectorBuilderContainer()
      ..name = name
      ..registrations.addAll(registrations);
  }
}
