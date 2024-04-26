import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String name;
  final String avatar;
  final String sex;
  final String email;
  final String job;
  UserModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.sex,
    required this.email,
    required this.job,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avatar': avatar,
      'sex': sex,
      'email': email,
      'job': job,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      sex: map['sex'] as String,
      email: map['email'] as String,
      job: map['job'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
