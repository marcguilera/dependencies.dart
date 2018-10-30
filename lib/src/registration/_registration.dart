part of 'package:dependencies/dependencies.dart';

abstract class _Registration<T> extends Binding<T> {
  @override
  Type get type => T;
  @override
  final String name;

  _Registration(this.name);

  T getInstance(Injector injector, Map<String, dynamic> params);

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
