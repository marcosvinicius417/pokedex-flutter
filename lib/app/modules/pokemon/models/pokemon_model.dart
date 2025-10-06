class PokemonModel {
  final String name;
  final String url;

  PokemonModel({required this.name, required this.url});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }

  String get id {
    final uri = Uri.parse(url);
    return uri.pathSegments[uri.pathSegments.length - 2];
  }

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}
