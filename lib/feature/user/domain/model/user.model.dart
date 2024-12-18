/// AppUser Data is used for defining app users
class AppUser {
  final String id;
  final String email;
  final String username;
  final String? phone;
  final String? profilePicture;
  final String? bio;
  final String? location;
  final Coordinates? coordinates;
  final List<String>? eventPreferences;
  final NotificationPreferences? notificationPreferences;
  final String? role;
  final List<String>? createdEvents;
  final List<String>? attendedEvents;
  final List<String>? favorites;
  final int? points;
  final int? followers;
  final int? following;
  final DateTime? createdAt;
  final DateTime? lastLogin;
  final SocialLinks? socialLinks;
  final String? language;

  AppUser({
    required this.id,
    required this.email,
    required this.username,
    this.phone,
    this.profilePicture,
    this.bio,
    this.location,
    this.coordinates,
    this.eventPreferences,
    this.notificationPreferences,
    this.role,
    this.createdEvents,
    this.attendedEvents,
    this.favorites,
    this.points,
    this.followers,
    this.following,
    this.createdAt,
    this.lastLogin,
    this.socialLinks,
    this.language,
  });

  AppUser copyWith({
    String? email,
    String? username,
    String? phone,
    String? profilePicture,
    String? bio,
    String? location,
    Coordinates? coordinates,
    List<String>? eventPreferences,
    NotificationPreferences? notificationPreferences,
    String? role,
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
  }) {
    return AppUser(
      id: id,
      email: email ?? this.email,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      coordinates: coordinates ?? this.coordinates,
      eventPreferences: eventPreferences ?? this.eventPreferences,
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
      role: role ?? this.role,
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
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      profilePicture: json['profilePicture'],
      bio: json['bio'],
      location: json['location'],
      coordinates: json['coordinates'] != null ? Coordinates(
        latitude: json['coordinates']['latitude'],
        longitude: json['coordinates']['longitude'],
      ) : null,
      eventPreferences: json['eventPreferences'] != null ? List<String>.from(json['eventPreferences']) : null,
      notificationPreferences: json['notificationPreferences'] != null ? NotificationPreferences(
        email: json['notificationPreferences']['email'],
        push: json['notificationPreferences']['push'],
      ) : null,
      role: json['role'],
      createdEvents: json['createdEvents'] != null ? List<String>.from(json['createdEvents']) : null,
      attendedEvents: json['attendedEvents'] != null ? List<String>.from(json['attendedEvents']) : null,
      favorites: json['favorites'] != null ? List<String>.from(json['favorites']) : null,
      points: json['points'],
      followers: json['followers'],
      following: json['following'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      lastLogin: json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
      socialLinks: json['socialLinks'] != null ? SocialLinks(
        twitter: json['socialLinks']['twitter'],
        instagram: json['socialLinks']['instagram'],
      ) : null,
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'phone': phone,
      'profilePicture': profilePicture,
      'bio': bio,
      'location': location,
      'coordinates': coordinates != null ? {
        'latitude': coordinates!.latitude,
        'longitude': coordinates!.longitude,
      } : null,
      'eventPreferences': eventPreferences,
      'notificationPreferences': notificationPreferences != null ? {
        'email': notificationPreferences!.email,
        'push': notificationPreferences!.push,
      } : null,
      'role': role,
      'createdEvents': createdEvents,
      'attendedEvents': attendedEvents,
      'favorites': favorites,
      'points': points,
      'followers': followers,
      'following': following,
      'createdAt': createdAt?.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'socialLinks': socialLinks != null ? {
        'twitter': socialLinks!.twitter,
        'instagram': socialLinks!.instagram,
      } : null,
      'language': language,
    };
  }
}

/// AppUser Data is used for defining app users
class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });
}

class NotificationPreferences {
  final bool email;
  final bool push;

  NotificationPreferences({
    required this.email,
    required this.push,
  });
}

class SocialLinks {
  final String twitter;
  final String instagram;

  SocialLinks({
    required this.twitter,
    required this.instagram,
  });
}