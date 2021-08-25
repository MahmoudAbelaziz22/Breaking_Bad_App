import '../../constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServieces {
  late Dio dio;

  CharactersWebServieces() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQuotes(String charName) async {
    try {
      Response response =
          await dio.get('quote', queryParameters: {'author': charName});
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
