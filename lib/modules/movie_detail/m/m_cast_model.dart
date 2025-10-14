class CastModel {
  final int gender;
  final int id;
  final String name;
  final String profilePath;
  final String character;

  CastModel({
    required this.gender,
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      gender: map['gender'] ?? 0,
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      profilePath: map['profile_path'] ?? '',
      character: map['character'] ?? '',
    );
  }
}
