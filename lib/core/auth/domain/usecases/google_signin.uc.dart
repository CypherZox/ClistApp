import 'package:clist/core/auth/domain/repositories/authentication.repo.dart';
import 'package:clist/core/errors/failures.dart';
import 'package:clist/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SigninWithGoogle extends UseCases<Unit, Params> {
  late final AuthRepo authRepo;
  SigninWithGoogle(this.authRepo);

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return await authRepo.signInWithGoogle();
  }
}

class Params extends Equatable {
  Params();
  @override
  List<Object?> get props => [];
}
