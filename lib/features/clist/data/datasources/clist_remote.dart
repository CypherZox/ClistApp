import 'dart:convert';
import 'package:clistApp/core/errors/exception.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../config/constants/api_constants.dart';
import '../models/clist_model.dart';

abstract class ClistRemoteDataSource {
  Future<List<CListModel>> getCList();
}

@LazySingleton(as: ClistRemoteDataSource)
class ClistRemoteDataSourceImpl implements ClistRemoteDataSource {
  final http.Client httpClient;
  ClistRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<CListModel>> getCList() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    final http.Response response = await httpClient.get(
      ApiConstants.uri(formattedDate),
      headers: ApiConstants.header,
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return jsonMap["objects"]
          .map<CListModel>((item) => CListModel.fromJson(item))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
