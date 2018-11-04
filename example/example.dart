import 'package:dependencies/dependencies.dart';

void main() {
  final builder = Injector.builder()
    ..bindSingleton("abc123", name: "api_key")
    ..bindLazySingleton((i, p) => Rest(i.get(name: "api_key")))
    ..install(PlayerModule());

  InjectorRegistry.instance.register(builder.build());
  final injector = InjectorRegistry.instance.get();

  final player1 = injector.get<Player>(params: Params.fromMap({"id": "1"}));
  print(player1);
  final player2 = injector.get<Player>(params: Params.fromMap({"id": "2"}));
  print(player2);
  final key = injector.get<String>(name: "api_key");
  print(key);
  final rest = injector.get<Rest>();
  print(rest);
}

class PlayerModule implements Module {
  @override
  void configure(Binder binder) {
    binder..bindFactory((i, p) => Player(p.get("id")));
  }
}

class Player {
  final String id;

  Player(this.id);

  @override
  String toString() {
    return 'Player{id: $id}';
  }
}

class Rest {
  final String key;

  Rest(this.key);

  @override
  String toString() {
    return 'Rest{key: $key}';
  }
}
