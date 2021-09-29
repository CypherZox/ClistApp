import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:intl/intl.dart';

class CListModel extends CList {
  final int id;
  final Map resources;
  final String event;
  final DateTime start;
  final DateTime end;
  final int duration;
  final String href;
  CListModel(
      {required this.id,
      required this.resources,
      required this.event,
      required this.start,
      required this.end,
      required this.duration,
      required this.href})
      : super(
            duration: duration,
            id: id,
            resources: resources,
            event: event,
            start: start,
            end: end,
            href: href);
  List<Object> get props => [id, resources, event, start, end, duration, href];
  factory CListModel.fromJson(Map<String, dynamic> json) {
    return CListModel(
        id: json['id'],
        resources: json['resource'],
        event: json['event'],
        start: DateTime.parse(json['start']),
        end: DateTime.parse(json['end']),
        duration: json['duration'],
        href: json['href']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resource': resources,
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
        resources: this.resources,
        event: this.event,
        start: this.start,
        end: this.end,
        duration: this.duration,
        href: this.href);
  }
}
