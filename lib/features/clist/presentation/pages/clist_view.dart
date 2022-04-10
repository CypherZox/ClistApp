import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:clistApp/config/constants/app_constants.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../clist_resource/domain/entities/clist_resources_entity.dart';
import '../../domain/entities/clist_entity.dart';
import '../bloc/clist_bloc.dart';
import '../bloc/clist_event.dart';

class CListView extends StatelessWidget {
  final double start;
  final double end;
  final List<CList> list;
  final List<CListResource> clistRes;

  const CListView(
      {Key? key,
      required this.start,
      required this.end,
      required this.list,
      required this.clistRes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async =>
          BlocProvider.of<ClistBloc>(context).add(GetClist()),
      child: ListView.builder(
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
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
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
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
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
                                  style: AppText.regularStyle.copyWith(
                                      fontSize: 14,
                                      fontFamily: 'OpenSans-SemiBold'),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Start: ",
                                      style: AppText.regularStyle.copyWith(
                                          fontSize: 12,
                                          fontFamily: 'OpenSans-SemiBold',
                                          color: AppColors.secondaryText),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: DateFormat('yyyy-MM-dd')
                                              .format(list[index].start),
                                          style: AppText.regularStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                        )
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Duration: ",
                                      style: AppText.regularStyle.copyWith(
                                          fontSize: 12,
                                          fontFamily: 'OpenSans-SemiBold',
                                          color: AppColors.secondaryText),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: _mapDurationToDaysOrMins(
                                              list[index].duration),
                                          style: AppText.regularStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                        )
                                      ]),
                                ),
                                // Text(
                                //   "Start: ${DateFormat('yyyy-MM-dd').format(list[index].start)}",
                                //   textAlign: TextAlign.left,
                                //   style: AppText.regularStyle
                                //         .copyWith(fontSize: 12, fontFamily: 'OpenSans-SemiBold',color: AppColors.secondaryText),
                                // ),
                                // Text(
                                //     "Duration: ${_mapDurationToDaysOrMins(list[index].duration)}",
                                //     textAlign: TextAlign.left),
                                SizedBox(
                                  height: 7,
                                ),
                                CountdownTimer(
                                  endTime:
                                      list[index].end.millisecondsSinceEpoch,
                                  textStyle: AppText.regularStyle.copyWith(
                                    fontSize: 12,
                                    fontFamily: 'OpenSans-SemiBold',
                                  ),
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
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            MaterialButton(
                              elevation: 3,
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
                                    BorderRadius.all(Radius.circular(13)),
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
                                  Text(
                                    'Add to calendar',
                                    maxLines: 4,
                                    style: AppText.regularStyle
                                        .copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              color: Color(0xffFFE347),
                            ),
                            Spacer(),
                            MaterialButton(
                              elevation: 6,
                              onPressed: () {
                                _launchInBrowser(list[index].href);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                side: BorderSide(
                                    color: Colors.grey,
                                    width: 0.8,
                                    style: BorderStyle.solid),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Go to ',
                                    style: AppText.regularStyle
                                        .copyWith(fontSize: 12),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 6,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://clist.by${_getIconById(list[index].resourceId, clistRes)}',
                                        width: 9,
                                        height: 9,
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
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
          }),
    );
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
