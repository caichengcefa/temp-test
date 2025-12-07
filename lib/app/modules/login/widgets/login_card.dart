import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/core/widgets/text_form_field.dart';
import 'package:flutter_application_1/app/modules/login/controllers/login_card_controller.dart';
import 'package:flutter_application_1/app/services/request.dart';
import 'package:get/get.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 卡片尺寸与风格
    const double cardWidth = 360;
    const double cardPadding = 40;
    final LoginCardController controller = Get.find<LoginCardController>();

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(left: 200),
      padding: const EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF152A55).withValues(alpha: 0.8), // 略微透明的深蓝色背景
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 标题：登录
          const Text(
            '登录',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 30),

          // 输入框：用户名
          Obx(
            () => MTextFormField(
              icon: Icons.person_outline,
              hintText: '请输入用户名',
              errorText: controller.usernameError.value,
              onChanged: (value) => controller.username.value = value,
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => MTextFormField(
              isPassword: true,
              icon: Icons.lock_outline,
              hintText: '请输入密码',
              errorText: controller.passwordError.value,
              onChanged: (value) => controller.password.value = value,
            ),
          ),
          const SizedBox(height: 40),
          // 按钮：登录
          Obx(
            () => SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: controller.loading.value
                    ? null
                    : controller.submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0096FF), // 亮蓝色
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: controller.loading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('登录'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
