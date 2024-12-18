import 'package:firebase_storage_tuto/feature/authentication/data/provider/firebase.authentication.provider.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:get_it/get_it.dart';

import 'authentication.repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuthenticationProvider firebaseAuthenticationProvider =
      GetIt.instance<FirebaseAuthenticationProvider>();

  @override
  Future<AppUserCredential?> signup(AppUserCredential credential) async {
    return await firebaseAuthenticationProvider.signup(
        credential.name!, credential.email, credential.password!);
  }

  @override
  Future<AppUserCredential?> login(AppUserCredential credential) async {
    return await firebaseAuthenticationProvider.login(
        credential.email, credential.password!);
  }
}
