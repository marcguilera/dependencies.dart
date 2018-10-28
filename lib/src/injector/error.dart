part of 'package:dependencies/dependencies.dart';

class InjectionError extends StateError {
  InjectionError._internal(String message) : super(message);

  @override
  String toString() {
    return "InjectionError: $message";
  }

}