import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/init/global.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final message = Global.message;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '科技登录界面123',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: message,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          brightness: Brightness.dark,
        ).copyWith(secondary: Colors.redAccent, surface: Colors.black),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          errorStyle: TextStyle(color: Colors.green, fontSize: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 2),
          ),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
