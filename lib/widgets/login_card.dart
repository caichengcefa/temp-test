import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 卡片尺寸与风格
    const double cardWidth = 360;
    const double cardPadding = 40;

    return Container(
      width: cardWidth,
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
          _buildLoginInputField(
            hintText: '请输入用户名',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 20),

          // 输入框：密码
          _buildLoginInputField(
            hintText: '请输入密码',
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 40),

          // 按钮：登录
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // 登录逻辑
                // print('尝试登录...');
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0096FF), // 亮蓝色
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('登录'),
            ),
          ),
        ],
      ),
    );
  }

  // 辅助函数：构建输入框
  Widget _buildLoginInputField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.3), // 输入框内部的深色背景
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // 移除边框线
        ),
        // 如果需要左侧图标，可以添加
        // prefixIcon: Icon(icon, color: Colors.white54),
      ),
    );
  }
}
