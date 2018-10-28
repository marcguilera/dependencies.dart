This is a simple and flexible dependency injection container for dart. It doesn't use reflection so it will work in Flutter.

## Features

- **Immutability:** The injector is created via a builder so it won't be modified after being created.
- **Modules:** Separate dependencies into logical pars. Useful to separate by environments.
- **Singletons:** Bind singletons and lazy singletons.
- **Factories:** Bind factories.
- **Named dependencies:** Give your dependencies custom names.
- **Extra arguments:** Pass arguments to your factory methods.

## Usage

### Set up

Optionally create a module.

```dart
class PlayerModule implements Module {
  @override
  void configure(Binder binder) {
    binder
      ..bindSingleton("playerkey", name: "api_key")
      ..bindFactory((injector, params) => Player(params["playerId"]))
      ..bindLazySingleton((injector, params) => Rest(injector));
  }
}
```

Create a builder and use it to instantiate an injector.

```dart
final builder = Injector.builder()
    ..bind(instance: "abc123", isSingleton: true, name: "api_key")
    ..bindSingleton("abc123", name: "api_key_2")
    ..bindFactory((injector, params) => User(params["userId"]))
    ..bindLazySingleton((injector, params) => RestController(params["path"]))
    ..install(PlayerModule());

final injector = builder.build();
```

### Usage

Get instances from the container.

```dart
final Player player = injector.get(params: {"playerId":1});
final Rest rest = injector.get();
final String apiKey = injector.get(name: "api_key");
```
