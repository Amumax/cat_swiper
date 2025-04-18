import '../../models/cat.dart';
import '../local/database.dart';
import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCatRepository {
  final AppDatabase _database;

  LocalCatRepository(this._database);

  Future<List<Cat>> getLikedCats() async {
    final dbCats = await _database.getLikedCats();
    return dbCats.map((dbCat) {
      List<Breed> breeds = [];
      if (dbCat.breedId != null && dbCat.breedName != null) {
        breeds.add(
          Breed(
            id: dbCat.breedId!,
            name: dbCat.breedName!,
            description: dbCat.breedDescription ?? 'No description available',
            temperament: dbCat.breedTemperament ?? 'Unknown temperament',
            origin: dbCat.breedOrigin ?? 'Unknown origin',
            lifeSpan: dbCat.breedLifeSpan ?? 'Unknown',
            adaptability: dbCat.adaptability,
            affectionLevel: dbCat.affectionLevel,
            childFriendly: dbCat.childFriendly,
            dogFriendly: dbCat.dogFriendly,
            energyLevel: dbCat.energyLevel,
            healthIssues: dbCat.healthIssues,
            intelligence: dbCat.intelligence,
            socialNeeds: dbCat.socialNeeds,
            strangerFriendly: dbCat.strangerFriendly,
          ),
        );
      }
      
      return Cat(
        id: dbCat.id,
        url: dbCat.url,
        breeds: breeds,
        likedAt: dbCat.likedAt,
      );
    }).toList();
  }
  
  Future<void> likeCat(Cat cat) async {
    final now = DateTime.now();
    
    // Save to database
    final catCompanion = CatsTableCompanion(
      id: Value(cat.id),
      url: Value(cat.url),
      likedAt: Value(now),
    );
    
    if (cat.breeds.isNotEmpty) {
      final breed = cat.breeds.first;
      final updatedCompanion = catCompanion.copyWith(
        breedId: Value(breed.id),
        breedName: Value(breed.name),
        breedDescription: Value(breed.description),
        breedTemperament: Value(breed.temperament),
        breedOrigin: Value(breed.origin),
        breedLifeSpan: Value(breed.lifeSpan),
        adaptability: Value(breed.adaptability),
        affectionLevel: Value(breed.affectionLevel),
        childFriendly: Value(breed.childFriendly),
        dogFriendly: Value(breed.dogFriendly),
        energyLevel: Value(breed.energyLevel),
        healthIssues: Value(breed.healthIssues),
        intelligence: Value(breed.intelligence),
        socialNeeds: Value(breed.socialNeeds),
        strangerFriendly: Value(breed.strangerFriendly),
      );
      
      await _database.likeCat(updatedCompanion);
    } else {
      await _database.likeCat(catCompanion);
    }
    
    // Update counter in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final likedCount = await getLikedCatsCount();
    await prefs.setInt('liked_cats_count', likedCount + 1);
  }
  
  Future<void> removeLike(String catId) async {
    await _database.removeLike(catId);
    
    // Update counter in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final likedCount = await getLikedCatsCount();
    await prefs.setInt('liked_cats_count', likedCount - 1);
  }
  
  Future<int> getLikedCatsCount() async {
    final prefs = await SharedPreferences.getInstance();
    final storedCount = prefs.getInt('liked_cats_count');
    
    if (storedCount != null) {
      return storedCount;
    }
    
    // If counter not found, recalculate from database
    final cats = await _database.getLikedCats();
    final count = cats.length;
    await prefs.setInt('liked_cats_count', count);
    return count;
  }
}
