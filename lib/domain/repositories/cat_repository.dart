import '../../models/cat.dart';
import '../../services/cat_api_service.dart';
import '../../data/repositories/local_cat_repository.dart';

class CatRepository {
  final CatApiService _apiService;
  final LocalCatRepository? _localRepository;

  CatRepository(this._apiService, [this._localRepository]);

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
  
  Future<List<Cat>> getLikedCats() async {
    if (_localRepository != null) {
      return await _localRepository!.getLikedCats();
    }
    return [];
  }
  
  Future<void> likeCat(Cat cat) async {
    if (_localRepository != null) {
      await _localRepository!.likeCat(cat);
    }
  }
  
  Future<void> dislikeCat(String catId) async {
    // Implementation for disliked cat
  }
  
  Future<void> removeLike(String catId) async {
    if (_localRepository != null) {
      await _localRepository!.removeLike(catId);
    }
  }
}
