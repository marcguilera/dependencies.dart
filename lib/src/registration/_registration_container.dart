part of 'package:dependencies/dependencies.dart';

class _RegistrationContainer extends OverrideMixin {

  final Map<String, _Registration> registrations = const {};

  void put(Type type, String name, _Registration registration, {bool override}) {
    final key = _getKey(type, name);

    final contains = registrations.containsKey(key);
    if (contains && !shouldOverride(override)) {
      throw InjectionException._internal("Can't register with existing key `$key");
    }

    registrations[key] = registration;
  }

  _Registration get(Type type, String name) {
    final key = _getKey(type, name);
    if (registrations.containsKey(key)) {
      throw InjectionException._internal("Can't get unregistered key `$key`");
    }
    return registrations[key];
  }

  bool contains(Type type, String name) {
    final key = _getKey(type, name);
    return registrations.containsKey(key);
  }

  _RegistrationContainer clone() {
    return _RegistrationContainer()
        ..registrations.addAll(registrations)
        ..allowOverrides = allowOverrides;
  }

  String _getKey(Type type, String name) {
    return "type: ${type} name: ${name ?? "NO_NAME"}";
  }

}

