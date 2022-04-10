import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/clist_resource_repository.dart';
import '../datasources/clist_resource_local.dart';
import '../datasources/clist_resource_remote.dart';
import '../models/clist_model.dart';

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
    bool isConnected;
    if (await networkInfo.isConnected != null) {
      isConnected = (await networkInfo.isConnected)!;
    } else {
      isConnected = false;
    }
    try {
      final localClistResources =
          await cListResourcesLocalDataSource.getLastCListR();
      if (localClistResources.length == 0) {
        if (isConnected) {
          try {
            final remoteClistResources =
                await remoteDataSource.getCListResources();

            await cListResourcesLocalDataSource
                .cacheCListR(remoteClistResources);

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
