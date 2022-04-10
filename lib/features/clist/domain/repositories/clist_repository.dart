import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/clist_entity.dart';

abstract class GetClistRepository {
  Future<Either<Failure, List<CList>>> getClist();
  Future<Either<Failure, List<CList>>> getCachedClist();
}
