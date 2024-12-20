import 'package:equatable/equatable.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:firebase_storage_tuto/feature/user/domain/model/user.model.dart';
import 'package:firebase_storage_tuto/feature/user/domain/repository/user.repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user.event.dart';

part 'user.state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserState.initialState()) {
    /// CREATE A NEW USER
    on<UserCreationStartEvent>((event, emit) async {
      if (kDebugMode) {
        print("UserCreationStartEvent");
      }
      try {
        emit(state.copyWith(loading: true));

        AppUser? user = await userRepository.createUser(event.credential);
        if (user != null) {
          add(UserCreationSucceedEvent(newUser: user));
        } else {
          emit(state.copyWith(loading: false));
        }
      } on Exception catch (error) {
        emit(state.copyWith(loading: false));

        add(UserCreationFailedEvent(exception: Exception(error)));
      }
    });

    /// SIGNING UP SUCCESS
    on<UserCreationSucceedEvent>((event, emit) async {
      if (kDebugMode) {
        print("UserCreationSucceedEvent");
      }
      emit(event.newUser as UserState);
    });
  }
}
