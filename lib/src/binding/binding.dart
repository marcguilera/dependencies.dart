part of 'package:dependencies/dependencies.dart';

/// Represents an factory of singleton binding
/// kept by an [Injector].
abstract class Binding<T> {
  /// The type of this [Binding]
  Type get type;

  /// The name of this [Binding] or `null`.
  String get name;
}

/// Represents a [Binding] containing an instance.
abstract class InstanceBinding<T> implements Binding<T> {
  /// Gets the underlying instance.
  T get instance;
}

/// Represents a [Binding] containing an object factory.
abstract class ObjectFactoryBinding<T> implements Binding<T> {
  /// Gets the binded factory.
  ObjectFactory<T> get factory;
}

/// Represents a Singleton [Binding]
abstract class SingletonBinding<T> implements InstanceBinding<T> {}

/// Represents a lazy singleton [Binding].
abstract class LazySingletonBinding<T>
    implements InstanceBinding<T>, ObjectFactoryBinding<T> {
  /// Whether the instance has been evaluated.
  bool get isInstantiated;
}

/// Represents a factory [Binding]
abstract class FactoryBinding<T> implements ObjectFactoryBinding<T> {}
