import 'package:json_annotation/json_annotation.dart';

// ⚠️ 关键：导入生成的代码文件。文件名约定为 '文件名.g.dart'
part 'user.g.dart';

// 1. 应用核心注解
@JsonSerializable()
class User {
  @JsonKey(name: 'access_token', defaultValue: '')
  final String token;
  // 2. 使用 @JsonKey 重命名 JSON 字段
  // @JsonKey(name: 'name')
  final String name;

  // 3. 使用 @JsonKey 设置默认值
  @JsonKey(name: 'email', defaultValue: 'Unknown')
  final String email;

  // 4. 构造函数
  User({required this.token, required this.name, required this.email});

  // 5. ⚠️ 关键：工厂方法 for JSON 反序列化
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // 6. ⚠️ 关键：实例方法 for JSON 序列化
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
