import 'package:equatable/equatable.dart';

class CListResource extends Equatable {
  final String icon;
  final int id;

  CListResource({required this.icon, required this.id});
  List<Object> get props => [icon, id];
}
