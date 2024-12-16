part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

final class AuthenticationStartEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

final class AuthenticationSucceedEvent extends AuthenticationState {
  final AppUserCredential user;

  const AuthenticationSucceedEvent({required this.user});

  @override
  List<Object> get props => [user];
}

final class AuthenticationFailedEvent extends AuthenticationState {
  final FirebaseAuthException firebaseAuthException;

  const AuthenticationFailedEvent({required this.firebaseAuthException});

  @override
  List<Object> get props => [firebaseAuthException];
}
