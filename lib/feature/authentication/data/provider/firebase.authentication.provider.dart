import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AppUserCredential?> signup(
      String name, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        // await _firebaseFirestore.collection("users").add(user.toJson());

        return AppUserCredential(
            uid: userCredential.user!.uid, name: name, email: email);
      }
      return null;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
        print(e.code);
      }
    }
    return null;
  }
}