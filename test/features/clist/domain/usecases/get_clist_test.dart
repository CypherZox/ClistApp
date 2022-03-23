import 'package:clist/features/clist/domain/entities/clist_entity.dart';
import 'package:clist/features/clist/domain/repositories/clist_repository.dart';
import 'package:clist/features/clist/domain/usecases/get_clist.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCListRepository extends Mock implements GetClistRepository {}

void main() {
  MockCListRepository mockCListRepository = MockCListRepository();
  GetCList usecase = GetCList(mockCListRepository);

  setUp(() {
    mockCListRepository = MockCListRepository();
    usecase = GetCList(mockCListRepository);
  });

  final CList cList = CList(
      id: 1,
      resource: "",
      event: "event",
      start: DateTime.now(),
      end: DateTime.now(),
      duration: 10,
      href: "href");
  test("Get List shoul return a list of Clist items from repository ",
      () async {
    //assert
    when(mockCListRepository.getClist())
        .thenAnswer((_) async => Right([cList]));
    //act
    final result = await usecase.call();
    //arrange
    expect(result!.isRight(), equals(true));
  });
}
