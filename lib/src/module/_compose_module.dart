part of 'package:dependencies/dependencies.dart';

class _ComposeModule implements Module {
  @override
  final String name;
  final Iterable<Module> _modules;

  _ComposeModule(Iterable<Module> modules)
      : _modules = modules,
        name =
            "ComposeModule[${modules.map((module) => module.name).join(",")}]";

  @override
  void configure(Binder binder) {
    _modules.forEach(binder.install);
  }
}
