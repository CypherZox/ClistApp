import 'dart:ffi';

import 'package:clist/core/auth/domain/usecases/signout.uc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'email_login.uc_test.mocks.dart';

void main() {
  late final MockAuthRepo mockAuthRepo;
  late final SignOut signOut;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    signOut = SignOut(mockAuthRepo);
  });

  test("when a user loggs out return type is void", () async {
    //arrange
    when(signOut.call(Params())).thenAnswer((_) async => Right(Void));
    //act
    final result = await signOut.call(Params());
    //assert
    expect(result.isRight(), true);
  });
}
