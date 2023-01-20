import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetClist extends AuthEvent {
  GetClist();

  @override
  List<Object> get props => [];
}
