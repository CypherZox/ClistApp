import 'package:clist/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
