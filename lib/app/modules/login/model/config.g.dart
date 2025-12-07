// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
  appName: (json['app_name'] as num).toInt(),
  versionCode: (json['version_code'] as num).toInt(),
  features: (json['features'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
  'app_name': instance.appName,
  'version_code': instance.versionCode,
  'features': instance.features,
};
