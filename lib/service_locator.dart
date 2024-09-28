import 'package:care_mingle/core/base/base_cache.dart';
import 'package:care_mingle/core/base/base_dio.dart';
import 'package:care_mingle/core/network/network_info.dart';
import 'package:care_mingle/features/auth/data/data%20sources/auth_service.dart';
import 'package:care_mingle/features/auth/data/repository/auth_repository_impl.dart';
import 'package:care_mingle/features/auth/domain/repository/auth_repository.dart';
import 'package:care_mingle/features/auth/domain/usecases/login.dart';
import 'package:care_mingle/features/auth/domain/usecases/register.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  //cache
  sl.registerLazySingleton<InternetConnectionChecker>(()=>InternetConnectionChecker());
  //core
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(sl()));
  sl.registerLazySingleton<TheHttpExecuter>(()=>TheHttpExecuter());
  sl.registerLazySingleton<LocalData>(()=>LocalData());
  //data sources
  sl.registerLazySingleton<AuthService>(()=>AuthServiceImlp(remoteData: sl(), localData: sl(), networkInfo: sl()));
  //repositories
  sl.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl());
  //useCases
  sl.registerLazySingleton<RegisterBabySitterUseCase>(()=>RegisterBabySitterUseCase());
  sl.registerLazySingleton<RegisterParentUseCase>(()=>RegisterParentUseCase());
  sl.registerLazySingleton<LoginUseCase>(()=>LoginUseCase());
}
