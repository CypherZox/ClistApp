import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:clistApp/features/clist/data/models/clist_model.dart';
import 'package:clistApp/features/clist/domain/entities/clist_entity.dart';

void main() {
  final cListModel = CListModel(
      icon: "",
      id: 12068175,
      resourceId: 1,
      event: "September Challenge 2018",
      start: DateTime.parse("2018-09-07T09:30:00"),
      end: DateTime.parse("2018-09-17T09:30:00"),
      duration: 864000,
      href: "https://www.codechef.com/SEPT18");

  group("fromJson", () {
    test("should return a CList model", () async {
      //arrange
      final jsonMap = json.decode(File('clits.json').readAsStringSync());

      //act
      final result = new CListModel.fromJson(jsonMap["objects"][0]);
      //assert
      expect(result, cListModel);
    });
  });
  group("toJson Map", () {
    test("should return a json map", () async {
      //arrange
      Map<String, dynamic> cListMap = {
        "id": 12068175,
        "duration": 864000,
        "end": "2018-09-17T09:30:00",
        "event": "September Challenge 2018",
        "href": "https://www.codechef.com/SEPT18",
        "resource_id": 1,
        "start": "2018-09-07T09:30:00"
      };

      //act
      final result = cListModel.toJson();
      //assert
      expect(result, cListMap);
    });
  });
  test("CList model should be a subclass of CList entity ", () async {
    expect(cListModel, isA<CList>());
  });
}
