import 'package:dartz/dartz.dart';
import 'package:clistApp/core/errors/exception.dart';
import 'package:clistApp/core/errors/failures.dart';
import 'package:clistApp/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/clist_entity.dart';
import '../../domain/repositories/clist_repository.dart';
import '../datasources/clist_local.dart';
import '../datasources/clist_remote.dart';

@LazySingleton(as: GetClistRepository)
class GetClistRepositoryImpl implements GetClistRepository {
  final NetworkInfo networkInfo;
  final ClistRemoteDataSource remoteDataSource;
  final CListLocalDataSource localDataSource;
  GetClistRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure, List<CList>>> getClist() async {
    bool isConnected;
    if (await networkInfo.isConnected != null) {
      isConnected = (await networkInfo.isConnected)!;
    } else {
      isConnected = false;
    }
    if (isConnected) {
      try {
        final remoteClist = await remoteDataSource.getCList();
        if (remoteClist != null) {
          localDataSource.cacheCList(remoteClist);
        }
        return Right(remoteClist);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    try {
      final localClist = await localDataSource.getLastCList();
      return Right(localClist);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CList>>> getCachedClist() async {
    try {
      final localClist = await localDataSource.getLastCList();
      return Right(localClist);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
