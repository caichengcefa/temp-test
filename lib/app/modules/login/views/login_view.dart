import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // 定义主要颜色
    const Color primaryBlue = Color(0xFF007AFF); // 按钮蓝
    const Color wechatGreen = Color(0xFF00C853); // 微信绿
    const Color textBlue = Color(0xFF1E88E5); // 标语蓝

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black87),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // 1. 顶部 Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 这里用 Icon 代替图片 logo
                  const Icon(Icons.cloud_queue, color: textBlue, size: 30),
                  const SizedBox(width: 8),
                  const Text(
                    '宇泰物联333',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // 2. 中间插画 (占位符)
              // 实际开发中请使用: Image.asset('assets/hero_image.png')
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.public,
                  size: 100,
                  color: Colors.blueAccent,
                ),
              ),

              const SizedBox(height: 30),

              // 3. 标语文本
              const Text(
                '登录即可控制物联设备\n千里之外也在股掌之间',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textBlue,
                  height: 1.5, // 行高
                ),
              ),

              const Spacer(flex: 2),

              // 4. 手机号登录按钮
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone_android, color: Colors.white),
                  label: const Text(
                    '手机号登录',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 5. 微信登录按钮
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.wechat,
                    color: Colors.white,
                  ), // 需确保有对应图标或使用类似图标
                  label: const Text(
                    '微信登录',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: wechatGreen,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 1),

              // 6. 底部协议文字
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    children: [
                      const TextSpan(text: '注册代表你同意'),
                      TextSpan(
                        text: '《用户协议》',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' 和 '),
                      TextSpan(
                        text: '《隐私政策》',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
