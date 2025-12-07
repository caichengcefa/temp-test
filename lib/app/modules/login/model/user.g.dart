// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  token: json['access_token'] as String? ?? '',
  name: json['name'] as String,
  email: json['email'] as String? ?? 'Unknown',
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'access_token': instance.token,
  'name': instance.name,
  'email': instance.email,
};
