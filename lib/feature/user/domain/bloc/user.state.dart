part of 'user.bloc.dart';

class UserState extends Equatable {
  final String id;
  final String email;
  final String username;
  final String phone;
  final String profilePicture;
  final String bio;
  final String location;
  final Coordinates? coordinates;
  final List<String> eventPreferences;
  final NotificationPreferences? notificationPreferences;
  final List<String> createdEvents;
  final List<String> attendedEvents;
  final List<String> favorites;
  final int points;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime lastLogin;
  final SocialLinks? socialLinks;
  final String language;
  final bool loading;

  const UserState({
    required this.id,
    required this.email,
    required this.username,
    required this.phone,
    required this.profilePicture,
    required this.bio,
    required this.location,
    required this.coordinates,
    required this.eventPreferences,
    required this.notificationPreferences,
    required this.createdEvents,
    required this.attendedEvents,
    required this.favorites,
    required this.points,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.lastLogin,
    required this.socialLinks,
    required this.language,
    required this.loading,
  });

  UserState.initialState()
      : id = '',
        email = '',
        username = '',
        attendedEvents = [],
        bio = '',
        coordinates = null,
        createdAt = DateTime.now(),
        createdEvents = [],
        eventPreferences = [],
        favorites = [],
        followers = 0,
        following = 0,
        language = 'en',
        lastLogin = DateTime.now(),
        location = '',
        notificationPreferences = null,
        phone = '',
        points = 0,
        profilePicture = '',
        socialLinks = null,
        loading = false;

  UserState copyWith(
      {String? id,
      String? email,
      String? username,
      String? phone,
      String? profilePicture,
      String? bio,
      String? location,
      Coordinates? coordinates,
      List<String>? eventPreferences,
      NotificationPreferences? notificationPreferences,
      List<String>? createdEvents,
      List<String>? attendedEvents,
      List<String>? favorites,
      int? points,
      int? followers,
      int? following,
      DateTime? createdAt,
      DateTime? lastLogin,
      SocialLinks? socialLinks,
      String? language,
      bool? loading}) {
    return UserState(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      coordinates: coordinates ?? this.coordinates,
      eventPreferences: eventPreferences ?? this.eventPreferences,
      notificationPreferences:
          notificationPreferences ?? this.notificationPreferences,
      createdEvents: createdEvents ?? this.createdEvents,
      attendedEvents: attendedEvents ?? this.attendedEvents,
      favorites: favorites ?? this.favorites,
      points: points ?? this.points,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      socialLinks: socialLinks ?? this.socialLinks,
      language: language ?? this.language,
      loading: loading ?? this.loading,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
