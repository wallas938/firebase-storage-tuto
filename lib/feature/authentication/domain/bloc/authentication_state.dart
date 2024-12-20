part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
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
