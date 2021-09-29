import 'dart:convert';

import 'package:clist/core/errors/exception.dart';
import 'package:clist/features/clist/data/models/clist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CListLocalDataSource {
  Future<CListModel>? getLastCList();
  Future<void>? cacheCList(CListModel cListModel);
}

class CListLocalDataSourceImpl implements CListLocalDataSource {
  final SharedPreferences sharedPreferences;
  CListLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void>? cacheCList(CListModel cListModel) {}

  @override
  Future<CListModel>? getLastCList() {
    final jsonString = sharedPreferences.getString('CACHED_CLIST');
    if (jsonString != null) {
      return Future.value(CListModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
