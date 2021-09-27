import 'package:clist/core/errors/exception.dart';
import 'package:clist/core/network/network_info.dart';
import 'package:clist/features/clist/data/datasources/clist_local.dart';
import 'package:clist/features/clist/data/datasources/clist_remote.dart';
import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:clist/core/errors/failures.dart';
import 'package:clist/features/clist/domain/repositories/clist_repository.dart';
import 'package:dartz/dartz.dart';

class GetClistRepositoryImpl implements GetClistRepository {
  final NetworkInfo networkInfo;
  final ClistRemoteDataSource remoteDataSource;
  final CListLocalDataSource localDataSource;
  GetClistRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure?, CList?>?>? getClist() async {
    networkInfo.isConnected;
    // final remoteClist = await remoteDataSource.getClist();
    return Right(await remoteDataSource.getClist());
  }
}
