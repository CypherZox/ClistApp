import 'package:clist/core/errors/failures.dart';
import 'package:clist/core/usecases/usecase.dart';
import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:clist/features/clist/domain/repositories/clist_repository.dart';
import 'package:dartz/dartz.dart';

class GetCList implements UseCases<List<CList?>> {
  late final GetClistRepository clistRepository;

  GetCList(this.clistRepository);

  @override
  Future<Either<Failure?, List<CList?>?>?>? call() {
    return clistRepository.getClist();
  }
}
