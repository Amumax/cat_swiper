import 'package:flutter/foundation.dart';
import '../models/cat.dart';
import '../services/cat_api_service.dart';

class CatProvider extends ChangeNotifier {
  final CatApiService _catApiService = CatApiService();
  
  List<Cat> _cats = [];
  int _likedCatsCount = 0;
  bool _isLoading = false;
  String? _error;

  List<Cat> get cats => _cats;
  int get likedCatsCount => _likedCatsCount;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  Cat? get currentCat => _cats.isNotEmpty ? _cats.first : null;

  Future<void> fetchCats({int limit = 5}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      
      final newCats = await _catApiService.getRandomCats(limit: limit);
      _cats.addAll(newCats);
      
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
      _likedCatsCount++;
      _cats.removeAt(0);
      
      if (_cats.length < 3) {
        fetchCats();
      }
      
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

  void resetLikedCount() {
    _likedCatsCount = 0;
    notifyListeners();
  }
}
