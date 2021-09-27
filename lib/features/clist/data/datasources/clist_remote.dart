import 'package:clist/features/clist/data/models/clist_model.dart';

abstract class ClistRemoteDataSource {
  Future<CListModel>? getClist();
}
