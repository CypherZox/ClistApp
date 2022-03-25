import 'package:equatable/equatable.dart';

class CList extends Equatable {
  final int id;
  final int resourceId;
  final String event;
  final DateTime start;
  final DateTime end;
  final int duration;
  final String href;
  final String icon;

  CList(
      {required this.id,
      required this.resourceId,
      required this.event,
      required this.start,
      required this.end,
      required this.duration,
      required this.href,
      required this.icon});
  List<Object> get props =>
      [id, resourceId, event, start, end, duration, href, icon];
}
