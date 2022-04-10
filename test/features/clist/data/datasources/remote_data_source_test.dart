import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:clistApp/config/constants/api_constants.dart';
import 'package:clistApp/core/errors/exception.dart';
import 'package:clistApp/features/clist/data/datasources/clist_remote.dart';
import 'package:clistApp/features/clist/data/models/clist_model.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient, returnNullOnMissingStub: true)
])
void main() {
  MockHttpClient httpClient = MockHttpClient();
  ClistRemoteDataSourceImpl clistRemoteDataSourceImpl =
      ClistRemoteDataSourceImpl(httpClient: httpClient);
  setUp(() {});
  group("rempote data source implementation", () {
    test(
        "should return a list of clist when the get requst is called inside the remote data source impl",
        () async {
      //arrange
      final jsonMap = json.decode(File('clits.json').readAsStringSync());
      // final cListModel = CListModel.fromJson(jsonMap);
      final List<CListModel> cListModelList = jsonMap["objects"]
          .map<CListModel>((item) => CListModel.fromJson(item))
          .toList();
      when(httpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
          (_) async =>
              http.Response((File('clits.json').readAsStringSync()), 200));
      //act
      final response = await clistRemoteDataSourceImpl.getCList();
      //assert
      verify(httpClient.get(any, headers: ApiConstants.header)).called(1);
      expect(response, cListModelList);
    });
    test(
        "should throw a server exception when the call to remoute data source isn't successful",
        () async {
      //arrange
      when(httpClient.get(any, headers: anyNamed("headers")))
          .thenAnswer((_) async => http.Response("something went wrong", 404));
      //act
      final call = clistRemoteDataSourceImpl.getCList;
      //assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
