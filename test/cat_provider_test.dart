import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:homework_1/domain/repositories/cat_repository.dart';
import 'package:homework_1/models/cat.dart';
import 'package:homework_1/providers/cat_provider.dart';
import 'package:homework_1/services/connectivity_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockCatRepository extends Mock implements CatRepository {}
class MockConnectivityService extends Mock implements ConnectivityService {}
void main() {
  late MockCatRepository mockCatRepository;
  late MockConnectivityService mockConnectivityService;
  late CatProvider catProvider;
  late StreamController<bool> connectivityStreamController;

  setUp(() {
    mockCatRepository = MockCatRepository();
    mockConnectivityService = MockConnectivityService();
    connectivityStreamController = StreamController<bool>.broadcast();
    
    when(mockConnectivityService.connectivityStream)
        .thenAnswer((_) => connectivityStreamController.stream);
    when(mockConnectivityService.checkConnectivity())
        .thenAnswer((_) async => true);
    when(mockCatRepository.getLikedCats())
        .thenAnswer((_) async => []);
    
    // Setup SharedPreferences for tests
    SharedPreferences.setMockInitialValues({});
    
    // Inject mocks into provider via service locator
    // This requires additional setup in real application
    
    catProvider = CatProvider();
  });
  
  tearDown(() {
    connectivityStreamController.close();
  });
  
  group('CatProvider Tests', () {
    test('initial state should be correct', () {
      expect(catProvider.cats, isEmpty);
      expect(catProvider.likedCats, isEmpty);
      expect(catProvider.isLoading, isFalse);
      expect(catProvider.error, isNull);
    });
    
    test('fetchCats should update state correctly', () async {
      // Arrange
      final testCats = [
        Cat(id: '1', url: 'url1', breeds: []),
        Cat(id: '2', url: 'url2', breeds: []),
      ];
      when(mockCatRepository.getRandomCats(limit: 5))
          .thenAnswer((_) async => testCats);
      
      // Act
      await catProvider.fetchCats();
      
      // Assert
      expect(catProvider.cats, equals(testCats));
      expect(catProvider.isLoading, isFalse);
      expect(catProvider.error, isNull);
    });
    
    test('likeCat should update liked cats', () async {
      // Arrange
      final testCat = Cat(id: '1', url: 'url1', breeds: []);
      final likedCat = testCat.copyWith(likedAt: DateTime.now());
      
      when(mockCatRepository.getRandomCats(limit: 5))
          .thenAnswer((_) async => [testCat]);
      when(mockCatRepository.likeCat(testCat))
          .thenAnswer((_) async {});
      when(mockCatRepository.getLikedCats())
          .thenAnswer((_) async => [likedCat]);
      
      // Act
      await catProvider.fetchCats();
      await catProvider.likeCat();
      
      // Assert
      expect(catProvider.likedCats, equals([likedCat]));
      expect(catProvider.likedCatsCount, equals(1));
      verify(mockCatRepository.likeCat(testCat)).called(1);
    });
    
    test('removeLikedCat should remove cat from liked cats', () async {
      // Arrange
      final testCat = Cat(id: '1', url: 'url1', breeds: [], likedAt: DateTime.now());
      
      when(mockCatRepository.getLikedCats())
          .thenAnswer((_) async => [testCat])
          .thenAnswer((_) async => []);
      when(mockCatRepository.removeLike(testCat.id))
          .thenAnswer((_) async {});
      
      // Act
      await catProvider.refreshLikedCats();
      await catProvider.removeLikedCat(testCat.id);
      
      // Assert
      expect(catProvider.likedCats, isEmpty);
      verify(mockCatRepository.removeLike(testCat.id)).called(1);
    });
    
    test('filterByBreed should filter liked cats correctly', () async {
      // Arrange
      final breed1 = Breed(
        id: 'breed1',
        name: 'Breed 1',
        description: 'Description',
        temperament: 'Temperament',
        origin: 'Origin',
        lifeSpan: '10-15',
      );
      
      final breed2 = Breed(
        id: 'breed2',
        name: 'Breed 2',
        description: 'Description',
        temperament: 'Temperament',
        origin: 'Origin',
        lifeSpan: '10-15',
      );
      
      final testCats = [
        Cat(id: '1', url: 'url1', breeds: [breed1], likedAt: DateTime.now()),
        Cat(id: '2', url: 'url2', breeds: [breed2], likedAt: DateTime.now()),
      ];
      
      when(mockCatRepository.getLikedCats())
          .thenAnswer((_) async => testCats);
      
      // Act
      await catProvider.refreshLikedCats();
      catProvider.filterByBreed('Breed 1');
      
      // Assert
      expect(catProvider.likedCats.length, equals(1));
      expect(catProvider.likedCats.first.id, equals('1'));
    });
  });
        .thenAnswer((_) => Stream<bool>.fromIterable([true]));
    when(mockConnectivityService.isConnected).thenReturn(true);
    when(mockConnectivityService.checkConnectivity()).thenAnswer((_) async => true);
    
    when(mockCatRepository.getLikedCats()).thenAnswer((_) async => []);
    
    catProvider = CatProvider();
  });

  group('CatProvider Tests', () {
    test('Initial state should have empty cats list', () {
      expect(catProvider.cats, isEmpty);
      expect(catProvider.likedCats, isEmpty);
      expect(catProvider.likedCatsCount, 0);
      expect(catProvider.isLoading, false);
      expect(catProvider.error, isNull);
    });

    test('fetchCats should update cats list', () async {
      final testCats = [
        Cat(
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
        ),
        Cat(
          id: 'test2',
          url: 'https://example.com/cat2.jpg',
          breeds: [],
        ),
      ];
      
      when(mockCatRepository.getRandomCats(limit: 5))
          .thenAnswer((_) async => testCats);
      
      await catProvider.fetchCats();
      
      expect(catProvider.cats.length, 2);
      expect(catProvider.cats[0].id, 'test1');
      expect(catProvider.cats[1].id, 'test2');
      expect(catProvider.isLoading, false);
      expect(catProvider.error, isNull);
    });

    test('likeCat should add cat to liked cats', () async {
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
      );
      
      catProvider.cats.add(testCat);
      
      await catProvider.likeCat();
      
      expect(catProvider.likedCatsCount, 1);
      expect(catProvider.cats.length, 0);
      expect(catProvider.likedCats[0].id, 'test1');
      expect(catProvider.likedCats[0].likedAt, isNotNull);
    });

    test('dislikeCat should remove cat from cats list', () async {
      final testCat = Cat(
        id: 'test1',
        url: 'https://example.com/cat1.jpg',
        breeds: [],
      );
      
      catProvider.cats.add(testCat);
      
      await catProvider.dislikeCat();
      
      expect(catProvider.cats.length, 0);
      expect(catProvider.likedCatsCount, 0);
      expect(catProvider.likedCats, isEmpty);
    });

    test('removeLikedCat should remove cat from liked cats', () async {
      final testCat = Cat(
        id: 'test1',
        url: 'https://example.com/cat1.jpg',
        breeds: [],
        likedAt: DateTime.now(),
      );
      
      catProvider.cats.add(testCat);
      await catProvider.likeCat();
      
      await catProvider.removeLikedCat('test1');
      
      expect(catProvider.likedCatsCount, 0);
      expect(catProvider.likedCats, isEmpty);
    });

    test('filterByBreed should filter liked cats by breed', () async {
      final testCat1 = Cat(
        id: 'test1',
        url: 'https://example.com/cat1.jpg',
        breeds: [
          Breed(
            id: 'breed1',
            name: 'Persian',
            description: 'Test Description',
            temperament: 'Friendly',
            origin: 'Test Origin',
            lifeSpan: '10-15',
          ),
        ],
        likedAt: DateTime.now(),
      );
      
      final testCat2 = Cat(
        id: 'test2',
        url: 'https://example.com/cat2.jpg',
        breeds: [
          Breed(
            id: 'breed2',
            name: 'Siamese',
            description: 'Test Description',
            temperament: 'Friendly',
            origin: 'Test Origin',
            lifeSpan: '10-15',
          ),
        ],
        likedAt: DateTime.now(),
      );
      
      catProvider.cats.add(testCat1);
      await catProvider.likeCat();
      catProvider.cats.add(testCat2);
      await catProvider.likeCat();
      
      catProvider.filterByBreed('Persian');
      
      expect(catProvider.likedCatsCount, 2);
      expect(catProvider.likedCats.length, 1);
      expect(catProvider.likedCats[0].id, 'test1');
      expect(catProvider.likedCats[0].breeds[0].name, 'Persian');
    });
  });
}
