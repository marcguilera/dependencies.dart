part of 'package:dependencies/dependencies.dart';

/**
 * A module to configure injection bindings.
 */
abstract class Module {

  /**
   * Used to configure all the dependencies for this module.
   */
  void configure(Binder binder);
}