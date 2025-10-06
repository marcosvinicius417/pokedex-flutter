import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/themes/color_theme.dart';
import '../../../core/themes/type_colors.dart';
import '../controller/pokemon_controller.dart';
import '../models/pokemon_details_model.dart';

class PokemonDetailPage extends StatefulWidget {
  final String pokemonName;

  const PokemonDetailPage({super.key, required this.pokemonName});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  final PokemonController pokemonController = Modular.get<PokemonController>();

  @override
  void initState() {
    super.initState();
    pokemonController.fetchPokemonDetail(widget.pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final PokemonDetailModel? pokemon = pokemonController.pokemon;

        return Scaffold(
          appBar: AppBar(
            title: Text("Detalhes do Pokémon"),
            backgroundColor: ColorsTheme.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Modular.to.pop(),
            ),
          ),
          body: pokemon == null || pokemonController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            TypeColors.getColor(pokemon.types.first),
                            ColorsTheme.homeBackground,
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '#${pokemon.id.toString().padLeft(3, '0')}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTheme.secondary,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              pokemon.name.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: ColorsTheme.secondary,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: ColorsTheme.cardBackground.withAlpha(50),
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Image.network(
                                      pokemon.imageUrl,
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),

                                    const SizedBox(height: 16),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        _infoColumn(
                                          'Altura',
                                          '${pokemon.height / 10} m',
                                        ),
                                        _infoColumn(
                                          'Peso',
                                          '${pokemon.weight / 10} kg',
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 16),

                                    Wrap(
                                      spacing: 8,
                                      children: pokemon.types
                                          .map(
                                            (type) => Chip(
                                              label: Text(
                                                type.toUpperCase(),
                                                style: const TextStyle(
                                                  color: ColorsTheme.secondary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              backgroundColor:
                                                  TypeColors.getColor(type),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Habilidades',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTheme.secondary,
                                  fontSize: 18,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Wrap(
                              spacing: 8,
                              children: pokemon.abilities
                                  .map(
                                    (a) => Chip(
                                      label: Text(
                                        a.toUpperCase(),
                                        style: const TextStyle(
                                          color: ColorsTheme.primaryText,
                                        ),
                                      ),
                                      backgroundColor: ColorsTheme.primary
                                          .withAlpha(30),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _infoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorsTheme.secondaryText,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: ColorsTheme.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
