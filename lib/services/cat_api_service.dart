import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat.dart';

class CatApiService {
  static const String _baseUrl = 'https://api.thecatapi.com/v1';
  static const String _apiKey = 'live_28eBZMsCParu7dWJ88d9gjgcGvJEMIPGgqVFYCOQa7Xw0WEaFMqwhHz5SInIGfGk';

  Future<List<Cat>> getRandomCats({int limit = 1, String? breedId}) async {
    try {
      String endpoint = '$_baseUrl/images/search?limit=$limit&has_breeds=1';
      if (breedId != null && breedId.isNotEmpty) {
        endpoint += '&breed_ids=$breedId';
      }

      final response = await http.get(
        Uri.parse(endpoint),
        headers: {'x-api-key': _apiKey},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Cat.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load cats: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('SocketException') ||
          e.toString().contains('Failed host lookup')) {
        throw Exception('Нет подключения к интернету. Проверьте соединение и попробуйте снова.');
      } else {
        throw Exception('Ошибка загрузки данных: $e');
      }
    }
  }

  Future<List<Breed>> getBreeds() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/breeds'),
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Breed.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load breeds: ${response.statusCode}');
    }
  }
}
