import 'package:care_mingle/features/auth/data/data%20sources/auth_service.dart';
import 'package:care_mingle/features/auth/data/repository/auth_repository_impl.dart';
import 'package:care_mingle/features/auth/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthService>(AuthServiceImlp());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
