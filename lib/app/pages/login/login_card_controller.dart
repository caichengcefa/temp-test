import 'package:get/get.dart';

class LoginCardController extends GetxController {
  final loading = false.obs;
  final username = ''.obs;
  final password = ''.obs;

  final usernameError = Rx<String?>(null);
  final passwordError = Rx<String?>(null);

  // 3. 计算属性：检查表单整体是否有效
  bool get isFormValid =>
      usernameError.value == null &&
      passwordError.value == null &&
      username
          .value
          .isNotEmpty // 额外检查是否为空
          &&
      password.value.isNotEmpty;

  // 4. 验证函数
  void validateUsername(String value) {
    if (value.isEmpty) {
      usernameError.value = '用户名不能为空';
    } else {
      usernameError.value = null; // 验证通过
    }
    username.value = value; // 实时更新数据
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = '密码不能为空';
    } else if (value.length < 6) {
      passwordError.value = '密码长度不能少于6位';
    } else {
      passwordError.value = null; // 验证通过
    }
    password.value = value; // 实时更新数据
  }

  // 5. 提交逻辑
  Future<void> submitForm() async {
    try {
      loading.value = true;
      // 强制执行一次验证，以防用户未输入就点击
      validateUsername(username.value);
      validatePassword(password.value);

      if (!isFormValid) {
        // 执行登录/保存操作
        loading.value = false;
        return;
      }

      // final result = await AuthService.instance.login(
      //   username: username.value,
      //   password: password.value,
      // );

      // // 登录成功后跳转到 Home 页面（使用 GetX 路由）
      // Get.offNamed('/home', arguments: result);
    } catch (e) {
      // String msg = '请求失败';
      // if (e.response != null && e.response?.data != null) {
      //   msg = e.response!.data.toString();
      // } else if (e.message != null) {
      //   msg = e.message!;
      // }
      loading.value = false;
    }
  }
}



  // Future<void> _submitForm() async {
  //   if (!_formKey.currentState!.validate()) return;

  //   try {
  //     final result = await AuthService.instance.login(
  //       username: username,
  //       password: password,
  //     );

  //     // 登录成功后跳转到 Home 页面（使用 GetX 路由）
  //     Get.offNamed('/home', arguments: result);
  //   } on DioException catch (e) {
  //     String msg = '请求失败';
  //     if (e.response != null && e.response?.data != null) {
  //       msg = e.response!.data.toString();
  //     } else if (e.message != null) {
  //       msg = e.message!;
  //     }
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('登录失败: $msg')));
  //   } catch (e) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('登录异常: $e')));
  //   } finally {
  //     if (mounted) setState(() => _loading = false);
  //   }
  // }
