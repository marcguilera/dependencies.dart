part of 'package:dependencies/dependencies.dart';

class _InjectorBuilderContainer extends _BinderContainer with _NameMixin implements InjectorBuilder {

  @override
  InjectorBuilder child() {
    return _clone();
  }

  @override
  Injector build() {
    return _InjectorContainer(_clone(), name: name);
  }

  _InjectorBuilderContainer _clone() {
    return _InjectorBuilderContainer()
        ..name = name
        ..allowOverrides = allowOverrides
        ..registrations.addAll(registrations);
  }

}