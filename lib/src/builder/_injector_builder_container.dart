part of 'package:dependencies/dependencies.dart';

class _InjectorBuilderContainer extends _BinderContainer with NameMixin implements InjectorBuilder {

  @override
  InjectorBuilder child() {
    return clone();
  }

  @override
  Injector build() {
    return _InjectorContainer(clone(), name: name);
  }

  @override
  _InjectorBuilderContainer clone() {
    return _InjectorBuilderContainer()
        ..name = name
        ..allowOverrides = allowOverrides
        ..registrations.addAll(registrations);
  }

}