import 'package:flutter_modular/flutter_modular.dart';
import 'views/pokemon_details_page.dart';

class PokemonModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/details',
      child: (context) {
        final pokemon = Modular.args.data;
        return PokemonDetailPage(pokemonName: pokemon);
      },
    );
  }
}
