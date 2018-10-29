part of 'package:dependencies/dependencies.dart';

class _EmptyModule extends Module {

  @override
  final String name = "EmptyModule";

  _EmptyModule() : super._internal();

  @override
  void configure(Binder binder) {}
}