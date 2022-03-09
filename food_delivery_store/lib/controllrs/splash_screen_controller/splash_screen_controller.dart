import 'dart:async';

import 'package:food_delivery_admin/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:food_delivery_admin/common/user_details.dart';
import 'package:food_delivery_admin/screens/auth_screen/auth_screen.dart';
import 'package:food_delivery_admin/screens/new_order_screen/new_order_screen.dart';
import 'package:food_delivery_admin/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  // getOnBoardingValue() {
  //   Get.offAll(()=> SignInScreen());
  // }
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  goToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.storeId = prefs.getString(sharedPreferenceData.userIdKey) ?? '';
    print('storeId: ${UserDetails.storeId}');
    if(UserDetails.storeId.isNotEmpty) {
      Get.offAll(()=> NewOrderScreen());
    } else {
      Get.offAll(()=> SignInScreen());
    }
  }

  @override
  void onInit() {
    print('-----------Controller Init Method Called.-----------');
    Timer(Duration(seconds: 7), () => goToNextScreen());
    super.onInit();
  }
}