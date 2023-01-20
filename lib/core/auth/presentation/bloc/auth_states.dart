import 'package:clistApp/core/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated({required this.user});
  List<Object> get props => [user];
}

class unauthenticated extends AuthState {}

class Error extends AuthState {
  final String message;
  Error({required this.message});
  List<Object> get props => [message];
}
