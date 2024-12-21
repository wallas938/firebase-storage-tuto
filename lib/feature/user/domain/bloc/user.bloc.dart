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
    on<CreateUserEvent>((event, emit) async {
      if (kDebugMode) {
        print("CreateUserEvent");
      }
      try {
        emit(UserLoadingState());
        AppUser? user = await userRepository.createUser(event.credential);
        if (user != null) {
          emit(UserCreatedState(newUser: user));
        }
      } on Exception catch (error) {
        emit(UserCreationFailureState(exception: Exception(error)));
      }
    });
    on<GetUserEvent>((event, emit) async {
      if (kDebugMode) {
        print("CreateUserEvent");
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
    });
  }
}
