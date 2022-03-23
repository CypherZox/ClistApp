import 'dart:convert';

import 'package:clist/core/errors/exception.dart';
import 'package:clist/features/clist/data/models/clist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

abstract class CListLocalDataSource {
  Future<List<CListModel?>?>? getLastCList();
  Future<void>? cacheCList(List<CListModel?>? cListModel);
}

@LazySingleton(as: CListLocalDataSource)
class CListLocalDataSourceImpl implements CListLocalDataSource {
  final SharedPreferences sharedPreferences;
  CListLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void>? cacheCList(List<CListModel?>? cListModel) {}

  @override
  Future<List<CListModel?>?>? getLastCList() {
    final jsonString = sharedPreferences.getString('CACHED_CLIST');
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);
      final List<CListModel> clist = jsonMap["objects"]
          .map<CListModel>((item) => CListModel.fromJson(item))
          .toList() as List<CListModel>;
      return Future.value(clist);
    } else {
      throw CacheException();
    }
  }
}
