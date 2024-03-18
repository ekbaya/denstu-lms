// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String username;
  final String phone;
  final String email;
  final String created_at;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.created_at,
  });

  User copyWith({
    String? id,
    String? name,
    String? username,
    String? phone,
    String? email,
    String? created_at,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'phone': phone,
      'email': email,
      'created_at': created_at,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, phone: $phone, email: $email, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.username == username &&
        other.phone == phone &&
        other.email == email &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        created_at.hashCode;
  }
}
