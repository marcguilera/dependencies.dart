part of 'package:dependencies/dependencies.dart';

class _RegistrationContainer {
  Map<String, _Registration> registrations = {};

  void put<T>(String key, _Registration registration) {
    if (registrations.containsKey(key)) {
      throw InjectionError._internal("Can't add already registered key `$key`");
    }
    registrations[key] = registration;
  }

  _Registration<T> get<T>(String key) {
    if (registrations.containsKey(key)) {
      throw InjectionError._internal("Can't get already unregistered key `$key`");
    }
    return registrations[key];
  }

  bool contains<T>(String key) {
    return registrations.containsKey(key);
  }

  void clear() {
    registrations.clear();
  }
}

