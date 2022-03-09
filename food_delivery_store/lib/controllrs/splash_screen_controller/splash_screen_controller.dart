import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    UserDetails.isUserLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.storeId = prefs.getString(sharedPreferenceData.userIdKey) ?? '';
    UserDetails.userToken = prefs.getString(sharedPreferenceData.userTokenKey) ?? '';
    UserDetails.storeRole = prefs.getString(sharedPreferenceData.userRoleKey) ?? '';
    print('storeId: ${UserDetails.storeId}');

    bool isLoggedIn = UserDetails.isUserLoggedIn;
    if(isLoggedIn == true) {
      Get.offAll(()=> NewOrderScreen());
      Fluttertoast.showToast(msg: 'isLoggedIn : $isLoggedIn');
    } else {
      Get.offAll(()=> SignInScreen());
      Fluttertoast.showToast(msg: 'isLoggedIn : $isLoggedIn');
    }
  }

  @override
  void onInit() {
    print('-----------Controller Init Method Called.-----------');
    Timer(Duration(seconds: 7), () => goToNextScreen());
    super.onInit();
  }
}