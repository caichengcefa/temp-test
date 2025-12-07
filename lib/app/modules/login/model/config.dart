import 'package:json_annotation/json_annotation.dart';

// ⚠️ 关键：导入生成的代码文件。文件名约定为 '文件名.g.dart'
part 'config.g.dart';

// 1. 应用核心注解
@JsonSerializable()
class Config {
  @JsonKey(name: 'app_name')
  final int appName;
  @JsonKey(name: 'version_code')
  final int versionCode;
  final List<String> features;

  // 4. 构造函数
  Config({
    required this.appName,
    required this.versionCode,
    required this.features,
  });

  // 5. ⚠️ 关键：工厂方法 for JSON 反序列化
  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  // 6. ⚠️ 关键：实例方法 for JSON 序列化
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
