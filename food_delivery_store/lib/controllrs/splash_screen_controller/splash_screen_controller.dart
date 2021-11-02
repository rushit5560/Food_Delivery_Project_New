import 'dart:async';

import 'package:food_delivery_admin/screens/auth_screen/auth_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  getOnBoardingValue() {
    Get.offAll(()=> AuthScreen());
  }

  @override
  void onInit() {
    print('-----------Controller Init Method Called.-----------');
    Timer(Duration(seconds: 7), () => getOnBoardingValue());
    super.onInit();
  }
}