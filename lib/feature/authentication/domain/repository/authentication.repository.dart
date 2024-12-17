import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';

abstract class AuthenticationRepository {
  Future<AppUserCredential?> signup(AppUserCredential credential);
}
