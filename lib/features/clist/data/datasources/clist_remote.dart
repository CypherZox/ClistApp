import 'dart:convert';

import 'package:clist/config/constants/api_constants.dart';
import 'package:clist/core/errors/exception.dart';
import 'package:clist/features/clist/data/models/clist_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class ClistRemoteDataSource {
  Future<List<CListModel?>?>? getCList();
}

@LazySingleton(as: ClistRemoteDataSource)
class ClistRemoteDataSourceImpl implements ClistRemoteDataSource {
  final http.Client httpClient;
  ClistRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<CListModel?>?>? getCList() async {
    final http.Response response = await httpClient.get(
      ApiConstants.uri,
      headers: ApiConstants.header,
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      print(jsonMap);
      return jsonMap["objects"]
          .map<CListModel>((item) => CListModel.fromJson(item))
          .toList();
    } else {
      print(response.statusCode);
      throw ServerException();
    }
  }
}
