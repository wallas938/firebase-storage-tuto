import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:firebase_storage_tuto/feature/user/domain/model/user.model.dart';
import 'package:flutter/foundation.dart';

class FirebaseAppUserProvider {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<AppUser?> createUser(AppUserCredential credentials) async {
    try {
      AppUser user = AppUser.baseUser(
          id: credentials.uid!,
          email: credentials.email,
          username: credentials.name!);

      await _firebaseFirestore.collection("users").add(user.toJson());

      // DocumentSnapshot<Map<String, dynamic>>? doc =
      // await _firebaseFirestore.collection("users").add(data)

      return user;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
        print(e.code);
        rethrow;
      }
      return null;
    }
  }

  Future<AppUser?> getUserByUid(String id) async {
    try {
      DocumentSnapshot<Map<String, dynamic>>? doc =
          await _firebaseFirestore.collection("users").doc(id).get();

      if (doc.exists) {
        AppUser user = AppUser.fromJson(doc.data()!);
        // await _firebaseFirestore.collection("users").add(user.toJson());
        return user;
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
}
