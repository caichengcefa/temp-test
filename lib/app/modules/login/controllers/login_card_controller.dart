import 'package:flutter_application_1/app/core/init/global.dart';
import 'package:flutter_application_1/app/modules/login/model/user.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/services/request.dart';

class LoginCardController extends GetxController {
  final loading = false.obs;
  final username = ''.obs;
  final password = ''.obs;

  final usernameError = Rx<String?>(null);
  final passwordError = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();

    // 🔑 watch: 侦听 count 变量，每次改变都执行打印
    ever(username, (value) {
      print('>>> Watch Triggered: Count 变化为 $value');
      // 可以在这里执行日志记录或数据同步操作
    });

    debounce(username, (query) {
      print('>>> [DEBOUNCE] 停止输入 $query，发起网络请求...');
      // 示例：调用 searchAPI(query);
    }, time: const Duration(milliseconds: 500));
  }

  @override
  void onClose() {
    super.onClose();
    print('close');
  }

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
      validateUsername(username.value);
      validatePassword(password.value);
      if (!isFormValid) {
        loading.value = false;
        return;
      }

      User user = await ApiRequest.api.postLogin({
        'username': username.value,
        'password': password.value,
        // 'username': 'test',
        // 'password': '123456',
      });
      print(user);
      Global.prefs.setString('token', user.token);
      Get.offNamed('/home');
      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }
}
