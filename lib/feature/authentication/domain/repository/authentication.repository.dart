import 'package:firebase_storage_tuto/feature/authentication/domain/model/wls.user.model.dart';

abstract class AuthenticationRepository {
  AppUser? signup(AppUserCredential credential);
}
