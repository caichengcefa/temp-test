import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showToast(String message) {
  Global.message.currentState?.showSnackBar(SnackBar(content: Text(message)));
  // Get.snackbar('', message, snackPosition: SnackPosition.BOTTOM);
}

class Global {
  static final GlobalKey<ScaffoldMessengerState> message =
      GlobalKey<ScaffoldMessengerState>();

  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
