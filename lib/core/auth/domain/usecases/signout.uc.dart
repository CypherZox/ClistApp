import 'package:clist/core/auth/domain/repositories/authentication.repo.dart';
import 'package:clist/core/errors/failures.dart';
import 'package:clist/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignOut extends UseCases<void, Params> {
  late final AuthRepo authRepo;
  SignOut(this.authRepo);

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await authRepo.signOut();
  }
}

class Params extends Equatable {
  Params();
  @override
  List<Object?> get props => [];
}
