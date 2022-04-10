import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/clist_resources_entity.dart';

abstract class GetClistResourcesRepository {
  Future<Either<Failure, List<CListResource>>> getClistResources();
}
