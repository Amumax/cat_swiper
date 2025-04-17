import 'package:get_it/get_it.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../providers/cat_provider.dart';
import '../../services/cat_api_service.dart';

final GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Services
  serviceLocator.registerLazySingleton<CatApiService>(() => CatApiService());
  
  // Repositories
  serviceLocator.registerLazySingleton<CatRepository>(
    () => CatRepository(serviceLocator<CatApiService>())
  );
  
  // Providers
  serviceLocator.registerFactory<CatProvider>(() => CatProvider());
}
