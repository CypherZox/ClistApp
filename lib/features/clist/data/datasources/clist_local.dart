import 'package:clist/features/clist/data/models/clist_model.dart';

abstract class CListLocalDataSource {
  Future<CListModel> getLastCList();
  Future<void> cacheCList(CListModel cListModel);
}
