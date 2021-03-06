import 'dart:async';
import 'package:food_delivery_driver/common/constant/driver_details.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/sharedpreference_data/sharedpreference_data.dart';
import '../../screens/sign_in_screen/sign_in_screen.dart';


class SplashScreenController extends GetxController {
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  getOnBoardingValue() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    DriverDetails.isDriverLoggedIn = prefs.getBool(sharedPreferenceData.isDriverLoggedInKey) ?? false;
    DriverDetails.driverId = prefs.getString(sharedPreferenceData.driverIdKey) ?? "";
    DriverDetails.driverRole = prefs.getString(sharedPreferenceData.driverRoleKey) ?? "";
    DriverDetails.driverToken = prefs.getString(sharedPreferenceData.driverTokenKey) ?? "";
    DriverDetails.driverWalletId = prefs.getString(sharedPreferenceData.driverWalletIdKey) ?? "";

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