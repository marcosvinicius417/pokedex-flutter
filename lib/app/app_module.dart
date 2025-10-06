import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/interfaces/http_interface.dart';
import 'modules/home/home_module.dart';
import 'modules/pokemon/controller/pokemon_controller.dart';
import 'modules/pokemon/pokemon_module.dart';
import 'services/http/http.dart';
import 'modules/splash/splash_module.dart';
import 'services/interfaces/poke_api_interface.dart';
import 'services/pokeapi/poke_api_service.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(() => Dio());
    i.add<HttpInterface>(Http.new);
    i.add<PokeApiInterface>(PokeApiService.new);
    i.addSingleton<PokemonController>(PokemonController.new);
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module('/home', module: HomeModule());
    r.module('/pokemon', module: PokemonModule());
  }
}
