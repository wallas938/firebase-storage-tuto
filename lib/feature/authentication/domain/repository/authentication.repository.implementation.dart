import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage_tuto/feature/authentication/data/provider/firebase.authentication.provider.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/wls.user.model.dart';
import 'package:get_it/get_it.dart';

import 'authentication.repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuthenticationProvider firebaseAuthenticationProvider =
      GetIt.instance<FirebaseAuthenticationProvider>();

  @override
  void signup(AppUserCredential credential) async {
    AppUser user = await firebaseAuthenticationProvider.signup(credential.name, credential.email, credential.password);
  }
}
