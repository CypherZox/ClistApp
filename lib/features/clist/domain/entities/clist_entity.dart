import 'package:equatable/equatable.dart';

class CList extends Equatable {
  final int id;
  final Map resources;
  final String event;
  final DateTime start;
  final DateTime end;
  final int duration;
  final String href;

  CList(
      {required this.id,
      required this.resources,
      required this.event,
      required this.start,
      required this.end,
      required this.duration,
      required this.href});
  List<Object> get props => [id, resources, event, start, end, duration, href];
}
