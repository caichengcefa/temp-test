import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/login/widgets/login_card.dart';
import 'package:flutter_application_1/app/modules/login/widgets/top_bar.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // 整个页面的深蓝/科技感背景
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // ✅ 使用 flutter_gen_runner 生成的资源（推荐）
            image: Assets.images.loginBj2x.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // 1. 顶部导航/语言切换
            const Positioned(top: 40, left: 30, right: 30, child: TopBar()),

            // 2. 核心内容区域：左侧插图 + 右侧登录卡片
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 左侧服务器插图示例（使用生成的图片资源）
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 40),
                  //   // child: Assets.images.shebImg2x.image(
                  //   //   width: 280,
                  //   //   height: 380,
                  //   //   fit: BoxFit.contain,
                  //   // ),
                  // ),

                  // 右侧登录卡片
                  const LoginCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
