class User {
  final String? email;
  final dynamic? role;
  final String? id;
  final String? fullName;
  final String? password;

  const User({
    this.email,
    this.role,
    this.fullName,
    this.id,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] != null
          ? json['email'] as String
          // ignore: prefer_void_to_null
          : json['email'] as Null,
      role: json['role'] != null
          ? json['role'] as dynamic
          // ignore: prefer_void_to_null
          : json['role'] as Null,
      id: json['id'] != null
          ? json['id'] as String
          // ignore: prefer_void_to_null
          : json['id'] as Null,
      fullName: json['full_name'] != null
          ? json['full_name'] as String
          // ignore: prefer_void_to_null
          : json['full_name'] as Null,
      password: json['password'] != null
          ? json['password'] as String
          // ignore: prefer_void_to_null
          : json['password'] as Null,
    );
  }
}
