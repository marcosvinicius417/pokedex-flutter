import 'package:flutter/material.dart';

class PokemonSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  const PokemonSearchField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "Buscar pokemons",
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.search),
        ),
        onChanged: onSearch,
      ),
    );
  }
}
