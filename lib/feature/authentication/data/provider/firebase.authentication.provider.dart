import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/wls.user.model.dart';


class FirebaseAuthenticationProvider {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<AppUserCredential?> signup(String name, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        AppUserCredential user =
            AppUserCredential(uid: userCredential.user!.uid, name: name, email: email);

        await firebaseFirestore.collection("users").add(user.toJson());

        return user;
      }
      return null;
    } on FirebaseException catch (e) {
      switch (e.code) {
        //   case "email-already-in-use":
        //     return "L'email est déja utilisé";
        //
        //   case "invalid-email":
        //     return "L'email est est invalid";
        //
        //   case "operation-not-allowed":
        //     return "Une erreur s'est produite";
        //
        //   case "weak-password":
        //     return "Le mot de passe doit contenir plus de 6 caractères";
        //
        //   case "too-many-requests":
        //     return "Une erreur s'est produite, veuillez réessayez dans quelques miniutes";
        //
        //   case "user-token-expired":
        //     return "L'email est déja utilisé";
        // }
      }
    }
    return null;
  }
}
