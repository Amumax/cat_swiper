import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/cat.dart';

class CatApiService {
  static const String _baseUrl = 'https://api.thecatapi.com/v1';
  static const String _apiKey =
      'live_28eBZMsCParu7dWJ88d9gjgcGvJEMIPGgqVFYCOQa7Xw0WEaFMqwhHz5SInIGfGk';

  Future<List<Cat>> getRandomCats({int limit = 5, String? breedId}) async {
    try {
      HttpClient client =
          HttpClient()
            ..badCertificateCallback =
                ((X509Certificate cert, String host, int port) => true);

      String endpoint = '$_baseUrl/images/search?limit=$limit&has_breeds=1';
      if (breedId != null && breedId.isNotEmpty) {
        endpoint += '&breed_ids=$breedId';
      }

      try {
        final response = await http
            .get(Uri.parse(endpoint), headers: {'x-api-key': _apiKey})
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          return data.map((json) => Cat.fromJson(json)).toList();
        } else if (response.statusCode == 429) {
          throw Exception('Rate limit exceeded. Please try again later.');
        } else {
          throw Exception('Failed to load cats: ${response.statusCode}');
        }
      } catch (httpError) {
        if (httpError is SocketException ||
            httpError.toString().contains('Failed host lookup')) {
          final httpClientRequest = await client.getUrl(Uri.parse(endpoint));
          httpClientRequest.headers.set('x-api-key', _apiKey);
          final httpClientResponse = await httpClientRequest.close();

          if (httpClientResponse.statusCode == 200) {
            final stringData =
                await httpClientResponse.transform(utf8.decoder).join();
            final List<dynamic> data = json.decode(stringData);
            return data.map((json) => Cat.fromJson(json)).toList();
          } else {
            throw Exception(
              'Failed to load cats with HttpClient: ${httpClientResponse.statusCode}',
            );
          }
        } else {
          rethrow;
        }
      }
    } catch (e) {
      if (e.toString().contains('SocketException') ||
          e.toString().contains('Failed host lookup')) {
        throw Exception(
          'No internet connection. Please check your connection and try again.',
        );
      } else if (e.toString().contains('TimeoutException')) {
        throw Exception('Connection timed out. Please try again later.');
      } else {
        throw Exception('Error loading data: $e');
      }
    }
  }

  Future<List<Breed>> getBreeds() async {
    try {
      HttpClient client =
          HttpClient()
            ..badCertificateCallback =
                ((X509Certificate cert, String host, int port) => true);

      try {
        final response = await http
            .get(Uri.parse('$_baseUrl/breeds'), headers: {'x-api-key': _apiKey})
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          return data.map((json) => Breed.fromJson(json)).toList();
        } else {
          throw Exception('Failed to load breeds: ${response.statusCode}');
        }
      } catch (httpError) {
        if (httpError is SocketException ||
            httpError.toString().contains('Failed host lookup')) {
          final httpClientRequest = await client.getUrl(
            Uri.parse('$_baseUrl/breeds'),
          );
          httpClientRequest.headers.set('x-api-key', _apiKey);
          final httpClientResponse = await httpClientRequest.close();

          if (httpClientResponse.statusCode == 200) {
            final stringData =
                await httpClientResponse.transform(utf8.decoder).join();
            final List<dynamic> data = json.decode(stringData);
            return data.map((json) => Breed.fromJson(json)).toList();
          } else {
            throw Exception(
              'Failed to load breeds with HttpClient: ${httpClientResponse.statusCode}',
            );
          }
        } else {
          rethrow;
        }
      }
    } catch (e) {
      if (e.toString().contains('SocketException') ||
          e.toString().contains('Failed host lookup')) {
        throw Exception(
          'No internet connection. Please check your connection and try again.',
        );
      } else if (e.toString().contains('TimeoutException')) {
        throw Exception('Connection timed out. Please try again later.');
      } else {
        throw Exception('Error loading data: $e');
      }
    }
  }
}
