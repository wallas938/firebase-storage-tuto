/// AppUserCredential Data for authentication
library;

class AppUserCredential {
  String? uid;
  String? name;
  String email;
  String? password;

  AppUserCredential({
    required this.uid,
    required this.name,
    required this.email,
    this.password,
  });

  AppUserCredential copyWith({
    String? uid,
    String? name,
    String? email,
    String? password,
  }) {
    return AppUserCredential(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory AppUserCredential.fromJson(Map<String, dynamic> json) {
    return AppUserCredential(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}