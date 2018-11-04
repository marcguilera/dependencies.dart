part of 'package:dependencies/dependencies.dart';

/// Builder to create [Injector] instances.
abstract class InjectorBuilder implements Binder {
  /// Sets the name of the injector.
  void setName(String name);

  /// Creates another [InjectorBuilder] with the bindings of this
  /// InjectorBuilder].
  InjectorBuilder child();

  /// Builds the [Injector]. Note that anything
  /// binded to this [InjectorBuilder] won't make it to the [Injector].
  Injector build();
}
