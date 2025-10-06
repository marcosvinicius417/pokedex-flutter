import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../pokemon/controller/pokemon_controller.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final PokemonController pokemonController = Modular.get<PokemonController>();

  Future<void> initApp() async {
    try {
      await pokemonController.fetchPokemons();
      await pokemonController.loadFavorites();

      await Future.delayed(const Duration(seconds: 2));

      Modular.to.navigate('/home');
    } catch (e) {
      print('Erro ao inicializar app: $e');
    }
  }
}
