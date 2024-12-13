class AppUser {
  String uid;
  String name;
  String email;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return AppUser(
      uid: uid,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
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