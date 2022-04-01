import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clist/features/clist_resource/domain/entities/clist_resources_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1), blurRadius: 1, spreadRadius: 2)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
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
                          width: 230,
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
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              _addToCal(
                                  list[index].event,
                                  list[index].href,
                                  list[index].start,
                                  list[index].end,
                                  list[index].duration);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.1)),
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                  style: BorderStyle.solid),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icons8-calendar-24.png',
                                  width: 13,
                                  height: 13,
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text('add to calendar')
                              ],
                            ),
                            color: Color(0xffFFD700).withOpacity(0.6),
                          ),
                          Spacer(),
                          MaterialButton(
                            onPressed: () {
                              _launchInBrowser(list[index].href);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.1)),
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                  style: BorderStyle.solid),
                            ),
                            child: Row(
                              children: [
                                Text('go to '),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 6,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://clist.by${_getIconById(list[index].resourceId, clistRes)}',
                                      width: 9,
                                      height: 9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // height: 190,
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

  _addToCal(
      String event, String href, DateTime start, DateTime end, int duration) {
    Add2Calendar.addEvent2Cal(Event(
      title: event,
      description: '',
      location: href,
      startDate: start,
      endDate: end,
      iosParams: IOSParams(
          reminder: Duration(
              seconds:
                  duration)), // on iOS, you can set alarm notification after your event.

      androidParams: AndroidParams(
        emailInvites: [], // on Android, you can add invite emails to your event.
      ),
    ));
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
}
