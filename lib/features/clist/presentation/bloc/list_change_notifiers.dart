// import 'package:clist/config/constants/api_constants.dart';
// import 'package:clist/core/errors/failures.dart';
// import 'package:clist/features/clist/domain/entities/clist_entity.dart';
// import 'package:clist/features/clist/domain/usecases/get_clist.dart';
// import 'package:clist/features/clist/presentation/changenotifiers/clist_states.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/cupertino.dart';

// class ClistProvider extends ChangeNotifier {
//   List _cList = [];
//   List get getClist => _cList;
//   final GetCList getCLisst;
//   ClistProvider({
//     required GetCList getCList,
//   }) : getCLisst = getCList;

//   Stream<ClistState> getClistState() async* {
//     yield Loading();
//     final failureOrClist = await getCLisst.call(Params());
//     yield* _eitherLoadedOrErrorState(failureOrClist);
//   }
// }

// Stream<ClistState> _eitherLoadedOrErrorState(
//   Either<Failure?, List<CList?>?>? failureOrTrivia,
// ) async* {
//   yield failureOrTrivia!.fold(
//     (failure) => Error(message: _mapFailureToMessage(failure!)),
//     (clist) => Loaded(clist: clist),
//   );
// }

// String _mapFailureToMessage(Failure failure) {
//   switch (failure.runtimeType) {
//     case ServerFailure:
//       return ErrorMessages.serverFailureMessage;
//     case CacheFailure:
//       return ErrorMessages.cacheFailureMessage;
//     default:
//       return 'Unexpected error';
//   }
// }
