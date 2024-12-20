part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
// final String name;
// final String email;
// final bool isVerified;
// final bool loading;
// final FirebaseAuthException? exceptionMessage;
// final AuthenticationEventType lastEvent;
//
// const AuthenticationState({
//   required this.name,
//   required this.email,
//   required this.isVerified,
//   required this.loading,
//   required this.exceptionMessage,
//   required this.lastEvent,
// });
//
// const AuthenticationState.initialState()
//     : name = '',
//       email = '',
//       isVerified = false,
//       loading = false,
//       exceptionMessage = null,
//       lastEvent = AuthenticationEventType.authenticationInitialEvent;
//
// AuthenticationState copyWith(
//     {String? name,
//     String? email,
//     bool? isVerified,
//     bool? loading,
//     FirebaseAuthException? exceptionMessage,
//     AuthenticationEventType? lastEvent}) {
//   return AuthenticationState(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       isVerified: isVerified ?? this.isVerified,
//       loading: loading ?? this.loading,
//       exceptionMessage: exceptionMessage ?? this.exceptionMessage,
//       lastEvent: lastEvent ?? this.lastEvent);
// }
//
// @override
// // TODO: implement props
// List<Object?> get props =>
//     [name, email, isVerified, loading, exceptionMessage, lastEvent];
}

class AuthenticationLastState extends AuthenticationState {
  final AuthenticationState lastState;

  AuthenticationLastState({required this.lastState});
}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class RegisterFailureState extends AuthenticationState {
  final FirebaseAuthException firebaseAuthException;

  RegisterFailureState({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}

class LoginSuccessState extends AuthenticationState {
  final AppUserCredential credential;

  LoginSuccessState({required this.credential});

  @override
  List<Object> get props => [credential];
}

class LoginFailureState extends AuthenticationState {
  final FirebaseAuthException firebaseAuthException;

  LoginFailureState({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}
