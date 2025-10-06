// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonController on PokemonControllerBase, Store {
  Computed<List<PokemonModel>>? _$filteredPokemonsComputed;

  @override
  List<PokemonModel> get filteredPokemons =>
      (_$filteredPokemonsComputed ??= Computed<List<PokemonModel>>(
        () => super.filteredPokemons,
        name: 'PokemonControllerBase.filteredPokemons',
      )).value;

  late final _$pokemonsAtom = Atom(
    name: 'PokemonControllerBase.pokemons',
    context: context,
  );

  @override
  ObservableList<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$favoritesAtom = Atom(
    name: 'PokemonControllerBase.favorites',
    context: context,
  );

  @override
  ObservableList<String> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<String> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$pokemonAtom = Atom(
    name: 'PokemonControllerBase.pokemon',
    context: context,
  );

  @override
  PokemonDetailModel? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonDetailModel? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: 'PokemonControllerBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchPokemonAtom = Atom(
    name: 'PokemonControllerBase.searchPokemon',
    context: context,
  );

  @override
  String get searchPokemon {
    _$searchPokemonAtom.reportRead();
    return super.searchPokemon;
  }

  @override
  set searchPokemon(String value) {
    _$searchPokemonAtom.reportWrite(value, super.searchPokemon, () {
      super.searchPokemon = value;
    });
  }

  late final _$hasMoreAtom = Atom(
    name: 'PokemonControllerBase.hasMore',
    context: context,
  );

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$fetchPokemonsAsyncAction = AsyncAction(
    'PokemonControllerBase.fetchPokemons',
    context: context,
  );

  @override
  Future<void> fetchPokemons({bool loadMore = false}) {
    return _$fetchPokemonsAsyncAction.run(
      () => super.fetchPokemons(loadMore: loadMore),
    );
  }

  late final _$reloadPokemonsAsyncAction = AsyncAction(
    'PokemonControllerBase.reloadPokemons',
    context: context,
  );

  @override
  Future<void> reloadPokemons() {
    return _$reloadPokemonsAsyncAction.run(() => super.reloadPokemons());
  }

  late final _$loadFavoritesAsyncAction = AsyncAction(
    'PokemonControllerBase.loadFavorites',
    context: context,
  );

  @override
  Future<void> loadFavorites() {
    return _$loadFavoritesAsyncAction.run(() => super.loadFavorites());
  }

  late final _$toggleFavoriteAsyncAction = AsyncAction(
    'PokemonControllerBase.toggleFavorite',
    context: context,
  );

  @override
  Future<void> toggleFavorite(String pokemonName) {
    return _$toggleFavoriteAsyncAction.run(
      () => super.toggleFavorite(pokemonName),
    );
  }

  late final _$fetchPokemonDetailAsyncAction = AsyncAction(
    'PokemonControllerBase.fetchPokemonDetail',
    context: context,
  );

  @override
  Future<void> fetchPokemonDetail(String pokemonName) {
    return _$fetchPokemonDetailAsyncAction.run(
      () => super.fetchPokemonDetail(pokemonName),
    );
  }

  late final _$PokemonControllerBaseActionController = ActionController(
    name: 'PokemonControllerBase',
    context: context,
  );

  @override
  void setSearchPokemon(String name) {
    final _$actionInfo = _$PokemonControllerBaseActionController.startAction(
      name: 'PokemonControllerBase.setSearchPokemon',
    );
    try {
      return super.setSearchPokemon(name);
    } finally {
      _$PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
favorites: ${favorites},
pokemon: ${pokemon},
isLoading: ${isLoading},
searchPokemon: ${searchPokemon},
hasMore: ${hasMore},
filteredPokemons: ${filteredPokemons}
    ''';
  }
}
