// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker_tv/data_connection_checker.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'core/auth/domain/repositories/authentication.repo.dart' as _i8;
import 'core/auth/domain/usecases/email_login.uc.dart' as _i9;
import 'core/auth/domain/usecases/email_registeration.uc.dart' as _i11;
import 'core/auth/domain/usecases/getUser.uc.dart' as _i7;
import 'core/auth/domain/usecases/google_signin.uc.dart' as _i14;
import 'core/auth/domain/usecases/signout.uc.dart' as _i13;
import 'core/network/network_info.dart' as _i10;
import 'features/clist/data/datasources/clist_local.dart' as _i15;
import 'features/clist/data/datasources/clist_remote.dart' as _i4;
import 'features/clist/data/repositories/get_clist_repository_impl.dart'
    as _i18;
import 'features/clist/domain/repositories/clist_repository.dart' as _i17;
import 'features/clist/domain/usecases/get_clist.dart' as _i21;
import 'features/clist/presentation/bloc/clist_bloc.dart' as _i23;
import 'features/clist_resource/data/datasources/clist_resource_local.dart'
    as _i16;
import 'features/clist_resource/data/datasources/clist_resource_remote.dart'
    as _i5;
import 'features/clist_resource/data/repositories/get_clist_repository_impl.dart'
    as _i20;
import 'features/clist_resource/domain/repositories/clist_resource_repository.dart'
    as _i19;
import 'features/clist_resource/domain/usecases/get_clist_resource.dart'
    as _i22;
import 'features/clist_resource/presentation/bloc/clist_bloc.dart' as _i24;
import 'inject_module.dart' as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Client>(() => injectableModule.httpClient);
  gh.lazySingleton<_i4.ClistRemoteDataSource>(
      () => _i4.ClistRemoteDataSourceImpl(httpClient: get<_i3.Client>()));
  gh.lazySingleton<_i5.ClistResourceRemoteDataSource>(() =>
      _i5.ClistResourceRemoteDataSourceImpl(httpClient: get<_i3.Client>()));
  gh.lazySingleton<_i6.DataConnectionChecker>(
      () => injectableModule.dtaConnectionChecker);
  gh.lazySingleton<_i7.GetUser>(() => _i7.GetUser(get<_i8.AuthRepo>()));
  gh.lazySingleton<_i9.LogInWithEmailAndPassword>(
      () => _i9.LogInWithEmailAndPassword(get<_i8.AuthRepo>()));
  gh.lazySingleton<_i10.NetworkInfo>(() => _i10.NetworkInfoImpl(
      dataConnectionChecker: get<_i6.DataConnectionChecker>()));
  gh.lazySingleton<_i11.RegisterWithEmailAndPassword>(
      () => _i11.RegisterWithEmailAndPassword(get<_i8.AuthRepo>()));
  await gh.factoryAsync<_i12.SharedPreferences>(() => injectableModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i13.SignOut>(() => _i13.SignOut(get<_i8.AuthRepo>()));
  gh.lazySingleton<_i14.SigninWithGoogle>(
      () => _i14.SigninWithGoogle(get<_i8.AuthRepo>()));
  gh.lazySingleton<_i15.CListLocalDataSource>(() =>
      _i15.CListLocalDataSourceImpl(
          sharedPreferences: get<_i12.SharedPreferences>()));
  gh.lazySingleton<_i16.CListResourcesLocalDataSource>(() =>
      _i16.CListResourcesLocalDataSourceImpl(
          sharedPreferences: get<_i12.SharedPreferences>()));
  gh.lazySingleton<_i17.GetClistRepository>(() => _i18.GetClistRepositoryImpl(
      networkInfo: get<_i10.NetworkInfo>(),
      remoteDataSource: get<_i4.ClistRemoteDataSource>(),
      localDataSource: get<_i15.CListLocalDataSource>()));
  gh.lazySingleton<_i19.GetClistResourcesRepository>(() =>
      _i20.GetClistResourceRepositoryImpl(
          cListResourcesLocalDataSource:
              get<_i16.CListResourcesLocalDataSource>(),
          networkInfo: get<_i10.NetworkInfo>(),
          remoteDataSource: get<_i5.ClistResourceRemoteDataSource>()));
  gh.lazySingleton<_i21.GetCList>(
      () => _i21.GetCList(get<_i17.GetClistRepository>()));
  gh.lazySingleton<_i22.GetCListResource>(
      () => _i22.GetCListResource(get<_i19.GetClistResourcesRepository>()));
  gh.factory<_i23.ClistBloc>(
      () => _i23.ClistBloc(getClist: get<_i21.GetCList>()));
  gh.factory<_i24.ClistResourceBloc>(() =>
      _i24.ClistResourceBloc(getCListResource: get<_i22.GetCListResource>()));
  return get;
}

class _$InjectableModule extends _i25.InjectableModule {}
