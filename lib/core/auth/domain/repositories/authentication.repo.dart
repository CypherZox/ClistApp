import 'package:clistApp/core/auth/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';

import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, User?>> getSignedInUser();
  Future<Either<Failure, Unit>> registerWithEmailAndPassword(
      String email, String pass);
  Future<Either<Failure, Unit>> logInWithEmailAndPassword(
      String email, String pass);
  Future<Either<Failure, Unit>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
}
