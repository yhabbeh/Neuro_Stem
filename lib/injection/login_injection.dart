
import 'package:get_it/get_it.dart';

import '../core/platform/network_info.dart';
import '../features/login/data/datasource/login_remote_data_source.dart';
import '../features/login/data/repositories/login_repositories_impl.dart';
import '../features/login/domain/repositories/login_repositories.dart';
import '../features/login/domain/usecase/login_usecase.dart';
import '../features/login/presentation/cubit/login_cubit.dart';

void loginInjection(GetIt sl){
  sl.registerFactory(() => LoginCubit(loginUseCase: sl<LoginUseCase>()));
  sl.registerLazySingleton(() => LoginUseCase(repositories: sl<LoginRepositories>()));
  sl.registerLazySingleton<LoginRepositories>(() => LoginRepositoriesImpl(networkInfo: sl<NetworkInfo>(), loginRemoteDataSource: sl<LoginRemoteDataSource>()));
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());
}