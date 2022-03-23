import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:intl/intl.dart';

class CListModel extends CList {
  final int id;
  final String resource;
  final String event;
  final DateTime start;
  final DateTime end;
  final int duration;
  final String href;
  CListModel(
      {required this.id,
      required this.resource,
      required this.event,
      required this.start,
      required this.end,
      required this.duration,
      required this.href})
      : super(
            duration: duration,
            id: id,
            resource: resource,
            event: event,
            start: start,
            end: end,
            href: href);
  List<Object> get props => [id, resource, event, start, end, duration, href];
  factory CListModel.fromJson(Map<String, dynamic> json) {
    return CListModel(
        id: json['id'],
        resource: json['resource'],
        event: json['event'],
        start: DateTime.parse(json['start']),
        end: DateTime.parse(json['end']),
        duration: json['duration'],
        href: json['href']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resource': resource,
      'event': event,
      'start': DateFormat('yyyy-MM-ddTHH:mm:ss').format(start),
      'end': DateFormat('yyyy-MM-ddTHH:mm:ss').format(end),
      'duration': duration,
      'href': href
    };
  }

  CList toEntity() {
    return CList(
        id: this.id,
        resource: this.resource,
        event: this.event,
        start: this.start,
        end: this.end,
        duration: this.duration,
        href: this.href);
  }
}
