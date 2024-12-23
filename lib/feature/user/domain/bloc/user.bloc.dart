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

  UserBloc(this.userRepository) : super(UserInitialState()) {
    /// CREATE A NEW USER
    on<CreateUserEvent>(_createUser);
    on<FetchUserEvent>(_fetchUser);
  }

  _createUser(event, emit) async {
    if (kDebugMode) {
      print("CreateUserEvent");
    }
    try {
      emit(UserLoadingState());

      await userRepository.createUser(event.credential);

      emit(UserCreatedState());

      add(FetchUserEvent(id: event.credential.uid));

    } on Exception catch (error) {
      emit(UserCreationFailureState(exception: Exception(error)));
    }
  }

  _fetchUser(event, emit) async {
    if (kDebugMode) {
      print("FetchUserEvent");
    }
    try {
      emit(UserLoadingState());

      AppUser? user = await userRepository.getUserById(event.id);
      if (user != null) {
        emit(UserFetchedState(user: user));
      }
    } on Exception catch (error) {
      emit(UserCreationFailureState(exception: Exception(error)));
    }
  }
}
