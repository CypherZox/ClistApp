import 'package:equatable/equatable.dart';

class CList extends Equatable {
  final int id;
  final String resource;
  final String event;
  final DateTime start;
  final DateTime end;
  final int duration;
  final String href;

  CList(
      {required this.id,
      required this.resource,
      required this.event,
      required this.start,
      required this.end,
      required this.duration,
      required this.href});
  List<Object> get props => [id, resource, event, start, end, duration, href];
}
