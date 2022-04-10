import 'package:flutter/material.dart';
import 'package:clistApp/config/constants/dimentios.dart';
import 'package:clistApp/features/clist/presentation/pages/responsive_clist_view.dart/large_mobile.dart';
import 'package:clistApp/features/clist/presentation/pages/responsive_clist_view.dart/medium_mobile.dart';
import 'package:clistApp/features/clist/presentation/pages/responsive_clist_view.dart/small_mobile.dart';

import '../../../../clist_resource/domain/entities/clist_resources_entity.dart';
import '../../../domain/entities/clist_entity.dart';

class ResponsiveClistView extends StatelessWidget {
  final double start;
  final double end;
  final List<CList> list;
  final List<CListResource> clistRes;

  const ResponsiveClistView(
      {Key? key,
      required this.start,
      required this.end,
      required this.list,
      required this.clistRes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mediumMobile) {
        return CListSView(
            start: start, end: end, list: list, clistRes: clistRes);
      }
      if (constraints.maxWidth < largeMobile) {
        return CListMView(
            start: start, end: end, list: list, clistRes: clistRes);
      }
      return CListLView(start: start, end: end, list: list, clistRes: clistRes);
    });
  }
}
