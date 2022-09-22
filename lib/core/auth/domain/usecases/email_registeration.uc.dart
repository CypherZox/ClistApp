import 'package:clist/core/auth/domain/repositories/authentication.repo.dart';
import 'package:clist/core/errors/failures.dart';
import 'package:clist/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RegisterWithEmailAndPassword extends UseCases<Unit, Params> {
  late final AuthRepo authRepo;
  RegisterWithEmailAndPassword(this.authRepo);

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return await authRepo.registerWithEmailAndPassword(
        params.email, params.pass);
  }
}

class Params extends Equatable {
  final String email;
  final String pass;
  Params({required this.email, required this.pass});
  @override
  List<Object?> get props => [email, pass];
}