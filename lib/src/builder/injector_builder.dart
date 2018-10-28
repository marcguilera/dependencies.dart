part of 'package:dependencies/dependencies.dart';

/**
 * Builder to create [Injector] instances.
 */
abstract class InjectorBuilder implements Binder {
  /**
   * Builds the [Injector].
   */
  Injector build();
}