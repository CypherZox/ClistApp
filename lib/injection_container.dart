import 'package:clist/core/network/network_info.dart';
import 'package:clist/features/clist/data/datasources/clist_local.dart';
import 'package:clist/features/clist/data/datasources/clist_remote.dart';
import 'package:clist/features/clist/data/repositories/get_clist_repository_impl.dart';
import 'package:clist/features/clist/domain/repositories/clist_repository.dart';
import 'package:clist/features/clist/domain/usecases/get_clist.dart';
import 'package:clist/features/clist/presentation/changenotifiers/list_change_notifiers.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //features
  sl.registerFactory(() => ClistProvider(getCList: sl()));
  sl.registerLazySingleton(() => GetCList(sl()));

  sl.registerLazySingleton<GetClistRepository>(() => GetClistRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
        localDataSource: sl(),
      ));

  //data sources
  sl.registerLazySingleton<ClistRemoteDataSource>(
      () => ClistRemoteDataSourceImpl(httpClient: sl()));
  sl.registerLazySingleton<CListLocalDataSource>(
      () => CListLocalDataSourceImpl(sharedPreferences: sl()));

  //core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: sl()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
