part of 'package:dependencies/dependencies.dart';

class _EmptyParams implements Params {
  @override
  Map<String, dynamic> get map => const {};

  @override
  bool contains(String name) {
    return false;
  }

  @override
  T get<T>(String name) {
    ArgumentError.checkNotNull(name, "name can't be null");
    throw ParamException._internal("No param with name $name");
  }

  @override
  Optional<T> getOptional<T>(String name) {
    ArgumentError.checkNotNull(name, "name can't be null");
    return Optional.absent();
  }
}
