import 'package:flutter/material.dart';

class PokemonInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const PokemonInfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 4));
  }
}
