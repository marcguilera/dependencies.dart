part of 'package:dependencies/dependencies.dart';

/// A module to configure injection bindings.
abstract class Module implements Configurer {
  /// Creates a [Module] resulting in the merge of the given modules.
  /// You can also compose modules using [Binder.install] in your [Module.configure].
  factory Module.compose(Iterable<Module> modules) {
    checkNotNull(modules, message: () => "modules can't be null");
    return _ComposeModule(modules);
  }

  /// Creates an empty [Module].
  factory Module.empty() {
    return _EmptyModule();
  }
}
