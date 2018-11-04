part of 'package:dependencies/dependencies.dart';

class _MapParams implements Params {
  final Map<String, dynamic> delegate;
  @override
  Map<String, dynamic> get map => Map.from(delegate);
  _MapParams(this.delegate);

  @override
  bool contains(String name) {
    checkNotNull(name, message: () => "name can't be null");
    return delegate.containsKey(name);
  }

  @override
  T get<T>(String name) {
    if (!contains(name)) {
      throw ParamException._internal("No param found for $name");
    }
    return delegate[name] as T;
  }

  @override
  Optional<T> getOptional<T>(String name) {
    checkNotNull(name, message: () => "name can't be null");
    return Optional.fromNullable(delegate[name] as T);
  }
}
