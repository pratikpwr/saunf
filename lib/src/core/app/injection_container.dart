import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/api_client.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  // sl.registerFactory<GetProjectsBloc>(() => GetProjectsBloc(repository: sl()));
  //
  // // repository
  // sl.registerLazySingleton<ProjectRepository>(() => ProjectRepositoryImpl(
  //       networkInfo: sl(),
  //       firebaseClient: sl(),
  //     ));

  // core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: sl()));
  sl.registerLazySingleton<ApiClient>(() => ApiClientImpl(dio: sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
