import 'package:equatable/equatable.dart';

import '../../domain/entities/clist_resources_entity.dart';

class ClistResourceState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends ClistResourceState {}

class Empty extends ClistResourceState {}

class Loaded extends ClistResourceState {
  final List<CListResource> cListResources;
  Loaded({required this.cListResources});
  List<Object> get props => [cListResources];
}

class Error extends ClistResourceState {
  final String message;
  Error({required this.message});
  List<Object> get props => [message];
}
