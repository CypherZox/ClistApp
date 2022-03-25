import 'package:clist/features/clist/domain/usecases/get_clist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import 'bloc.dart';

@injectable
class ClistBloc extends Bloc<ClistEvent, ClistState> {
  final GetCList getClist;

  ClistBloc({required this.getClist}) : super(Empty()) {
    on<GetClist>((event, emit) async {
      emit(Loading());
      final clist = await getClist(Params());
      clist.fold(
          (failure) => emit(Error(message: _mapFailureToMessage(failure))),
          (loadedClist) => emit(Loaded(clist: loadedClist)));
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
