import '../../core/interfaces/http_interface.dart';
import '../../modules/pokemon/models/pokemon_details_model.dart';
import '../../modules/pokemon/models/pokemon_model.dart';
import '../interfaces/poke_api_interface.dart';

class PokeApiService implements PokeApiInterface {
  final HttpInterface http;

  PokeApiService({required this.http});

  @override
  Future<List<PokemonModel>> getPokemons({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await http.get(
        'pokemon',
        queryParameters: {'limit': limit, 'offset': offset},
      );

      final List results = response.data['results'];

      return results.map((json) => PokemonModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonDetailModel> getPokemonDetail(String pokemonName) async {
    try {
      final response = await http.get(
        'pokemon/$pokemonName',
        queryParameters: {},
      );

      return PokemonDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
