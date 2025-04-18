import 'package:flutter/foundation.dart';
import '../core/di/service_locator.dart';
import '../domain/repositories/cat_repository.dart';
import '../models/cat.dart';
import '../services/cat_api_service.dart';
import '../services/connectivity_service.dart';

class CatProvider extends ChangeNotifier {
  final CatRepository _catRepository = serviceLocator<CatRepository>();
  final ConnectivityService _connectivityService = serviceLocator<ConnectivityService>();

  final List<Cat> _cats = [];
  List<Cat> _likedCats = [];
  List<Cat> _filteredLikedCats = [];
  String? _selectedBreed;
  int _likedCatsCount = 0;
  bool _isLoading = false;
  String? _error;
  bool _isOfflineMode = false;

  List<Cat> get cats => _cats;
  List<Cat> get likedCats =>
      _filteredLikedCats.isEmpty && _selectedBreed == null
          ? _likedCats
          : _filteredLikedCats;
  int get likedCatsCount => _likedCatsCount;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedBreed => _selectedBreed;
  bool get isOfflineMode => _isOfflineMode;

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

  CatProvider() {
    _connectivityService.connectivityStream.listen((isConnected) {
      _isOfflineMode = !isConnected;
      notifyListeners();
    });
    
    _loadLikedCats();
  }

  Future<void> _loadLikedCats() async {
    try {
      _likedCats = await _catRepository.getLikedCats();
      _likedCatsCount = _likedCats.length;
      _applyBreedFilter();
      notifyListeners();
    } catch (e) {
      _loadLikedCountFromPrefs();
    }
  }

  Future<void> _loadLikedCountFromPrefs() async {
    try {
      _likedCatsCount = _likedCats.length;
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _saveLikedCountToPrefs() async {
    // No implementation needed for now
    _likedCatsCount = _likedCats.length;
  }

  Future<void> fetchCats({int limit = 5}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      try {
        final newCats = await _catRepository.getRandomCats(limit: limit);
        _cats.addAll(newCats);
        
        final isConnected = await _connectivityService.checkConnectivity();
        _isOfflineMode = !isConnected;
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

  Future<void> likeCat() async {
    if (_cats.isNotEmpty) {
      final cat = _cats.first;
      
      await _catRepository.likeCat(cat);
      
      // Обновляем список лайкнутых котиков из репозитория
      _likedCats = await _catRepository.getLikedCats();
      _likedCatsCount = _likedCats.length;
      _cats.removeAt(0);
      
      if (_cats.length < 3) {
        fetchCats();
      }
      
      _applyBreedFilter();
      _saveLikedCountToPrefs();
      notifyListeners();
    }
  }

  Future<void> dislikeCat() async {
    if (_cats.isNotEmpty) {
      final cat = _cats.first;
      
      await _catRepository.dislikeCat(cat.id);
      
      _cats.removeAt(0);
      if (_cats.length < 3) {
        fetchCats();
      }
      notifyListeners();
    }
  }

  Future<void> removeLikedCat(String catId) async {
    await _catRepository.removeLike(catId);
    
    _likedCats.removeWhere((cat) => cat.id == catId);
    _likedCatsCount = _likedCats.length;
    _applyBreedFilter();
    _saveLikedCountToPrefs();
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

  Future<void> resetLikedCount() async {
    _likedCatsCount = 0;
    _likedCats.clear();
    _filteredLikedCats.clear();
    _selectedBreed = null;
    _saveLikedCountToPrefs();
    notifyListeners();
  }
  
  Future<void> refreshLikedCats() async {
    await _loadLikedCats();
  }
}
