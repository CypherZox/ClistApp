import 'package:clistApp/core/auth/domain/entities/user.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseUserMapper {
  u.User? toDomain(User? _) {
    return _ == null
        ? null
        : u.User(
            uid: _.uid,
            displayName: _.displayName!,
            displayImage: _.photoURL!,
            email: _.email!);
  }
}
