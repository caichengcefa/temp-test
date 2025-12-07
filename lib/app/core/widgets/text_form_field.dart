import 'package:flutter/material.dart';

class MTextFormField extends StatelessWidget {
  final bool isPassword;
  final IconData? icon;
  final String hintText;

  final void Function(String)? onChanged; // 实时更新值的回调
  final String? errorText; // 接收 Controller 传来的错误信息

  const MTextFormField({
    super.key,
    this.isPassword = false,
    this.icon,
    this.hintText = '',
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white54),
        labelText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        hoverColor: Colors.transparent,
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.3), // 输入框内部的深色背景
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        // 关键：显示 Controller 传来的错误信息
        errorText: errorText,
      ),
      // obscureText: isPassword,
      // // 字段验证逻辑
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return '请输入${isPassword ? '密码' : '用户名'}';
      //   }
      //   if (isPassword && value.length < 6) {
      //     return '密码长度不能少于6位';
      //   }
      //   return null;
      // },
    );
  }
}
