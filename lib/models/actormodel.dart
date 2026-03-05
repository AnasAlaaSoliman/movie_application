class ActorModel {
  final String name;
  final String character;
  final String? profilePath;

  ActorModel({
    required this.name,
    required this.character,
    this.profilePath,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      name: json['name'] ?? '',
      character: json['character_name'] ?? '',
      profilePath: json['url_small_image'],
    );
  }
}