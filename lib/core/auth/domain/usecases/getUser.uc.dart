import 'package:clistApp/core/auth/domain/entities/user.dart';
import 'package:clistApp/core/auth/domain/repositories/authentication.repo.dart';
import 'package:clistApp/core/errors/failures.dart';
import 'package:clistApp/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetUser extends UseCases<User?, Params> {
  late final AuthRepo authRepo;
  GetUser(this.authRepo);

  @override
  Future<Either<Failure, User?>> call(Params params) async {
    return await authRepo.getSignedInUser();
  }
}

class Params extends Equatable {
  Params();
  @override
  List<Object?> get props => [];
}
