part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final String name;
  final String email;
  final bool isVerified;
  final bool loading;
  final FirebaseAuthException? exceptionMessage;
  final AuthenticationEventType lastEvent;

  const AuthenticationState({
    required this.name,
    required this.email,
    required this.isVerified,
    required this.loading,
    required this.exceptionMessage,
    required this.lastEvent,
  });

  const AuthenticationState.initialState()
      : name = '',
        email = '',
        isVerified = false,
        loading = false,
        exceptionMessage = null,
        lastEvent = AuthenticationEventType.authenticationInitialEvent;

  AuthenticationState copyWith(
      {String? name,
      String? email,
      bool? isVerified,
      bool? loading,
      FirebaseAuthException? exceptionMessage,
      AuthenticationEventType? lastEvent}) {
    return AuthenticationState(
        name: name ?? this.name,
        email: email ?? this.email,
        isVerified: isVerified ?? this.isVerified,
        loading: loading ?? this.loading,
        exceptionMessage: exceptionMessage ?? this.exceptionMessage,
        lastEvent: lastEvent ?? this.lastEvent);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, email, isVerified, loading, exceptionMessage, lastEvent];
}
