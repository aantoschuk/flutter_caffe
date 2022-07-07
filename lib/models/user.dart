class User {
  final String? email;
  final int? role;
  final String? id;
  final String? fullName;

  const User({
    this.email,
    this.role,
    this.fullName,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] != null
          ? json['email'] as String
          // ignore: prefer_void_to_null
          : json['email'] as Null,
      role: json['role'] != null
          ? json['role'] as int
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
    );
  }
}
