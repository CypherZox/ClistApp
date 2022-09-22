import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String displayImage;
  final String displayName;
  final String email;
  User(
      {required this.uid,
      required this.displayImage,
      required this.displayName,
      required this.email});
  List<Object> get props => [uid, displayImage, displayName, email];
}
