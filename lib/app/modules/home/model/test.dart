import 'package:json_annotation/json_annotation.dart';

// ⚠️ 关键：导入生成的代码文件。文件名约定为 '文件名.g.dart'
part 'test.g.dart';

// 1. 应用核心注解
@JsonSerializable()
class Test {
  final String user;
  final String test;

  // 4. 构造函数
  Test({required this.user, required this.test});

  // 5. ⚠️ 关键：工厂方法 for JSON 反序列化
  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  // 6. ⚠️ 关键：实例方法 for JSON 序列化
  Map<String, dynamic> toJson() => _$TestToJson(this);
}
