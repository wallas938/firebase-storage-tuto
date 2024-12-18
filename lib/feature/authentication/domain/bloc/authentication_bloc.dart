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
    /// SIGNING UP START
    on<SignupStartEvent>((event, emit) async {
      if (kDebugMode) {
        print("SignupStartEvent");
      }
      try {
        emit(state.copyWith(loading: true));

        AppUserCredential? credential =
            await authenticationRepository.signup(event.credential);
        if (credential != null) {
          add(SignupSucceedEvent(credential: credential));
        } else {
          emit(state.copyWith(loading: false));
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
        add(SignupFailedEvent(firebaseAuthException: error));
      }
    });

    /// SIGNING UP SUCCESS
    on<SignupSucceedEvent>((event, emit) async {
      if (kDebugMode) {
        print("SignupSucceedEvent");
      }
      emit(state.copyWith(
          name: event.credential.name,
          email: event.credential.email,
          loading: false,
          exceptionMessage: null,
          isVerified: false,
          lastEvent: AuthenticationEventType.signupSucceedEvent));
    });

    /// SIGNING UP FAILURE
    on<SignupFailedEvent>((event, emit) async {
      if (kDebugMode) {
        print("SignupFailedEvent");
      }
      emit(state.copyWith(
          exceptionMessage: event.firebaseAuthException,
          lastEvent: AuthenticationEventType.signupFailedEvent));
    });

    /// CHECK IF USER IS ALREADY AUTHENTICATED
    on<AuthenticationCheckEvent>((event, emit) {
      emit(state.copyWith(
          lastEvent: AuthenticationEventType.authenticationCheckEvent));

      AppUserCredential? appUserCredential =
          authenticationRepository.getCurrentUser();

      if (appUserCredential != null) {
        add(LoginSucceedEvent(credential: appUserCredential));
      } else {
        emit(state.copyWith(
            lastEvent: AuthenticationEventType.authenticationInitialEvent));
      }
    });

    /// LOGIN START
    on<LoginStartEvent>((event, emit) async {
      if (kDebugMode) {
        print("LoginStartEvent");
      }
      try {
        emit(state.copyWith(loading: true));

        AppUserCredential? credential =
            await authenticationRepository.login(event.credential);
        if (credential != null) {
          add(LoginSucceedEvent(credential: credential));
        } else {
          emit(state.copyWith(loading: false));
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
        add(LoginFailedEvent(firebaseAuthException: error));
      }
    });

    /// LOGIN SUCCESS
    on<LoginSucceedEvent>((event, emit) async {
      if (kDebugMode) {
        print("LoginSucceedEvent");
      }
      emit(state.copyWith(
          name: 'event.credential.name',
          email: event.credential.email,
          loading: false,
          exceptionMessage: null,
          isVerified: false,
          lastEvent: AuthenticationEventType.loginSucceedEvent));
      if (kDebugMode) {
        print("state : $state");
      }
    });

    /// LOGIN FAILURE
    on<LoginFailedEvent>((event, emit) async {
      if (kDebugMode) {
        print("LoginFailedEvent");
      }
      emit(state.copyWith(
          exceptionMessage: event.firebaseAuthException,
          lastEvent: AuthenticationEventType.loginFailedEvent));
    });
  }
}
