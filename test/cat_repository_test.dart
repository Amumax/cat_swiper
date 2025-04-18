import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:homework_1/data/repositories/local_cat_repository.dart';
import 'package:homework_1/domain/repositories/cat_repository.dart';
import 'package:homework_1/models/cat.dart';
import 'package:homework_1/services/cat_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockCatApiService extends Mock implements CatApiService {}
class MockLocalCatRepository extends Mock implements LocalCatRepository {}

void main() {
  late MockCatApiService mockApiService;
  late MockLocalCatRepository mockLocalRepository;
  late CatRepository catRepository;

  setUp(() {
    mockApiService = MockCatApiService();
    mockLocalRepository = MockLocalCatRepository();
    catRepository = CatRepository(mockApiService, mockLocalRepository);
    
    // Setup SharedPreferences for tests
    SharedPreferences.setMockInitialValues({});
  });

  group('CatRepository Tests', () {
    test('getRandomCats should return cats from API', () async {
      // Arrange
      final testCats = [
        Cat(id: '1', url: 'url1', breeds: []),
        Cat(id: '2', url: 'url2', breeds: []),
      ];
      when(() => mockApiService.getRandomCats(limit: 5, breedId: null))
          .thenAnswer((_) async => testCats);
      when(() => mockLocalRepository.getLikedCats())
          .thenAnswer((_) async => []);
      
      // Act
      final result = await catRepository.getRandomCats();
      
      // Assert
      expect(result, equals(testCats));
      verify(() => mockApiService.getRandomCats(limit: 5, breedId: null)).called(1);
      verify(() => mockLocalRepository.getLikedCats()).called(1);
    });
    
    test('getLikedCats should return cats from local repository', () async {
      // Arrange
      final testLikedCats = [
        Cat(id: '1', url: 'url1', breeds: [], likedAt: DateTime.now()),
        Cat(id: '2', url: 'url2', breeds: [], likedAt: DateTime.now()),
      ];
      when(() => mockLocalRepository.getLikedCats())
          .thenAnswer((_) async => testLikedCats);
      
      // Act
      final result = await catRepository.getLikedCats();
      
      // Assert
      expect(result, equals(testLikedCats));
      verify(() => mockLocalRepository.getLikedCats()).called(1);
    });
    
    test('likeCat should call local repository', () async {
      // Arrange
      final testCat = Cat(id: '1', url: 'url1', breeds: []);
      when(() => mockLocalRepository.likeCat(testCat))
          .thenAnswer((_) async {});
      
      // Act
      await catRepository.likeCat(testCat);
      
      // Assert
      verify(() => mockLocalRepository.likeCat(testCat)).called(1);
    });
    
    test('removeLike should call local repository', () async {
      // Arrange
      const testCatId = '1';
      when(() => mockLocalRepository.removeLike(testCatId))
          .thenAnswer((_) async {});
      
      // Act
      await catRepository.removeLike(testCatId);
      
      // Assert
      verify(() => mockLocalRepository.removeLike(testCatId)).called(1);
    });
    
    test('getRandomCats should return liked cats when API fails', () async {
      // Arrange
      final testLikedCats = [
        Cat(id: '1', url: 'url1', breeds: [], likedAt: DateTime.now()),
        Cat(id: '2', url: 'url2', breeds: [], likedAt: DateTime.now()),
      ];
      when(() => mockApiService.getRandomCats(limit: 5, breedId: null))
          .thenThrow(Exception('API error'));
      when(() => mockLocalRepository.getLikedCats())
          .thenAnswer((_) async => testLikedCats);
      
      // Act
      final result = await catRepository.getRandomCats();
      
      // Assert
      expect(result, equals(testLikedCats.take(5).toList()));
      verify(() => mockApiService.getRandomCats(limit: 5, breedId: null)).called(1);
      verify(() => mockLocalRepository.getLikedCats()).called(1);
    });
  });
}
