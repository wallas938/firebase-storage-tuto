import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/repository/authentication.repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc(this.authenticationRepository)
      : super(const AuthenticationState.initialState()) {
    on<AuthenticationStartEvent>((event, emit) async {
      if (kDebugMode) {
        print("AuthenticationStartEvent: $state");
      }
      try {
        emit(state.copyWith(loading: true));
        AppUserCredential? credential =
            await authenticationRepository.signup(event.credential);
        if (credential != null) {
          add(AuthenticationSucceedEvent(credential: credential));
          return;
        }
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(loading: false));

        FirebaseAuthException error = FirebaseAuthException(
            code: e.code,
            message: e.message,
            email: e.email,
            credential: e.credential,
            phoneNumber: e.phoneNumber,
            tenantId: e.tenantId);
        add(AuthenticationFailedEvent(firebaseAuthException: error));
      }
    });

    /// AUTHENTICATION SUCCESS
    on<AuthenticationSucceedEvent>((event, emit) async {
      if (kDebugMode) {
        print("AuthenticationSucceedEvent: $state");
      }
      emit(state.copyWith(
          name: event.credential.name,
          email: event.credential.email,
          loading: false,
          exceptionMessage: null,
          isVerified: false));
    });

    /// AUTHENTICATION FAILURE
    on<AuthenticationFailedEvent>((event, emit) async {
      if (kDebugMode) {
        print("AuthenticationFailedEvent: $state");
      }
      emit(state.copyWith(exceptionMessage: event.firebaseAuthException));
    });
  }
}
