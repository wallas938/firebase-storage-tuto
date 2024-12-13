import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/wls.user.model.dart';

class FirebaseAuthenticationRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<AppUser?> signup(String name, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        final user = AppUser(uid: userCredential.user!.uid, name: name, email: email);

        await firebaseFirestore.collection("users").add(user.toJson());

        return user;
      }
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
