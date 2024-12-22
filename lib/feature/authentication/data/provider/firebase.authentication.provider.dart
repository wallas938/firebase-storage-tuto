import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AppUserCredential?> signup(AppUserCredential credential) async {
    try {
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
          email: credential.email, password: credential.password!);

      if (data.user != null) {
        AppUserCredential appUserCredential = AppUserCredential(
            uid: data.user!.uid,
            name: credential.name,
            email: credential.email,
            password: credential.password);

        if (kDebugMode) {
          print(
              "FirebaseAuthenticationProvider : signup ${appUserCredential.uid}");
        }

        return appUserCredential;
      }
      return null;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
        print(e.code);
        rethrow;
      }
    }
    return null;
  }

  Future<AppUserCredential?> login(AppUserCredential credential) async {
    try {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(
          email: credential.email, password: credential.password!);

      if (data.user != null) {

        AppUserCredential appUserCredential = AppUserCredential(
            uid: data.user!.uid,
            name: credential.name,
            email: credential.email);
        // await _firebaseFirestore.collection("users").add(user.toJson());
        return appUserCredential;
      }
      return null;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
        print(e.code);
        rethrow;
      }
    }
    return null;
  }

  AppUserCredential? getCurrentUser() {
    if (_firebaseAuth.currentUser != null) {
      AppUserCredential user = AppUserCredential(
          email: _firebaseAuth.currentUser!.email!,
          name: _firebaseAuth.currentUser!.displayName,
          uid: _firebaseAuth.currentUser!.uid);
      return user;
    }
    return null;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
