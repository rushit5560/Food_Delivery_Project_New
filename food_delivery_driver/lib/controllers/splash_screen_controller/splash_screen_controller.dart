import 'dart:async';
import 'package:food_delivery_driver/common/constant/driver_details.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen.dart';
import 'package:food_delivery_driver/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  getOnBoardingValue() {
    bool isLoggedIn = DriverDetails.isDriverLoggedIn;

    if(isLoggedIn == true) {
      Get.offAll(()=> HomeScreen());
    } else {
    Get.offAll(()=> SignInScreen());
    }

  }

  @override
  void onInit() {
    Timer(Duration(seconds: 2), () => getOnBoardingValue());
    super.onInit();
  }
}