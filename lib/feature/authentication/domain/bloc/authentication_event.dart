part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

final class CheckAuthenticationEvent extends AuthenticationEvent {
  const CheckAuthenticationEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class RegisterUserEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const RegisterUserEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class LoginEvent extends AuthenticationEvent {
  final AppUserCredential credential;

  const LoginEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class UpdateLastEvent extends AuthenticationEvent {
  final AuthenticationState lastState;

  const UpdateLastEvent({required this.lastState});

  @override
  // TODO: implement props
  List<Object?> get props => [lastState];
}
