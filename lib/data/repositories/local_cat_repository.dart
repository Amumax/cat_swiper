import '../../models/cat.dart';
import '../local/database.dart';

class LocalCatRepository {
  final AppDatabase _database;

  LocalCatRepository(this._database);

  Future<List<Cat>> getLikedCats() async {
    // Placeholder implementation
    return [];
  }
}
