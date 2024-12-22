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
      : super(AuthenticationInitialState()) {
    /// CHECK IF USER IS ALREADY AUTHENTICATED
    on<CheckAuthenticationEvent>(_checkUserAuthentication);

    /// SIGNING UP EVENT
    on<RegisterUserEvent>(_signup);

    /// LOGIN START EVENT
    on<LoginEvent>(_login);
  }

  _signup(event, emit) async {
    if (kDebugMode) {
      print("RegisterUserEvent");
    }
    try {
      emit(AuthenticationLoadingState());

      AppUserCredential? credential =
          await authenticationRepository.signup(event.credential);
      if (credential != null) {
        add(LoginEvent(
            credential: AppUserCredential(
                uid: credential.uid,
                name: credential.name,
                email: credential.email,
                password: credential.password)));
      }
    } on FirebaseAuthException catch (e) {
      FirebaseAuthException error = FirebaseAuthException(
          code: e.code,
          message: e.message,
          email: e.email,
          credential: e.credential,
          phoneNumber: e.phoneNumber,
          tenantId: e.tenantId);

      emit(RegisterFailureState(firebaseAuthException: error));
    }
  }

  _login(event, emit) async {
    if (kDebugMode) {
      print("LoginEvent");
    }
    try {
      emit(AuthenticationLoadingState());

      AppUserCredential? credential =
          await authenticationRepository.login(event.credential);

      if (credential != null) {
        emit(LoginSuccessState(
            credential: AppUserCredential(
                email: credential.email, name: credential.name, uid: credential.uid)));
      }
    } on FirebaseAuthException catch (e) {
      FirebaseAuthException error = FirebaseAuthException(
          code: e.code,
          message: e.message,
          email: e.email,
          credential: e.credential,
          phoneNumber: e.phoneNumber,
          tenantId: e.tenantId);

      emit(LoginFailureState(firebaseAuthException: error));
    }
  }

  _checkUserAuthentication(event, emit) {
    if (kDebugMode) {
      print("CheckAuthenticationEvent");
    }
    emit(AuthenticationLoadingState());

    AppUserCredential? credential = authenticationRepository.getCurrentUser();

    if (credential != null) {

      emit(LoginSuccessState(credential: credential));

    }
    emit(AuthenticationInitialState());
  }
}
