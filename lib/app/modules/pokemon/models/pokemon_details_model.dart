class PokemonDetailModel {
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final int id;
  final List<String> types;
  final List<String> abilities;

  PokemonDetailModel({
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.id,
    required this.types,
    required this.abilities,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      height: json['height'],
      weight: json['weight'],
      id: json['id'],
      types: (json['types'] as List)
          .map((t) => t['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List)
          .map((a) => a['ability']['name'] as String)
          .toList(),
    );
  }
}
