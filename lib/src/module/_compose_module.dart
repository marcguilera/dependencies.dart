part of 'package:dependencies/dependencies.dart';

class _ComposeModule extends Module {

  @override
  final String name;
  final Iterable<Module> _modules;

  _ComposeModule(Iterable<Module> modules):
        _modules = modules,
        name = "ComposeModule[${modules.map((module) => module.name).join(",")}]",
        super._internal();

  @override
  void configure(Binder binder) {
    _modules.forEach(binder.install);
  }

}