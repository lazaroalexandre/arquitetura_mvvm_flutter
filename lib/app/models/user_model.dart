// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? id;
  final String name;
  final String sex;
  final String avatar;
  final String email;
  final String job;
  final String phone;
  UserModel({
    this.id,
    required this.name,
    required this.sex,
    required this.email,
    required this.job,
    required this.phone,
  }) : avatar = name[0].toUpperCase();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sex': sex,
      'avatar': avatar,
      'email': email,
      'job': job,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      sex: map['sex'] as String,
      email: map['email'] as String,
      job: map['job'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}