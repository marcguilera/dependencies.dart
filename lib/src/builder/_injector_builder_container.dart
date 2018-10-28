part of 'package:dependencies/dependencies.dart';

class _InjectorBuilderContainer extends _BinderContainer implements InjectorBuilder {
  @override
  Injector build() => _InjectorContainer(this);
}