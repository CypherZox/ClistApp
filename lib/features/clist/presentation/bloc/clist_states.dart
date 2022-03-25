import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:equatable/equatable.dart';

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

class Error extends ClistState {
  final String message;
  Error({required this.message});
  List<Object> get props => [message];
}
