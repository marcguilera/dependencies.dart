part of 'package:dependencies/dependencies.dart';

class ParamException implements Exception {
  final String message;

  ParamException._internal(this.message);

  @override
  String toString() {
    return "ParamException: $message";
  }
}
