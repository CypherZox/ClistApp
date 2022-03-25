import 'package:clist/core/errors/exception.dart';
import 'package:clist/core/network/network_info.dart';
import 'package:clist/core/errors/failures.dart';
import 'package:clist/features/clist_resource/data/models/clist_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/clist_resource_repository.dart';
import '../datasources/clist_resource_local.dart';
import '../datasources/clist_resource_remote.dart';

@LazySingleton(as: GetClistResourcesRepository)
class GetClistResourceRepositoryImpl implements GetClistResourcesRepository {
  final NetworkInfo networkInfo;
  final ClistResourceRemoteDataSource remoteDataSource;
  final CListResourcesLocalDataSource cListResourcesLocalDataSource;
  GetClistResourceRepositoryImpl({
    required this.cListResourcesLocalDataSource,
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<CListResourceModel>>> getClistResources() async {
    try {
      final localClistResources = await remoteDataSource.getCListResources();
      if (localClistResources == []) {
        bool isConnected;
        if (await networkInfo.isConnected != null) {
          isConnected = (await networkInfo.isConnected)!;
        } else {
          isConnected = false;
        }
        if (isConnected) {
          try {
            final remoteClistResources =
                await remoteDataSource.getCListResources();

            return Right(remoteClistResources);
          } on ServerException {
            return Left(ServerFailure());
          }
        }
      } else {
        return Right(localClistResources);
      }
    } catch (e) {
      return Left(CacheFailure());
    }

    return Left(ServerFailure());
  }
}
