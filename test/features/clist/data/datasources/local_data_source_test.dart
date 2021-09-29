import 'dart:convert';

import 'package:clist/core/errors/exception.dart';
import 'package:clist/core/errors/failures.dart';
import 'package:clist/features/clist/data/datasources/clist_local.dart';
import 'package:clist/features/clist/data/models/clist_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<CListLocalDataSourceImpl>(
    as: #MockCListLocalDataSourceImpl,
    returnNullOnMissingStub: true,
  ),
  MockSpec<SharedPreferences>(
      as: #MockSharedPreferences, returnNullOnMissingStub: true)
])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  CListLocalDataSourceImpl cListLocalDataSourceImpl =
      CListLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  setUp(() {
    MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
    CListLocalDataSourceImpl mockCListLocalDataSourceImpl =
        CListLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("get last CList ", () {
    final Map<String, dynamic> jsonMap = json
        .decode(File('clits.json').readAsStringSync()) as Map<String, dynamic>;
    final cListModel = CListModel.fromJson(jsonMap);
    test("should return a clist model", () async {
      //arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(File('clits.json').readAsStringSync());
      //act
      final result = await cListLocalDataSourceImpl.getLastCList();
      //assert
      verify(mockSharedPreferences.getString("CACHED_CLIST"));
      expect(result, equals(cListModel));
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
