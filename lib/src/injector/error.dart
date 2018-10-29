part of 'package:dependencies/dependencies.dart';

class InjectionException implements Exception {
  final String message;

  InjectionException._internal(this.message);

  @override
  String toString() {
    return "InjectionException: $message";
  }
}
