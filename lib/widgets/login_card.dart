import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    setState(() => _loading = true);
    try {
      final result = await AuthService.instance.login(username: username, password: password);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('登录成功: ${result['message'] ?? 'ok'}')));
    } on DioException catch (e) {
      String msg = '请求失败';
      if (e.response != null && e.response?.data != null) {
        msg = e.response!.data.toString();
      } else if (e.message != null) {
        msg = e.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('登录失败: $msg')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('登录异常: $e')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 卡片尺寸与风格
    const double cardWidth = 360;
    const double cardPadding = 40;

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(left: 200),
      padding: const EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF152A55).withValues(alpha: 0.8), // 略微透明的深蓝色背景
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 30, spreadRadius: 5)],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 标题：登录
            const Text(
              '登录',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 30),

            // 输入框：用户名
            _buildLoginInputField(controller: _usernameController, hintText: '请输入用户名', icon: Icons.person_outline),
            const SizedBox(height: 20),

            // 输入框：密码
            _buildLoginInputField(
              controller: _passwordController,
              hintText: '请输入密码',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 40),

            // 按钮：登录
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _loading ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0096FF), // 亮蓝色
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text('登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 辅助函数：构建输入框
  Widget _buildLoginInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.3), // 输入框内部的深色背景
        hoverColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        prefixIcon: Icon(icon, color: Colors.white54),
      ),
      // 字段验证逻辑
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '请输入${isPassword ? '密码' : '用户名'}';
        }
        if (isPassword && value.length < 6) {
          return '密码长度不能少于6位';
        }
        return null;
      },
    );
  }
}
