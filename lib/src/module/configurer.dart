part of 'package:dependencies/dependencies.dart';

/// Represents an object able to configure bindings.
abstract class Configurer {
  /// Used to configure all the dependencies.
  void configure(Binder binder);
}
