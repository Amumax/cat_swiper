import '../../models/cat.dart';
import '../local/database.dart';

class LocalCatRepository {
  final AppDatabase _database;
  final List<Cat> _likedCats = [];

  LocalCatRepository(this._database);

  Future<List<Cat>> getLikedCats() async {
    return _likedCats;
  }
  
  Future<void> likeCat(Cat cat) async {
    final likedCat = cat.copyWith(likedAt: DateTime.now());
    _likedCats.add(likedCat);
  }
  
  Future<void> removeLike(String catId) async {
    _likedCats.removeWhere((cat) => cat.id == catId);
  }
}
