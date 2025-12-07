// auth_middleware.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/init/global.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  // 1. 设置优先级 (Priority)：值越小，越先执行
  @override
  int? priority = 1;

  // 2. 关键方法：redirect(route)
  // 在查找路由之前调用。如果返回非 null 路由，则中止当前路由并跳转到新的路由。
  @override
  RouteSettings? redirect(String? route) {
    // 依赖注入：使用 Get.find() 获取 AuthService 实例
    print('redirecting  $route');
    final isLogin = Global.prefs.getString('token')?.isNotEmpty ?? false;
    // 检查登录状态
    if (!isLogin) {
      // 📝 拦截未登录的用户，跳转到登录页
      // 使用 GetPage 路径名，而非具体的 URL
      return const RouteSettings(name: '/login');
    }
    // 允许继续导航到目标路由
    return null;
  }
}
