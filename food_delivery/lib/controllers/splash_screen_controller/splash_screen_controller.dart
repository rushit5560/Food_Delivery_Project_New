import 'dart:async';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:food_delivery/screens/auth_screen/auth_screen.dart';
import 'package:food_delivery/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';


class SplashScreenController extends GetxController{

  goToNextScreen() {
    bool isLoggedIn = UserDetails.isUserLoggedIn;
    if(isLoggedIn == true) {
      Get.offAll(()=> IndexScreen());
    } else {
      Get.offAll(()=> AuthScreen());
    }
  }

  @override
  void onInit() {
    Timer(Duration(seconds: 2), () => goToNextScreen());
    super.onInit();
  }
}