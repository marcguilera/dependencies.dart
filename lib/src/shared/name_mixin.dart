part of 'package:dependencies/dependencies.dart';

abstract class NameMixin {
  String name;
  void setName(String name) {
    notNull(name, message: () => "name can't be null");
    this.name = name;
  }
}