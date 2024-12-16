class AppUserCredential {
  String uid;
  String name;
  String email;

  AppUserCredential({
    required this.uid,
    required this.name,
    required this.email,
  });

  AppUserCredential copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return AppUserCredential(
      uid: uid,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory AppUserCredential.fromJson(Map<String, dynamic> json) {
    return AppUserCredential(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}

// {
// "id": "12345",
// "email": "user@example.com",
// "firstName": "John",
// "lastName": "Doe",
// "username": "john_doe",
// "phone": "+1234567890",
// "profilePicture": "https://example.com/profile.jpg",
// "bio": "Passionate about tech and events.",
// "location": "New York",
// "coordinates": { "latitude": 40.7128, "longitude": -74.0060 },
// "eventPreferences": ["music", "tech", "sports"],
// "notificationPreferences": {
// "email": true,
// "push": true
// },
// "role": "attendee",
// "isVerified": true,
// "createdEvents": [],
// "attendedEvents": ["event123", "event456"],
// "favorites": ["event789"],
// "points": 150,
// "followers": 10,
// "following": 5,
// "createdAt": "2024-01-01T00:00:00Z",
// "lastLogin": "2024-12-15T12:34:56Z",
// "socialLinks": {
// "twitter": "https://twitter.com/johndoe",
// "instagram": "https://instagram.com/johndoe"
// },
// "language": "en"
// }

class AppUser {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final String phone;
  final String profilePicture;
  final String bio;
  final String location;
  final String coordinates;
  final String eventPreferences;
  final String notificationPreferences;
  final String role;
  final String isVerified;
  final String createdEvents;
  final String attendedEvents;
  final String favorites;
  final String points;
  final String followers;
  final String following;
  final String createdAt;
  final String lastLogin;
  final String socialLinks;
  final String language;
}
