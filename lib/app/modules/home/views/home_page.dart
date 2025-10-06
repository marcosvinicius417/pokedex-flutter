import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/themes/color_theme.dart';
import '../../pokemon/controller/pokemon_controller.dart';
import '../widgets/pokemon_card_widget.dart';
import '../widgets/pokemon_search_widget.dart';
import '../widgets/tab_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonController pokemonController = Modular.get<PokemonController>();
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !pokemonController.isLoading &&
        pokemonController.hasMore &&
        selectedTab == 0) {
      pokemonController.fetchPokemons(loadMore: true);
    }
  }

  void onSearch() {
    pokemonController.setSearchPokemon(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Pokedex")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButtonWidget(
                    label: "Pokemons",
                    isSelected: selectedTab == 0,
                    onTap: () => setState(() => selectedTab = 0),
                  ),
                  TabButtonWidget(
                    label: "Favoritos",
                    isSelected: selectedTab == 1,
                    onTap: () => setState(() => selectedTab = 1),
                  ),
                ],
              ),
            ),

            PokemonSearchField(
              controller: searchController,
              onSearch: (value) {
                pokemonController.setSearchPokemon(value);
              },
            ),

            Expanded(
              child: Observer(
                builder: (_) {
                  final pokemons = selectedTab == 0
                      ? pokemonController.filteredPokemons
                      : pokemonController.filteredPokemons
                            .where(
                              (p) =>
                                  pokemonController.favorites.contains(p.name),
                            )
                            .toList();

                  if (selectedTab == 1 && pokemons.isEmpty) {
                    return Center(
                      child: Text(
                        'Você ainda não tem pokémons favoritos!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsTheme.secondaryText,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  return Stack(
                    children: [
                      RefreshIndicator(
                        onRefresh: () async {
                          await pokemonController.loadFavorites();
                          await pokemonController.fetchPokemons();
                        },
                        child: GridView.builder(
                          key: PageStorageKey(selectedTab),
                          controller: scrollController,
                          padding: const EdgeInsets.all(10),
                          itemCount: pokemons.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.85,
                              ),
                          itemBuilder: (_, index) {
                            final pokemon = pokemons[index];

                            return PokemonCard(
                              pokemon: pokemon,
                              pokemonController: pokemonController,
                            );
                          },
                        ),
                      ),

                      if (pokemonController.isLoading)
                        Container(
                          color: ColorsTheme.secondary.withAlpha(38),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
