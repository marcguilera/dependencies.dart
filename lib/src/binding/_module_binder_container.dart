part of 'package:dependencies/dependencies.dart';

class _ModuleBinderContainer extends _BinderContainer {
  final _BinderContainer _wrapped;

  _ModuleBinderContainer(this._wrapped);

  @override
  void enableOverriding() {
    _wrapped.enableOverriding();
  }

  @override
  void put(Type type, String name, _Registration registration,
      {bool override}) {
    super.put(type, name, registration, override: override);
    _wrapped.put(type, name, registration, override: override);
  }

  @override
  bool contains(Type type, String name) {
    return _wrapped.contains(type, name);
  }

  @override
  _Registration get(Type type, String name) {
    return _wrapped.get(type, name);
  }
}
