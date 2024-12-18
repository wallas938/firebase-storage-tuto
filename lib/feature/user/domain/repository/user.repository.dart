import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:firebase_storage_tuto/feature/user/domain/model/user.model.dart';

abstract class UserRepository {
  Future<AppUser?> createUser(AppUserCredential credentials);
  Future<AppUser?> getUserById(String id);
}
