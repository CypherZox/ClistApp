import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/clist_entity.dart';
import '../repositories/clist_repository.dart';

@LazySingleton()
class GetCList implements UseCases<List<CList>, Params> {
  late final GetClistRepository clistRepository;

  GetCList(this.clistRepository);

  @override
  Future<Either<Failure, List<CList>>> call(Params params) async {
    return await clistRepository.getClist();
  }
}

class Params extends Equatable {
  @override
  List<Object?> get props => [];
}
