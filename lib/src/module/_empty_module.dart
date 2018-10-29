part of 'package:dependencies/dependencies.dart';

class _EmptyModule implements Module {
  @override
  final String name = "EmptyModule";

  _EmptyModule();

  @override
  void configure(Binder binder) {}
}
