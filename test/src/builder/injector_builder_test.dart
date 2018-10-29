import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

void main() {

  test("set builder name should set the injector name", () {
    const name = "test_injector";
    final injector = (Injector.builder()..setName(name)).build();
    expect(injector.name, equals(name));
  });

  test("binding a factory returns different instances", () {
    final injector = _newInjector((builder) => builder.bindFactory((i,p) => Object()));
    final instance1 = injector.get<Object>();
    final instance2 = injector.get<Object>();
    expect(instance1, isNot(equals(instance2)));
  });

  test("binding a singleton returns the same instance", () {
    final injector = _newInjector((builder) => builder.bindSingleton(Object()));
    final instance1 = injector.get<Object>();
    final instance2 = injector.get<Object>();
    expect(instance1, equals(instance2));
  });

  test("binding a lazy singleton returns the same instance", () {
    final injector = _newInjector((builder) => builder.bindLazySingleton((i,p) => Object()));
    final instance1 = injector.get<Object>();
    final instance2 = injector.get<Object>();
    expect(instance1, equals(instance2));
  });

  test("installing a module adds its dependencies", () {
    final injector = _newInjector((builder) => builder.install(_MyModule()));
    expect(injector.contains<Object>(), isTrue);
  });

  test("installing all modules adds all dependencies", () {
    final injector = _newInjector((builder) => builder.installAll([_MyModule(), _MyModule2()]));
    expect(injector.contains<Object>(), isTrue);
    expect(injector.contains<String>(), isTrue);
  });

  test("binding named dependency should return the dependency", () {
    const name = "object";
    final injector = _newInjector((builder) => builder.bindSingleton(Object(), name: name));
    expect(injector.contains<Object>(name: name), isTrue);
  });

  test("binding two dependencies with the same id should throw", () {
    final builder = Injector.builder();
    builder.bindSingleton(Object());
    expect(() => builder.bindSingleton(Object()), throwsException);
  });

  test("binding two dependencies with the same id and overriding enabled shouldn't throw", () {
    final builder = Injector.builder();
    builder.enableOverriding();
    expect(() => builder.bindSingleton(Object()), isNot(throwsException));
  });

  test("binding two dependencies with the same id and override = true doesn't throw", () {
    final builder = Injector.builder();
    expect(() => builder.bindSingleton(Object(), override: true), isNot(throwsException));
  });

}

typedef void _BuilderFunc(InjectorBuilder builder);

Injector _newInjector([_BuilderFunc func]) {
  final builder = Injector.builder();
  if(func != null)func(builder);
  return builder.build();
}

class _MyModule extends Module {
  @override
  void configure(Binder binder) {
    binder
      ..bindSingleton(Object());
  }
}

class _MyModule2 extends Module {
  @override
  void configure(Binder binder) {
    binder
      ..bindSingleton("key");
  }
}