import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clistApp/core/network/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_impl_test.mocks.dart';

// class MockDataconnectionChecker extends Mock implements DataConnectionChecker {
//   Future<bool?>? nHasConnection() {
//     return this.hasConnection;
//   }
// }

@GenerateMocks([], customMocks: [
  MockSpec<DataConnectionChecker>(as: #MockDataconnectionChecker)
])
void main() {
  MockDataconnectionChecker mockDataconnectionChecker =
      MockDataconnectionChecker();
  NetworkInfoImpl networkInfoImpl =
      NetworkInfoImpl(dataConnectionChecker: mockDataconnectionChecker);
  group("isConnected", () {
    test("should forward the call to dataconnection checker", () async {
      //arrange
      final tHasConnection = Future.value(true);
      // Future<bool?>? hasConnection = mockDataconnectionChecker.hasConnection;

      when(mockDataconnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnection);
      //act
      final result = networkInfoImpl.isConnected;

      //assert
      verify(mockDataconnectionChecker.hasConnection);
      expectLater(result, tHasConnection);
    });
  });
}
