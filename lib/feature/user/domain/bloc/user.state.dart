part of 'user.bloc.dart';

abstract class UserState extends Equatable {}

final class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserCreatedState extends UserState {
  UserCreatedState();

  @override
  List<Object?> get props => [];
}

final class UserCreationFailureState extends UserState {
  final Exception exception;

  UserCreationFailureState({required this.exception});

  @override
  List<Object?> get props => [exception];
}

final class UserFetchedState extends UserState {
  final AppUser user;

  UserFetchedState({required this.user});

  @override
  List<Object?> get props => [user];
}

final class UserFetchingFailure extends UserState {
  final Exception exception;

  UserFetchingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
