part of 'package:dependencies/dependencies.dart';

/// Used to create a [Params] instance.
class ParamsBuilder {
  Map<String, dynamic> _map = {};

  /// Puts a value in the params
  void put<T>(String name, {T value}) {
    _map[name] = value;
  }

  /// Puts a value only if it hasn't ben added before.
  void putIfAbsent<T>(String name, {T value}) {
    _map.putIfAbsent(name, () => value);
  }

  /// Puts all entries from a [Map]
  void putMap(Map<String, dynamic> map) {
    checkNotNull(map, message: () => "map can't be null");
    _map.addAll(map);
  }

  /// Puts all the entries from another [Params].
  void putParams(Params other) {
    checkNotNull(other, message: () => "puts all params from another");
    putMap(other.map);
  }

  Params build() {
    return _map.isEmpty ? _EmptyParams() : _MapParams(_map);
  }
}
