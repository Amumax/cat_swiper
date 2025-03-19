import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat.dart';

class CatApiService {
  static const String _baseUrl = 'https://api.thecatapi.com/v1';
  static const String _apiKey = 'DEMO-API-KEY'; // Free API key for development

  Future<List<Cat>> getRandomCats({int limit = 1, String? breedId}) async {
    String endpoint = '$_baseUrl/images/search?limit=$limit';

    if (breedId != null && breedId.isNotEmpty) {
      endpoint += '&breed_ids=$breedId';
    }

    endpoint += '&has_breeds=1';

    final response = await http.get(
      Uri.parse(endpoint),
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Cat.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cats: ${response.statusCode}');
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
