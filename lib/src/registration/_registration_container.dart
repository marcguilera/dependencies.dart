part of 'package:dependencies/dependencies.dart';

class _RegistrationContainer extends Object with DisposableMixin {
  final Map<String, _Registration> registrations = {};

  void put(Type type, String name, _Registration registration,
      {bool override}) {
    final key = _getKey(type, name);

    final contains = registrations.containsKey(key);
    final isOverrideEnabled = override ?? false;
    if (contains && !isOverrideEnabled) {
      throw InjectionException._internal(
          "Can't register with existing key `$key");
    }
    registrations[key] = registration;
  }

  _Registration get(Type type, String name) {
    final key = _getKey(type, name);
    if (!registrations.containsKey(key)) {
      throw InjectionException._internal("Can't get unregistered key `$key`");
    }
    return registrations[key];
  }

  bool contains(Type type, String name) {
    final key = _getKey(type, name);
    return registrations.containsKey(key);
  }

  String _getKey(Type type, String name) {
    return "type:${type}_name:${name ?? "default"}";
  }

  @override
  void doDispose() {
    final values = registrations.values;
    values.forEach((disposable) => disposable.dispose());
    registrations.clear();
  }
}
