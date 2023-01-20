import 'package:clistApp/core/auth/data/models/firebase_user_mapper.dart';
import 'package:clistApp/core/auth/data/repositories/authentication.repo.impl.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:clistApp/core/auth/domain/entities/user.dart' as u;

import 'authentication.repo.impl_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<FirebaseAuth>(as: #MockFirebaseAuth, returnNullOnMissingStub: true),
  MockSpec<GoogleSignIn>(as: #MockGoogleSignIn, returnNullOnMissingStub: true),
  MockSpec<UserCredential>(
      as: #MockUserCredential, returnNullOnMissingStub: true),
  MockSpec<FirebaseUserMapper>(
      as: #MockFirebaseUserMapper, returnNullOnMissingStub: true),
])
void main() {
  late final AuthRepoImpl authRepoImpl;
  MockFirebaseUserMapper mockFirebaseUserMapper;
  MockFirebaseAuth mockFirebaseAuth;
  MockGoogleSignIn mockGoogleSignIn;
  MockUserCredential mockUserCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockUserCredential = MockUserCredential();
    MockFirebaseUserMapper mockFirebaseUserMapper = MockFirebaseUserMapper();
    authRepoImpl = AuthRepoImpl(
        firebaseAuth: mockFirebaseAuth,
        googleSignIn: mockGoogleSignIn,
        firebaseUserMapper: mockFirebaseUserMapper);
  });
  final u.User? user = u.User(
      displayImage: "IMAGE",
      uid: "userId#2400",
      displayName: "MyName",
      email: "email@test.com");

  test("User is not returned when the firebase user is null", () async {
    //arrange

    when(MockFirebaseUserMapper().toDomain(MockFirebaseAuth().currentUser))
        .thenReturn(null);
    //act
    final result = await authRepoImpl.getSignedInUser();
    //asset
    expect(result.isRight(), equals(false));
  });
}
