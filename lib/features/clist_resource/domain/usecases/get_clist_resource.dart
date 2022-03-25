import 'package:clist/core/errors/failures.dart';
import 'package:clist/core/usecases/usecase.dart';
import 'package:clist/features/clist_resource/domain/entities/clist_resources_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../repositories/clist_resource_repository.dart';

@LazySingleton()
class GetCListResource implements UseCases<List<CListResource>, Params> {
  late final GetClistResourcesRepository clistResourceRepository;

  GetCListResource(this.clistResourceRepository);

  @override
  Future<Either<Failure, List<CListResource>>> call(Params params) async {
    return await clistResourceRepository.getClistResources();
  }
}

class Params extends Equatable {
  @override
  List<Object?> get props => [];
}
