// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    studentId: json['_id'] as int,
    password: json['password'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    permissions: json['permissions'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.studentId,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'permissions': instance.permissions,
    };
