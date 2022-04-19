import 'dart:async';
import 'dart:developer';
import 'package:food_delivery/common/constant/user_cart_details.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:food_delivery/screens/auth_screen/auth_screen.dart';
import 'package:food_delivery/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/sharedpreference_data/sharedpreference_data.dart';


class SplashScreenController extends GetxController{
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  goToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserDetails.isUserLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getString(sharedPreferenceData.userIdKey) ?? "";
    UserDetails.userRole = prefs.getString(sharedPreferenceData.userRoleKey) ?? "";
    UserDetails.userToken = prefs.getString(sharedPreferenceData.userTokenKey) ?? "";
    UserDetails.userWallet = prefs.getString(sharedPreferenceData.userWalletIdKey) ?? "";

    UserCartDetails.isCartCreated = prefs.getBool(sharedPreferenceData.isUserCartCreatedKey) ?? false;
    UserCartDetails.userCartId = prefs.getString(sharedPreferenceData.userCartIdKey) ?? "";
    UserCartDetails.userCartRestaurantId = prefs.getString(sharedPreferenceData.userCartRestaurantIdKey) ?? "";

    log("UserCartDetails.isCartCreated :: ${UserCartDetails.isCartCreated}");
    log("UserCartDetails.userCartId :: ${UserCartDetails.userCartId}");
    log("UserCartDetails.userCartRestaurantId :: ${UserCartDetails.userCartRestaurantId}");

    bool isLoggedIn = UserDetails.isUserLoggedIn;
    if(isLoggedIn == true) {
      Get.offAll(()=> IndexScreen());
    } else {
      Get.offAll(()=> AuthScreen());
    }
  }

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () => goToNextScreen());
    super.onInit();
  }
}