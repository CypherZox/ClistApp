import 'package:cached_network_image/cached_network_image.dart';
import 'package:clist/features/clist_resource/domain/entities/clist_resources_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/clist_entity.dart';

class GlassHome extends StatelessWidget {
  final double start;
  final double end;
  final List<CList> list;
  final List<CListResource> clistRes;

  const GlassHome(
      {Key? key,
      required this.start,
      required this.end,
      required this.list,
      required this.clistRes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: GlassContainer(
              opacity: 0.17,
              shadowStrength: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 17,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://clist.by${_getIconById(list[index].resourceId, clistRes)}',
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].event,
                            textAlign: TextAlign.left,
                            maxLines: 5,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Start: ${DateFormat('yyyy-MM-dd').format(list[index].start)}",
                            textAlign: TextAlign.left,
                          ),
                          Text(
                              "Duration: ${_mapDurationToDaysOrMins(list[index].duration)}",
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 7,
                          ),
                          CountdownTimer(
                            endTime: list[index].end.millisecondsSinceEpoch,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              height: 190,
              width: 10,
            ),
          );
        });
  }

  _mapDurationToDaysOrMins(int du) {
    final String identifier;
    final String value;
    if (du > 86399) {
      identifier = 'Days';
      value = Duration(seconds: du).inDays.toString();
      return value + ' ' + identifier;
    } else if (du > 3599) {
      identifier = 'hours';
      value = Duration(seconds: du).inHours.toString();
      return value + ' ' + identifier;
    } else {
      identifier = 'minutes';
      value = Duration(seconds: du).inMinutes.toString();
      return value + ' ' + identifier;
    }
  }

  _getIconById(int id, List<CListResource> resources) {
    final iconRes =
        resources.where((CListResource resource) => resource.id == id).toList();
    return iconRes[0].icon;
  }
}
