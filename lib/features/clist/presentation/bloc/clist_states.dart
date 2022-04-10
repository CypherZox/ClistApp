import 'package:equatable/equatable.dart';

import '../../domain/entities/clist_entity.dart';

class ClistState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends ClistState {}

class Empty extends ClistState {}

class Loaded extends ClistState {
  final List<CList> clist;
  Loaded({required this.clist});
  List<Object> get props => [clist];
}

class CacheLoaded extends ClistState {
  final List<CList> clist;
  CacheLoaded({required this.clist});
  List<Object> get props => [clist];
}

class Error extends ClistState {
  final String message;
  Error({required this.message});
  List<Object> get props => [message];
}
