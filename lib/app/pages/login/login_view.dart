import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/login/widgets/top_bar.dart';
import 'package:flutter_application_1/app/pages/login/widgets/server_illustration_placeholder.dart';
import 'package:flutter_application_1/app/pages/login/widgets/login_card.dart';
import 'package:flutter_application_1/app/pages/login/widgets/bottom_effect_placeholder.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // 整个页面的深蓝/科技感背景
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login_bj@2x.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            // 1. 顶部导航/语言切换 (模拟)
            Positioned(top: 40, left: 30, right: 30, child: TopBar()),

            // 2. 核心内容区域：左侧插图 + 右侧登录卡片
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 左侧服务器插图 (使用占位符，实际应替换为Image或Lottie动画)
                  // ServerIllustrationPlaceholder(),

                  // 右侧登录卡片
                  // SizedBox(width: 380), // 间距
                  LoginCard(),
                ],
              ),
            ),

            // 3. 底部粒子/光效模拟 (使用简单的圆点和阴影模拟)
            // BottomEffectPlaceholder(),
          ],
        ),
      ),
    );
  }
}
