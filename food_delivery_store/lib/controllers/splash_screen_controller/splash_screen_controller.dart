import 'dart:async';
import 'dart:developer';
import 'package:food_delivery_admin/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:food_delivery_admin/common/store_details.dart';
import 'package:food_delivery_admin/screens/new_order_screen/new_order_screen.dart';
import 'package:food_delivery_admin/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreenController extends GetxController {
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  goToNextScreen() async {
    /// Store Details Store in Local Variables
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StoreDetails.isStoreLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    StoreDetails.storeId = prefs.getString(sharedPreferenceData.userIdKey) ?? '';
    StoreDetails.storeToken = prefs.getString(sharedPreferenceData.userTokenKey) ?? '';
    StoreDetails.storeRole = prefs.getString(sharedPreferenceData.userRoleKey) ?? '';
    log('storeId: ${StoreDetails.storeId}');

    bool isLoggedIn = StoreDetails.isStoreLoggedIn;

    if(isLoggedIn == true) {
      Get.offAll(()=> NewOrderScreen());
      // Fluttertoast.showToast(msg: 'isLoggedIn : $isLoggedIn');
    } else {
      Get.offAll(()=> SignInScreen());
      // Fluttertoast.showToast(msg: 'isLoggedIn : $isLoggedIn');
    }
  }

  @override
  void onInit() {

    Timer(Duration(seconds: 3), () => goToNextScreen());
    super.onInit();
  }
}