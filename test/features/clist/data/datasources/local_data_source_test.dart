import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:clistApp/core/errors/exception.dart';
import 'package:clistApp/features/clist/data/datasources/clist_local.dart';
import 'package:clistApp/features/clist/data/models/clist_model.dart';
import 'dart:io';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SharedPreferences>(
      as: #MockSharedPreferences, returnNullOnMissingStub: true)
])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  CListLocalDataSourceImpl cListLocalDataSourceImpl =
      CListLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  setUp(() {});

  group("get last CList ", () {
    final jsonMap = json.decode(File('clits_local.json').readAsStringSync());
    // final cListModel = CListModel.fromJson(jsonMap);
    final List<CListModel> cListModelList =
        jsonMap.map<CListModel>((item) => CListModel.fromJson(item)).toList();
    test("should return a clist model", () async {
      //arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(File('clits_local.json').readAsStringSync());
      //act
      final result = await cListLocalDataSourceImpl.getLastCList();
      //assert
      verify(mockSharedPreferences.getString("CACHED_CLIST"));
      expect(result, equals(cListModelList));
    });
    test("should return cache failure when get last CList returns null",
        () async {
      //arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      //act
      final call = cListLocalDataSourceImpl.getLastCList;
      //assert
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });
}
