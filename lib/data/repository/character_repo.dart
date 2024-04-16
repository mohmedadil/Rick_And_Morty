import 'package:rickandmorty/data/api_service/web_services.dart';
import 'package:rickandmorty/data/model/model.dart';

class CharacterRepo {
  final CharacterWebServices webServices;

  CharacterRepo({required this.webServices});

  Future<List<CharacterModel>> getAllCharacter() async {
    Map<String, dynamic> charactersData =
        await webServices.getAllCharacter(endpoint: 'character');
    List<CharacterModel> characters = [];
    for (var item in charactersData['results']) {
      characters.add(CharacterModel.fromjson(item));
    }
    return characters;
  }
}
