import 'package:clist/core/auth/domain/repositories/authentication.repo.dart';
import 'package:clist/core/auth/domain/usecases/email_login.uc.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'email_login.uc_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late final MockAuthRepo mockAuthRepo;
  late final LogInWithEmailAndPassword logInWithEmailAndPassword;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    logInWithEmailAndPassword = LogInWithEmailAndPassword(mockAuthRepo);
  });

  test("when log in with email a Unit is returned", () async {
    //arrange
    when(logInWithEmailAndPassword
            .call(Params(email: "email@email.com", pass: "Aio2i@@@")))
        .thenAnswer((_) async => Right(unit));
    //act
    final result = await logInWithEmailAndPassword
        .call(Params(email: "email@email.com", pass: "Aio2i@@@"));
    //assert
    expect(result.isRight(), equals(true));
  });
}
