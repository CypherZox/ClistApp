import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:intl/intl.dart';

class CListModel extends CList {
  final int id;
  final int resourceId;
  final String event;
  final DateTime start;
  final DateTime end;
  final int duration;
  final String href;
  final String icon;
  CListModel(
      {required this.id,
      required this.resourceId,
      required this.event,
      required this.start,
      required this.end,
      required this.duration,
      required this.href,
      required this.icon})
      : super(
            duration: duration,
            id: id,
            resourceId: resourceId,
            event: event,
            start: start,
            end: end,
            href: href,
            icon: icon);
  List<Object> get props => [id, resourceId, event, start, end, duration, href];
  factory CListModel.fromJson(Map<String, dynamic> json) {
    return CListModel(
        id: json['id'],
        resourceId: json['resource_id'],
        event: json['event'],
        start: DateTime.parse(json['start']),
        end: DateTime.parse(json['end']),
        duration: json['duration'],
        href: json['href'],
        icon: '');
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resource_id': resourceId,
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
        resourceId: this.resourceId,
        event: this.event,
        start: this.start,
        end: this.end,
        duration: this.duration,
        href: this.href,
        icon: '');
  }
}
