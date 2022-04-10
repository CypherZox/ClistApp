import 'dart:convert';
import 'package:clistApp/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '../models/clist_model.dart';

abstract class CListLocalDataSource {
  Future<List<CListModel>> getLastCList();
  Future<void> cacheCList(List<CListModel> cListModel);
}

@LazySingleton(as: CListLocalDataSource)
class CListLocalDataSourceImpl implements CListLocalDataSource {
  final SharedPreferences sharedPreferences;
  CListLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheCList(List<CListModel> cListModel) {
    final cListModelString = encode(cListModel);
    return sharedPreferences.setString('CACHED_CLIST', cListModelString);
  }

  @override
  Future<List<CListModel>> getLastCList() {
    final jsonString = sharedPreferences.getString('CACHED_CLIST');
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);
      final List<CListModel> clist = jsonMap
          .map<CListModel>((item) => CListModel.fromJson(item))
          .toList() as List<CListModel>;
      return Future.value(clist);
    } else {
      return Future.value([]);
    }
  }

  String encode(List<CListModel> cListModel) => json.encode(
        cListModel
            .map<Map<String, dynamic>>((cList) => cList.toJson())
            .toList(),
      );
}
