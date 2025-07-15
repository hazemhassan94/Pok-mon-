class PokemonDetailsModel {
  final String name;
  final int height;
  final int weight;
  final String image;
  final List<String> types;

  PokemonDetailsModel({
    required this.name,
    required this.height,
    required this.weight,
    required this.image,
    required this.types,
  });

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      image: json['sprites']['front_default'],
      types: List<String>.from(
        json['types'].map((t) => t['type']['name']),
      ),
    );
  }
}