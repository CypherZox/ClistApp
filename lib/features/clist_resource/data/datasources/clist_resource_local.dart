import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exception.dart';
import '../models/clist_model.dart';

abstract class CListResourcesLocalDataSource {
  Future<List<CListResourceModel>> getLastCListR();
  Future<void>? cacheCListR(List<CListResourceModel> cListResList);
}

const clistResKey = 'CACHED_CLIST_RECOURCES';

@LazySingleton(as: CListResourcesLocalDataSource)
class CListResourcesLocalDataSourceImpl
    implements CListResourcesLocalDataSource {
  final SharedPreferences sharedPreferences;
  CListResourcesLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheCListR(List<CListResourceModel> cListResList) {
    final clistResListString = _encode(cListResList);
    return sharedPreferences.setString(clistResKey, clistResListString);
  }

  @override
  Future<List<CListResourceModel>> getLastCListR() {
    try {
      final jsonString = sharedPreferences.getString(clistResKey);
      if (jsonString != null) {
        final jsonMap = json.decode(jsonString);
        final List<CListResourceModel> clist = jsonMap
            .map<CListResourceModel>(
                (item) => CListResourceModel.fromJson(item))
            .toList() as List<CListResourceModel>;
        return Future.value(clist);
      } else {
        throw CacheException();
      }
    } catch (e) {
      return Future.value([]);
    }
  }

  String _encode(List<CListResourceModel> cListResList) => json.encode(
        cListResList
            .map<Map<String, dynamic>>((cListRes) => cListRes.toJson())
            .toList(),
      );
}
