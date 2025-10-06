import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/themes/color_theme.dart';
import '../../pokemon/controller/pokemon_controller.dart';
import '../../pokemon/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  final PokemonController pokemonController;

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.pokemonController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/pokemon/details', arguments: pokemon.name);
      },
      child: Card(
        color: ColorsTheme.secondary.withAlpha(235),
        elevation: 4,
        shadowColor: ColorsTheme.border.withAlpha(38),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.network(pokemon.imageUrl, fit: BoxFit.contain),
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorsTheme.primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    pokemon.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorsTheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Observer(
                builder: (_) {
                  final isFav = pokemonController.favorites.contains(
                    pokemon.name,
                  );
                  return GestureDetector(
                    onTap: () => pokemonController.toggleFavorite(pokemon.name),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: ColorsTheme.primary,
                      size: 28,
                    ),
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
