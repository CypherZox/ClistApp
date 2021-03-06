import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../config/constants/api_constants.dart';
import '../../../../core/errors/exception.dart';
import '../models/clist_model.dart';

abstract class ClistResourceRemoteDataSource {
  Future<List<CListResourceModel>> getCListResources();
}

@LazySingleton(as: ClistResourceRemoteDataSource)
class ClistResourceRemoteDataSourceImpl
    implements ClistResourceRemoteDataSource {
  final http.Client httpClient;
  ClistResourceRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<CListResourceModel>> getCListResources() async {
    final http.Response response = await httpClient.get(
      ApiConstants.uriResource,
      headers: ApiConstants.header,
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return jsonMap["objects"]
          .map<CListResourceModel>((item) => CListResourceModel.fromJson(item))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
