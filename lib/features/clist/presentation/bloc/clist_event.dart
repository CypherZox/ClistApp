import 'package:equatable/equatable.dart';

abstract class ClistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetClist extends ClistEvent {
  GetClist();

  @override
  List<Object> get props => [];
}
