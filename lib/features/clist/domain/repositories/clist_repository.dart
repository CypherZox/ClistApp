import 'package:clist/core/errors/failures.dart';
import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetClistRepository {
  Future<Either<Failure?, CList?>?>? getClist();
}
