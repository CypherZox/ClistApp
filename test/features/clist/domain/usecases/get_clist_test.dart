import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:clist/features/clist/domain/repositories/clist_repository.dart';
import 'package:clist/features/clist/domain/usecases/get_clist.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_clist_test.mocks.dart';

@GenerateMocks([GetClistRepository])
void main() {
  late final MockGetClistRepository mockCListRepository;
  late final GetCList usecase;

  setUp(() {
    mockCListRepository = MockGetClistRepository();
    usecase = GetCList(mockCListRepository);
  });

  final CList cList = CList(
      icon: "",
      id: 1,
      resourceId: 1,
      event: "event",
      start: DateTime.now(),
      end: DateTime.now(),
      duration: 10,
      href: "href");
  test("Get List should return a list of Clist items from repository ",
      () async {
    //assert
    when(mockCListRepository.getClist())
        .thenAnswer((_) async => Right([cList]));
    //act
    final result = await usecase.call(Params());
    //arrange
    expect(result.isRight(), equals(true));
  });
}
