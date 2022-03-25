import 'package:clist/features/clist_resource/domain/usecases/get_clist_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import 'bloc.dart';

@injectable
class ClistResourceBloc extends Bloc<ClistResourceEvent, ClistResourceState> {
  final GetCListResource getCListResource;

  ClistResourceBloc({required this.getCListResource}) : super(Empty()) {
    on<GetClistR>((event, emit) async {
      emit(Loading());
      final clist = await getCListResource(Params());
      clist.fold(
          (failure) => emit(Error(message: _mapFailureToMessage(failure))),
          (loadedClistResources) {
        emit(Loaded(cListResources: loadedClistResources));
      });
    });
    on<GetClistRReset>((event, emit) async {
      emit(Empty());
    });
  }

  ClistResourceState get initialState => Empty();
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return ErrorMessages.serverFailureMessage;
    case CacheFailure:
      return ErrorMessages.cacheFailureMessage;
    default:
      return 'Unexpected error';
  }
}
