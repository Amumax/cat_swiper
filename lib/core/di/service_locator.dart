import 'package:get_it/get_it.dart';
import '../../data/local/database.dart';
import '../../data/repositories/local_cat_repository.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../providers/cat_provider.dart';
import '../../services/cat_api_service.dart';
import '../../services/connectivity_service.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  final database = AppDatabase();
  serviceLocator.registerSingleton<AppDatabase>(database);
  
  serviceLocator.registerLazySingleton<LocalCatRepository>(
    () => LocalCatRepository(serviceLocator<AppDatabase>()),
  );
  
  serviceLocator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityService(),
  );
  
  serviceLocator.registerLazySingleton<CatApiService>(() => CatApiService());

  serviceLocator.registerLazySingleton<CatRepository>(
    () => CatRepository(serviceLocator<CatApiService>()),
  );

  serviceLocator.registerFactory<CatProvider>(() => CatProvider());
}
