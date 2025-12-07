import 'package:flutter_application_1/app/modules/home/model/test.dart';
import 'package:flutter_application_1/app/services/request.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Rx<Test> test = Test(user: '', test: '').obs();

  final Rx<Test?> test = Rx<Test?>(null);
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    test.value = await ApiRequest.api.getTest();
  }
}
