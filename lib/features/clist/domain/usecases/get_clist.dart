import 'package:clist/core/errors/failures.dart';
import 'package:clist/core/usecases/usecase.dart';
import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:clist/features/clist/domain/repositories/clist_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

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
