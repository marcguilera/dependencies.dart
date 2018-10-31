part of 'package:dependencies/dependencies.dart';

/// Utility to get the default injector from the registry.
class InjectorMixin {
  /// Gets the [Injector].
  Injector getInjector({String name}) {
    return InjectorRegistry.instance.get(name: name);
  }
}
