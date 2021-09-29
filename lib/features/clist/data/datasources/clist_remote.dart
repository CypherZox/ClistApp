import 'package:clist/features/clist/data/models/clist_model.dart';
import 'package:clist/features/clist/domain/entities/clist_entity.dart';

abstract class ClistRemoteDataSource {
  Future<CListModel?>? getCList();
}
