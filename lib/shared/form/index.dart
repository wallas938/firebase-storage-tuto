import 'package:flutter/material.dart';

///
/// CONSTANTS

const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

///
/// ENUMS

enum FieldErrorState { initial, invalid, valid }

enum FirebaseExceptions {
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed,
  weakPassword,
  tooManyRequests,
  userTokenExpired,
  networkRequestFailed,
}

///
/// CLASSES

class FieldData {
  TextEditingController textEditingController;
  FocusNode focusNode;
  bool isFocused;
  bool isDirty;
  FieldErrorState hasError;
  String? errorMessage;

  FieldData(
      {required this.textEditingController,
      required this.focusNode,
      required this.isFocused,
      required this.isDirty,
      required this.errorMessage,
      required this.hasError});
}

/// - **email-already-in-use**:
///  - Thrown if there already exists an account with the given email address.
/// - **invalid-email**:
///  - Thrown if the email address is not valid.
/// - **operation-not-allowed**:
///  - Thrown if email/password accounts are not enabled. Enable
///    email/password accounts in the Firebase Console, under the Auth tab.
/// - **weak-password**:
///  - Thrown if the password is not strong enough.
/// - **too-many-requests**:
///  - Thrown if the user sent too many requests at the same time, for security
///     the api will not allow too many attemps at the same time, user will have
///     to wait for some time
/// - **user-token-expired**:
///  - Thrown if the user is no longer authenticated since his refresh token
///    has been expired
/// - **network-request-failed**:
///  - Thrown if there was a network request error, for example the user don't
///    don't have internet connection

class MyFirebaseAuthException {
  static String emailAlreadyInUse = "email-already-in-use";
  static String invalidEmail = "invalid-email";
  static String operationNotAllowed = "operation-not-allowed";
  static String weakPassword = "weak-password";
  static String tooManyRequests = "too-many-requests";
  static String userTokenExpired = "user-token-expired";
  static String networkRequestFailed = "network-request-failed";
}
