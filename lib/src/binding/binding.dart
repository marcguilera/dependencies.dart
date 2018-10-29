part of 'package:dependencies/dependencies.dart';

/**
 * Represents an factory of singleton binding
 * kept by an [Injector].
 */
abstract class Binding<T> {
  /**
   * Whether the binding is a singleton.
   */
  bool get isSingleton => true;

  /**
   * The time of this [Binding]
   */
  Type get type;

  /**
   * The name of this [Binding] or `null`.
   */
  String get name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _Registration &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              type == other.type;

  @override
  int get hashCode => "${name}:${type}".hashCode;
}