import 'package:dependencies/dependencies.dart';

void main () {
  final builder = Injector.builder()
      ..bindSingleton("abc123", name: "api_key")
      ..bindLazySingleton((i, p) => Rest(i.get(name: "api_key")))
      ..bindFactory((i, p) => Player(p["id"]));

  InjectorRegistry.instance.register(builder.build());
  final injector = InjectorRegistry.instance.get();

  final player1 = injector.get<Player>(params: {"id":"1"});
  final player2 = injector.get<Player>(params: {"id":"2"});
  final key = injector.get<String>(name: "api_key");
  final rest = injector.get<Rest>();
}

class Player {
  final String id;
  Player(this.id);
}

class Rest {
  final String key;
  Rest(this.key);
}