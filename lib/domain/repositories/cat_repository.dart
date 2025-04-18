import '../../models/cat.dart';
import '../../services/cat_api_service.dart';
import '../../data/repositories/local_cat_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatRepository {
  final CatApiService _apiService;
  final LocalCatRepository _localRepository;

  CatRepository(this._apiService, this._localRepository);

  Future<List<Cat>> getRandomCats({int limit = 5, String? breedId}) async {
    try {
      final cats = await _apiService.getRandomCats(limit: limit, breedId: breedId);
      
      // Check if there are liked cats among the fetched ones
      final likedCats = await _localRepository.getLikedCats();
      final likedCatIds = likedCats.map((cat) => cat.id).toSet();
      
      // Update like status for fetched cats
      return cats.map((cat) {
        if (likedCatIds.contains(cat.id)) {
          final likedCat = likedCats.firstWhere((liked) => liked.id == cat.id);
          return cat.copyWith(likedAt: likedCat.likedAt);
        }
        return cat;
      }).toList();
    } catch (e) {
      // In case of error, try to get cached cats
      final likedCats = await _localRepository.getLikedCats();
      if (likedCats.isNotEmpty) {
        return likedCats.take(limit).toList();
      }
      rethrow;
    }
  }

  Future<List<Breed>> getBreeds() async {
    try {
      return await _apiService.getBreeds();
    } catch (e) {
      // Return empty list in case of error
      return [];
    }
  }
  
  Future<List<Cat>> getLikedCats() async {
    return await _localRepository.getLikedCats();
  }
  
  Future<void> likeCat(Cat cat) async {
    await _localRepository.likeCat(cat);
    
    // Save like information to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_liked_cat_id', cat.id);
    await prefs.setString('last_liked_cat_url', cat.url);
    
    if (cat.breeds.isNotEmpty) {
      await prefs.setString('last_liked_cat_breed', cat.breeds.first.name);
    }
  }
  
  Future<void> dislikeCat(String catId) async {
    // Save dislike information to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final dislikedCats = prefs.getStringList('disliked_cats') ?? [];
    
    if (!dislikedCats.contains(catId)) {
      dislikedCats.add(catId);
      await prefs.setStringList('disliked_cats', dislikedCats);
    }
  }
  
  Future<void> removeLike(String catId) async {
    await _localRepository.removeLike(catId);
    
    // Update information in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final lastLikedCatId = prefs.getString('last_liked_cat_id');
    
    if (lastLikedCatId == catId) {
      await prefs.remove('last_liked_cat_id');
      await prefs.remove('last_liked_cat_url');
      await prefs.remove('last_liked_cat_breed');
    }
  }
  
  Future<int> getLikedCatsCount() async {
    return await _localRepository.getLikedCatsCount();
  }
}
