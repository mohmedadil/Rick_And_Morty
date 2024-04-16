import 'package:dio/dio.dart';
import 'package:rickandmorty/constant.dart';

class CharacterWebServices {
  final Dio dio;

  CharacterWebServices({required this.dio});

  Future<Map<String, dynamic>> getAllCharacter(
      {required String endpoint}) async {
    try {
      Response response = await dio.get(apiBase + endpoint);
      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
