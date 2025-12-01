import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/top_bar.dart';
import 'package:flutter_application_1/widgets/server_illustration_placeholder.dart';
import 'package:flutter_application_1/widgets/login_card.dart';
import 'package:flutter_application_1/widgets/bottom_effect_placeholder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '科技登录界面',
      theme: ThemeData.dark().copyWith(
        // 🎯 1. 覆盖原有的 Primary Color
        primaryColor: Colors.purple,

        // 🎯 2. 覆盖颜色方案 (ColorScheme) 中的特定颜色
        colorScheme:
            ColorScheme.fromSwatch(
              primarySwatch: Colors.purple, // 主色调
              brightness: Brightness.dark, // 必须保持深色模式
            ).copyWith(
              // 覆盖深色主题默认的次要颜色 (secondary/accent color)
              secondary: Colors.redAccent,
              // 覆盖深色主题默认的背景色（例如让背景更黑）
              surface: Colors.black,
            ),

        // 🎯 3. 覆盖组件级别的主题（例如：AppBar 或 Card）
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // 使 AppBar 颜色更深
          elevation: 0, // 移除 AppBar 阴影
        ),

        // 🎯 4. 覆盖输入框的主题
        inputDecorationTheme: const InputDecorationTheme(
          // 保持深色主题的背景，但修改聚焦时的颜色
          errorStyle: TextStyle(color: Colors.green, fontSize: 16),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink, width: 2)),
        ),
      ), // 使用深色主题作为基础
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 整个页面的深蓝/科技感背景
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/login_bj@2x.png'), fit: BoxFit.cover),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0xFF030D29), // 顶部深蓝色
          //     Color(0xFF02173F), // 底部较深的蓝色
          //   ],
          // ),
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
