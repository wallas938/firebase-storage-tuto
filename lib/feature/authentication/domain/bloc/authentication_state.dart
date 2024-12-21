part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AuthenticationLastState extends AuthenticationState {
  final AuthenticationState lastState;

  const AuthenticationLastState({required this.lastState});
}

final class AuthenticationLoadingState extends AuthenticationState {}

final class AuthenticationInitialState extends AuthenticationState {}

final class RegisterFailureState extends AuthenticationState {
  final FirebaseAuthException firebaseAuthException;

  const RegisterFailureState({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}

final class LoginSuccessState extends AuthenticationState {
  final AppUserCredential credential;

  const LoginSuccessState({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class LoginFailureState extends AuthenticationState {
  final FirebaseAuthException firebaseAuthException;

  const LoginFailureState({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}
