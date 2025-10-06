import '../../modules/pokemon/models/pokemon_details_model.dart';
import '../../modules/pokemon/models/pokemon_model.dart';

abstract class PokeApiInterface {
  Future<List<PokemonModel>> getPokemons({
    required int limit,
    required int offset,
  });

  Future<PokemonDetailModel> getPokemonDetail(String pokemonName);
}
