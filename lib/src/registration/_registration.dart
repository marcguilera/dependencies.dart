part of 'package:dependencies/dependencies.dart';

abstract class _Registration<T> {
  T instance(Injector injector, Map params);
}