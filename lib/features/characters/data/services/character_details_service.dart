import 'package:dio/dio.dart';
import 'package:harry_potter_characters/features/characters/data/models/character_model.dart';

class CharacterDetailsService {
  final Dio dio;

  CharacterDetailsService(this.dio);

  Future<List<CharacterModel>> fetchCharacters()async {
    final response = await dio.get('https://hp-api.onrender.com/api/characters');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((character) => CharacterModel.fromJson(character)).toList();
    } else {
      throw Exception('Yüklenirken bir hata oluştu');
    }
  }
}