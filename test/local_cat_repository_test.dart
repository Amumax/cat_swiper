import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:homework_1/data/local/database.dart';
import 'package:homework_1/data/repositories/local_cat_repository.dart';
import 'package:homework_1/models/cat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late MockAppDatabase mockDatabase;
  late LocalCatRepository localRepository;

  setUp(() {
    mockDatabase = MockAppDatabase();
    localRepository = LocalCatRepository(mockDatabase);
    
    // Setup SharedPreferences for tests
    SharedPreferences.setMockInitialValues({});
  });

  group('LocalCatRepository Tests', () {
    test('getLikedCats should return cats from database', () async {
      // Arrange
      final testDbCats = [
        CatsTableData(
          id: '1',
          url: 'url1',
          breedId: 'breed1',
          breedName: 'Breed 1',
          likedAt: DateTime.now(),
        ),
        CatsTableData(
          id: '2',
          url: 'url2',
          breedId: 'breed2',
          breedName: 'Breed 2',
          likedAt: DateTime.now(),
        ),
      ];
      
      when(() => mockDatabase.getLikedCats())
          .thenAnswer((_) async => testDbCats);
      
      // Act
      final result = await localRepository.getLikedCats();
      
      // Assert
      expect(result.length, equals(2));
      expect(result[0].id, equals('1'));
      expect(result[1].id, equals('2'));
      verify(() => mockDatabase.getLikedCats()).called(1);
    });
    
    test('likeCat should insert cat into database', () async {
      // Arrange
      final testCat = Cat(
        id: '1',
        url: 'url1',
        breeds: [
          Breed(
            id: 'breed1',
            name: 'Breed 1',
            description: 'Description',
            temperament: 'Temperament',
            origin: 'Origin',
            lifeSpan: '10-15',
          ),
        ],
      );
      
      when(() => mockDatabase.likeCat(any()))
          .thenAnswer((_) async => 1);
      
      // Act
      await localRepository.likeCat(testCat);
      
      // Assert
      verify(() => mockDatabase.likeCat(any())).called(1);
    });
    
    test('removeLike should update cat in database', () async {
      // Arrange
      const testCatId = '1';
      
      when(() => mockDatabase.removeLike(testCatId))
          .thenAnswer((_) async => 1);
      
      // Act
      await localRepository.removeLike(testCatId);
      
      // Assert
      verify(() => mockDatabase.removeLike(testCatId)).called(1);
    });
    
    test('getLikedCatsCount should return count from SharedPreferences', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({'liked_cats_count': 5});
      
      // Act
      final result = await localRepository.getLikedCatsCount();
      
      // Assert
      expect(result, equals(5));
    });
  });
}
