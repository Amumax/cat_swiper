import '../../models/cat.dart';
import '../../services/cat_api_service.dart';

class CatRepository {
  final CatApiService _apiService;

  CatRepository(this._apiService);

  Future<List<Cat>> getRandomCats({int limit = 5, String? breedId}) async {
    try {
      return await _apiService.getRandomCats(limit: limit, breedId: breedId);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Breed>> getBreeds() async {
    try {
      return await _apiService.getBreeds();
    } catch (e) {
      rethrow;
    }
  }
}
