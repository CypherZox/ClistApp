import 'package:clist/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCases<Type> {
  Future<Either<Failure?, Type?>?>? call();
}
