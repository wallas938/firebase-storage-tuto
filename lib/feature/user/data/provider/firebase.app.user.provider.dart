import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:firebase_storage_tuto/feature/user/domain/model/user.model.dart';
import 'package:flutter/foundation.dart';

class FirebaseAppUserProvider {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<AppUser?> createUser(AppUserCredential credential) async {
    if (kDebugMode) {
      print("FirebaseAppUserProvider createUser(uid) : ${credential.uid}");
    }
    try {
      AppUser user = AppUser.baseUser(
          uid: credential.uid!,
          email: credential.email,
          username: credential.name!);

      await _firebaseFirestore
          .collection("users")
          .doc(credential.uid!)
          .set(user.toJson());

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

  Future<AppUser?> getUserByUid(String uid) async {
    if (kDebugMode) {
      print("FirebaseAppUserProvider getUserByUid(uid) $uid");
    }
    try {
      final userDoc =
          await _firebaseFirestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        AppUser user = AppUser.fromJson(userDoc.data()!);

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
