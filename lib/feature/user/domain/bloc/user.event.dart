part of 'user.bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();
}

final class CreateUserEvent extends UserEvent {
  final AppUserCredential credential;

  const CreateUserEvent({required this.credential});

  @override
  List<Object> get props => [credential];
}

final class GetUserEvent extends UserEvent {
  final String id;

  const GetUserEvent({required this.id});

  @override
  List<Object> get props => [id];
}
