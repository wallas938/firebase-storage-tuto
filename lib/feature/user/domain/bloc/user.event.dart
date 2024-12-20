part of 'user.bloc.dart';

enum UserEventType {
  userInitialEvent,
  userCreationStartEvent,
  userCreationSucceedEvent,
  userCreationFailedEvent,
  userGetByIdStartEvent,
  userGetByIdSucceedEvent,
  userGetByIdFailedEvent,
}

sealed class UserEvent extends Equatable {
  const UserEvent();
}

final class UserInitialEvent extends UserEvent {
  const UserInitialEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class UserCreationStartEvent extends UserEvent {
  final AppUserCredential credential;

  const UserCreationStartEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class UserCreationSucceedEvent extends UserEvent {
  final AppUser newUser;

  const UserCreationSucceedEvent({required this.newUser});

  @override
  List<Object> get props => [newUser];
}

final class UserCreationFailedEvent extends UserEvent {
  final Exception exception;

  const UserCreationFailedEvent({required this.exception});

  @override
  List<Object> get props => [exception];
}

final class UserGetByIdStartEvent extends UserEvent {
  final String id;

  const UserGetByIdStartEvent({required this.id});

  @override
  List<Object> get props => [id];
}

final class UserGetByIdSucceedEvent extends UserEvent {
  final AppUser user;

  const UserGetByIdSucceedEvent({required this.user});

  @override
  List<Object> get props => [user];
}

final class UserGetByIdFailedEvent extends UserEvent {
  final Exception exception;

  const UserGetByIdFailedEvent({required this.exception});

  @override
  List<Object> get props => [exception];
}
