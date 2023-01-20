import 'package:clistApp/core/auth/data/models/firebase_user_mapper.dart';
import 'package:clistApp/core/auth/domain/repositories/authentication.repo.dart';
import 'package:clistApp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:clistApp/core/auth/domain/entities/user.dart' as u;

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseUserMapper firebaseUserMapper;

  AuthRepoImpl(
      {required this.firebaseAuth,
      required this.googleSignIn,
      required this.firebaseUserMapper});
  @override
  Future<Either<Failure, u.User?>> getSignedInUser() async {
    final optionOfUser =
        await firebaseUserMapper.toDomain(firebaseAuth.currentUser);
    if (optionOfUser == null) {
      return left(NoUserFoundFailure());
    } else {
      return right(optionOfUser);
    }
  }

  @override
  Future<Either<Failure, Unit>> logInWithEmailAndPassword(
      String email, String pass) async {
    try {
      return await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) => right(unit));
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(EmailInUseFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> registerWithEmailAndPassword(
      String email, String pass) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) => right(unit));
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(InvalidEmailAndPasswordCombination());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    try {
      final signInGoogle = await googleSignIn.signIn();
      if (signInGoogle == null) {
        return left(CancelledByUser());
      } else {
        final googleAuthentication = await signInGoogle.authentication;
        final userCredential = GoogleAuthProvider.credential(
            accessToken: googleAuthentication.accessToken,
            idToken: googleAuthentication.idToken);
        return firebaseAuth
            .signInWithCredential(userCredential)
            .then((value) => right(unit));
      }
    } on PlatformException catch (_) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    return right(Future.wait([firebaseAuth.signOut(), googleSignIn.signOut()]));
  }
}
