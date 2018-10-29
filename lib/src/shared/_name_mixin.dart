part of 'package:dependencies/dependencies.dart';

abstract class _NameMixin {
  String name;
  void setName(String name) {
    checkArgument(name != null && name.isNotEmpty,
        message: () => "name can't be null");
    this.name = name;
  }
}
