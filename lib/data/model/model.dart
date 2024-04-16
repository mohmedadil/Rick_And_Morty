class CharacterModel {
  String? name;
  String? status;
  String? species;
  String? gender;
  String? image;

  CharacterModel(
      {this.name, this.status, this.species, this.gender, this.image});
  factory CharacterModel.fromjson(Map<String, dynamic> json) {
    return CharacterModel(
        name: json["name"],
        status: json["status"],
        gender: json["gender"],
        image: json["image"],
        species: json['species']);
  }
}
