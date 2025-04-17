import 'package:flutter/foundation.dart';
import '../core/di/service_locator.dart';
import '../domain/repositories/cat_repository.dart';
import '../models/cat.dart';
import '../services/cat_api_service.dart';

class CatProvider extends ChangeNotifier {
  final CatRepository _catRepository = CatRepository(
    serviceLocator<CatApiService>(),
  );

  final List<Cat> _cats = [];
  final List<Cat> _likedCats = [];
  final List<Cat> _filteredLikedCats = [];
  String? _selectedBreed;
  int _likedCatsCount = 0;
  bool _isLoading = false;
  String? _error;

  List<Cat> get cats => _cats;
  List<Cat> get likedCats =>
      _filteredLikedCats.isEmpty && _selectedBreed == null
          ? _likedCats
          : _filteredLikedCats;
  int get likedCatsCount => _likedCatsCount;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedBreed => _selectedBreed;

  Cat? get currentCat => _cats.isNotEmpty ? _cats.first : null;

  Set<String> get availableBreeds {
    final Set<String> breeds = {};
    for (var cat in _likedCats) {
      if (cat.breeds.isNotEmpty) {
        breeds.add(cat.breeds.first.name);
      }
    }
    return breeds;
  }

  Future<void> fetchCats({int limit = 5}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      try {
        final newCats = await _catRepository.getRandomCats(limit: limit);
        _cats.addAll(newCats);
      } catch (e) {
        if (_cats.isEmpty) {
          for (int i = 0; i < 3; i++) {
            _cats.add(Cat.createTestCat());
          }
        }
        if (_cats.isEmpty) {
          rethrow;
        }
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }

  void likeCat() {
    if (_cats.isNotEmpty) {
      final likedCat = _cats.first.copyWith(likedAt: DateTime.now());
      _likedCats.add(likedCat);
      _likedCatsCount++;
      _cats.removeAt(0);
      if (_cats.length < 3) {
        fetchCats();
      }
      _applyBreedFilter();
      notifyListeners();
    }
  }

  void dislikeCat() {
    if (_cats.isNotEmpty) {
      _cats.removeAt(0);
      if (_cats.length < 3) {
        fetchCats();
      }
      notifyListeners();
    }
  }

  void removeLikedCat(String catId) {
    _likedCats.removeWhere((cat) => cat.id == catId);
    _likedCatsCount = _likedCats.length;
    _applyBreedFilter();
    notifyListeners();
  }

  void filterByBreed(String? breedName) {
    _selectedBreed = breedName;
    _applyBreedFilter();
    notifyListeners();
  }

  void _applyBreedFilter() {
    if (_selectedBreed == null) {
      _filteredLikedCats.clear();
      return;
    }

    _filteredLikedCats.clear();
    _filteredLikedCats.addAll(
      _likedCats.where((cat) {
        return cat.breeds.isNotEmpty && cat.breeds.first.name == _selectedBreed;
      }),
    );
  }

  void resetLikedCount() {
    _likedCatsCount = 0;
    _likedCats.clear();
    _filteredLikedCats.clear();
    _selectedBreed = null;
    notifyListeners();
  }
}
