import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clistApp/features/clist/domain/usecases/get_cached_clist.dart'
    as gcc;
import 'package:injectable/injectable.dart';

import '../../../../config/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_clist.dart';
import 'bloc.dart';

@injectable
class ClistBloc extends Bloc<ClistEvent, ClistState> {
  final GetCList getClist;
  final gcc.GetCachedCListUc getCachedClist;

  ClistBloc({required this.getClist, required this.getCachedClist})
      : super(Empty()) {
    on<GetClist>((event, emit) async {
      emit(Loading());
      final cachedClist = await getCachedClist(gcc.Params());
      // cachedClist.fold(
      //     (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      //     (loadedClist) => emit(CacheLoaded(clist: loadedClist)));
      final clist = await getClist(Params());
      clist.fold(
          (failure) => emit(Error(message: _mapFailureToMessage(failure))),
          (loadedClist) => emit(Loaded(clist: loadedClist)));
    });
    on<GetCachedClist>((event, emit) async {
      emit(Loading());
      final clist = await getCachedClist(gcc.Params());
      clist.fold(
          (failure) => emit(Error(message: _mapFailureToMessage(failure))),
          (loadedClist) => emit(CacheLoaded(clist: loadedClist)));
    });
  }

  ClistState get initialState => Empty();
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
