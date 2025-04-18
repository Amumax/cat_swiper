import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/di/service_locator.dart';
import '../domain/repositories/cat_repository.dart';
import '../models/cat.dart';
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
  bool _hasShownOfflineMessage = false;

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
  bool get hasShownOfflineMessage => _hasShownOfflineMessage;
  
  set hasShownOfflineMessage(bool value) {
    _hasShownOfflineMessage = value;
  }

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
    _initializeProvider();
  }
  
  Future<void> _initializeProvider() async {
    // Subscribe to network state changes
    _connectivityService.connectivityStream.listen((isConnected) {
      final wasOffline = _isOfflineMode;
      _isOfflineMode = !isConnected;
      
      // If state changed, update UI
      if (wasOffline != _isOfflineMode) {
        notifyListeners();
        
        // If connection restored, update data
        if (!_isOfflineMode) {
          fetchCats(limit: 5);
        }
      }
    });
    
    // Check current network state
    final isConnected = await _connectivityService.checkConnectivity();
    _isOfflineMode = !isConnected;
    
    // Load saved data
    await _loadLikedCatsFromDb();
    await _loadLikedCountFromPrefs();
  }

  Future<void> _loadLikedCatsFromDb() async {
    try {
      _likedCats = await _catRepository.getLikedCats();
      _applyBreedFilter();
      notifyListeners();
    } catch (e) {
      // Handle loading error
    }
  }

  Future<void> _loadLikedCountFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _likedCatsCount = prefs.getInt('liked_cats_count') ?? _likedCats.length;
      notifyListeners();
    } catch (e) {
      _likedCatsCount = _likedCats.length;
    }
  }

  Future<void> _saveLikedCountToPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('liked_cats_count', _likedCatsCount);
    } catch (e) {
      // Handle saving error
    }
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
          // If failed to load cats and list is empty, add test cats
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
      
      // Update liked cats list from repository
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
    
    // Update liked cats list from repository
    _likedCats = await _catRepository.getLikedCats();
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
    await _loadLikedCatsFromDb();
  }
}
