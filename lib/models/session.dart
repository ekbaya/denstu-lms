// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dentsu_lms/models/user.dart';

class Session {
  String? token;
  String? refresh_token;
  User? user;
  Session({
    this.token,
    this.refresh_token,
    this.user,
  });

  Session copyWith({
    String? token,
    String? refresh_token,
    User? user,
  }) {
    return Session(
      token: token ?? this.token,
      refresh_token: refresh_token ?? this.refresh_token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'refresh_token': refresh_token,
      'user': user!.toMap(),
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      token: map['token'] as String,
      refresh_token: map['refresh_token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Session.fromJson(String source) =>
      Session.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Session(token: $token, refresh_token: $refresh_token, user: $user)';

  @override
  bool operator ==(covariant Session other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.refresh_token == refresh_token &&
        other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ refresh_token.hashCode ^ user.hashCode;
}
