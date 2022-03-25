import 'package:clist/core/errors/failures.dart';
import 'package:clist/features/clist_resource/domain/entities/clist_resources_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetClistResourcesRepository {
  Future<Either<Failure, List<CListResource>>> getClistResources();
}
