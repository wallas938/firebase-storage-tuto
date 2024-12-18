part of 'authentication_bloc.dart';

enum AuthenticationEventType {
  authenticationInitialEvent,
  signupStartEvent,
  signupSucceedEvent,
  signupFailedEvent,
  loginStartEvent,
  loginSucceedEvent,
  loginFailedEvent,
}

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

final class AuthenticationInitialEvent extends AuthenticationEvent {
  const AuthenticationInitialEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SignupStartEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const SignupStartEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class SignupSucceedEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const SignupSucceedEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class SignupFailedEvent extends AuthenticationEvent {
  final FirebaseAuthException firebaseAuthException;

  const SignupFailedEvent({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}

final class LoginStartEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const LoginStartEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class LoginSucceedEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const LoginSucceedEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class LoginFailedEvent extends AuthenticationEvent {
  final FirebaseAuthException firebaseAuthException;

  const LoginFailedEvent({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}
