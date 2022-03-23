import 'package:clist/core/errors/exception.dart';
import 'package:clist/core/errors/failures.dart';
import 'package:clist/core/network/network_info.dart';
import 'package:clist/features/clist/data/datasources/clist_local.dart';
import 'package:clist/features/clist/data/datasources/clist_remote.dart';
import 'package:clist/features/clist/data/models/clist_model.dart';
import 'package:clist/features/clist/data/repositories/get_clist_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockClitRemoteDataSource extends Mock implements ClistRemoteDataSource {}

class MockLocalDataSource extends Mock implements CListLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockClitRemoteDataSource mockClitRemoteDataSource =
      MockClitRemoteDataSource();
  MockLocalDataSource mockLocalDataSource = MockLocalDataSource();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  GetClistRepositoryImpl clistRepositoryImpl = GetClistRepositoryImpl(
      remoteDataSource: mockClitRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo);

  setUp(() {
    mockClitRemoteDataSource = MockClitRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    clistRepositoryImpl = GetClistRepositoryImpl(
        remoteDataSource: mockClitRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group("get Clist", () {
    test("should check if the device is online", () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      //act
      clistRepositoryImpl.getClist();

      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });
  group("get Clist from remote data source when device is connected", () {
    final cListModel = CListModel(
        id: 12068175,
        resource: "",
        event: "September Challenge 2018",
        start: DateTime.parse("2018-09-07T09:30:00"),
        end: DateTime.parse("2018-09-17T09:30:00"),
        duration: 864000,
        href: "https://www.codechef.com/SEPT18");

    // final CList cList = cListModel;
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test("should return a Clist entity", () async {
      //arrange
      when(mockClitRemoteDataSource.getCList())
          .thenAnswer((_) async => [cListModel]);
      //act
      final result = await clistRepositoryImpl.getClist();
      //assert
      verify(mockClitRemoteDataSource.getCList());
      verify(mockLocalDataSource.cacheCList([cListModel]));
      expect(result!.isRight(), equals(true));
    });

    test(
        "should return server exception when the call to remote data source isn't successful",
        () async {
      //arrange
      when(mockClitRemoteDataSource.getCList()).thenThrow(ServerException());
      //act
      final result = await clistRepositoryImpl.getClist();
      //assert
      expect(result, equals(Left(ServerFailure())));
    });
  });
  group("dveice is offline", () {
    final cListModel = CListModel(
        id: 12068175,
        resource: "",
        event: "September Challenge 2018",
        start: DateTime.parse("2018-09-07T09:30:00"),
        end: DateTime.parse("2018-09-17T09:30:00"),
        duration: 864000,
        href: "https://www.codechef.com/SEPT18");

    // final CList cList = cListModel;
    setUp(() async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
    test("should return last cList if the device is offline", () async {
      //arrange
      when(mockLocalDataSource.getLastCList())
          .thenAnswer((_) async => [cListModel]);
      //act
      final result = await clistRepositoryImpl.getClist();
      //assert
      verifyZeroInteractions(mockClitRemoteDataSource);
      verify(clistRepositoryImpl.getClist());
      expect(result!.isRight(), equals(true));
    });
    test(
        "should return a cache failure if the call to local data source is unsuccessful",
        () async {
      //arrange
      when(mockLocalDataSource.getLastCList()).thenThrow(CacheException());
      //act
      final result = await clistRepositoryImpl.getClist();
      //assert
      expect(result, Left(CacheFailure()));
    });
  });
}
