import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/storage/favorite_storage.dart';
import '../../../services/interfaces/poke_api_interface.dart';
import '../models/pokemon_details_model.dart';
import '../models/pokemon_model.dart';

part 'pokemon_controller.g.dart';

class PokemonController = PokemonControllerBase with _$PokemonController;

abstract class PokemonControllerBase with Store {
  PokeApiInterface pokeApiService = Modular.get<PokeApiInterface>();

  PokemonControllerBase(this.pokeApiService);

  @observable
  ObservableList<PokemonModel> pokemons = ObservableList<PokemonModel>();

  @observable
  ObservableList<String> favorites = ObservableList<String>();

  @observable
  PokemonDetailModel? pokemon;

  @observable
  bool isLoading = false;

  @observable
  String searchPokemon = '';

  @observable
  bool hasMore = true;

  int offset = 0;
  final int limit = 100;

  @action
  void setSearchPokemon(String name) {
    searchPokemon = name.toLowerCase().trim();
  }

  @computed
  List<PokemonModel> get filteredPokemons {
    if (searchPokemon.isEmpty) return pokemons.toList();

    return pokemons
        .where((pokemon) => pokemon.name.toLowerCase().contains(searchPokemon))
        .toList();
  }

  @action
  Future<void> fetchPokemons({bool loadMore = false}) async {
    if (isLoading || !hasMore) return;

    isLoading = true;

    try {
      final result = await pokeApiService.getPokemons(
        limit: limit,
        offset: offset,
      );

      if (result.isEmpty) {
        hasMore = false;
        return;
      }

      pokemons.addAll(result);
      offset += limit;
    } catch (e) {
      print("Erro ao buscar pokémons: $e");
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> reloadPokemons() async {
    pokemons.clear();
    offset = 0;
    hasMore = true;

    await fetchPokemons();
  }

  @action
  Future<void> loadFavorites() async {
    final list = await FavoritesStorage.getFavorites();
    favorites = ObservableList<String>.of(list);
  }

  @action
  Future<void> toggleFavorite(String pokemonName) async {
    if (favorites.contains(pokemonName)) {
      favorites.remove(pokemonName);
    } else {
      favorites.add(pokemonName);
    }

    await FavoritesStorage.saveFavorites(favorites.toList());
  }

  @action
  Future<void> fetchPokemonDetail(String pokemonName) async {
    isLoading = true;

    try {
      pokemon = await pokeApiService.getPokemonDetail(pokemonName);
    } finally {
      isLoading = false;
    }
  }

  bool isFavorite(String pokemonName) {
    return favorites.contains(pokemonName);
  }
}
