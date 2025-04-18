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
      
      when(mockDatabase.getLikedCats())
          .thenAnswer((_) async => testDbCats);
      
      // Act
      final result = await localRepository.getLikedCats();
      
      // Assert
      expect(result.length, equals(2));
      expect(result[0].id, equals('1'));
      expect(result[1].id, equals('2'));
      verify(mockDatabase.getLikedCats()).called(1);
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
      
      when(mockDatabase.likeCat(any))
          .thenAnswer((_) async => 1);
      
      // Act
      await localRepository.likeCat(testCat);
      
      // Assert
      verify(mockDatabase.likeCat(any)).called(1);
    });
    
    test('removeLike should update cat in database', () async {
      // Arrange
      const testCatId = '1';
      
      when(mockDatabase.removeLike(testCatId))
          .thenAnswer((_) async => 1);
      
      // Act
      await localRepository.removeLike(testCatId);
      
      // Assert
      verify(mockDatabase.removeLike(testCatId)).called(1);
    });
    
    test('getLikedCatsCount should return count from SharedPreferences', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({'liked_cats_count': 5});
      
      // Act
      final result = await localRepository.getLikedCatsCount();
      
      // Assert
      expect(result, equals(5));
    });
    test('saveCat should convert Cat to CatsTableCompanion and save to database', () async {
      final testCat = Cat(
        id: 'test1',
        url: 'https://example.com/cat1.jpg',
        breeds: [
          Breed(
            id: 'breed1',
            name: 'Test Breed',
            description: 'Test Description',
            temperament: 'Friendly',
            origin: 'Test Origin',
            lifeSpan: '10-15',
          ),
        ],
        likedAt: DateTime.now(),
      );
      
      when(mockDatabase.insertCat(any)).thenAnswer((_) async => 1);
      
      await localRepository.saveCat(testCat);
      
      verify(mockDatabase.insertCat(any)).called(1);
    });

    test('getAllCats should return all cats from database', () async {
      final testCatsData = [
        CatsTableData(
          id: 'test1',
          url: 'https://example.com/cat1.jpg',
          breedData: jsonEncode([
            {
              'id': 'breed1',
              'name': 'Test Breed',
              'description': 'Test Description',
              'temperament': 'Friendly',
              'origin': 'Test Origin',
              'life_span': '10-15',
            }
          ]),
          likedAt: DateTime.now(),
          isLiked: true,
          isDisliked: false,
        ),
      ];
      
      when(mockDatabase.getAllCats()).thenAnswer((_) async => testCatsData);
      
      final result = await localRepository.getAllCats();
      
      expect(result.length, 1);
      expect(result[0].id, 'test1');
      expect(result[0].breeds.length, 1);
      expect(result[0].breeds[0].name, 'Test Breed');
    });

    test('getLikedCats should return only liked cats', () async {
      final testCatsData = [
        CatsTableData(
          id: 'test1',
          url: 'https://example.com/cat1.jpg',
          breedData: '[]',
          likedAt: DateTime.now(),
          isLiked: true,
          isDisliked: false,
        ),
      ];
      
      when(mockDatabase.getLikedCats()).thenAnswer((_) async => testCatsData);
      
      final result = await localRepository.getLikedCats();
      
      expect(result.length, 1);
      expect(result[0].id, 'test1');
      expect(result[0].likedAt, isNotNull);
    });

    test('getCatById should return cat by id', () async {
      final testCatData = CatsTableData(
        id: 'test1',
        url: 'https://example.com/cat1.jpg',
        breedData: '[]',
        likedAt: null,
        isLiked: false,
        isDisliked: false,
      );
      
      when(mockDatabase.getCatById('test1'))
          .thenAnswer((_) async => testCatData);
      
      final result = await localRepository.getCatById('test1');
      
      expect(result, isNotNull);
      expect(result!.id, 'test1');
    });

    test('likeCat should call database likeCat method', () async {
      const catId = 'test1';
      
      await localRepository.likeCat(catId);
      
      verify(mockDatabase.likeCat(catId)).called(1);
    });

    test('dislikeCat should call database dislikeCat method', () async {
      const catId = 'test1';
      
      await localRepository.dislikeCat(catId);
      
      verify(mockDatabase.dislikeCat(catId)).called(1);
    });

    test('removeLike should call database removeLike method', () async {
      const catId = 'test1';
      
      await localRepository.removeLike(catId);
      
      verify(mockDatabase.removeLike(catId)).called(1);
    });
  });
}
