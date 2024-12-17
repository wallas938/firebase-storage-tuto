part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

 final class AuthenticationEmptyEvent extends AuthenticationEvent {
  const AuthenticationEmptyEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AuthenticationStartEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const AuthenticationStartEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class AuthenticationSucceedEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const AuthenticationSucceedEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class AuthenticationFailedEvent extends AuthenticationEvent {
  final FirebaseAuthException firebaseAuthException;

  const AuthenticationFailedEvent({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}
