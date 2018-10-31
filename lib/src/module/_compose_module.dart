part of 'package:dependencies/dependencies.dart';

class _ComposeModule implements Module {
  final Iterable<Module> modules;

  _ComposeModule(this.modules);

  @override
  void configure(Binder binder) {
    modules.forEach(binder.install);
  }
}
