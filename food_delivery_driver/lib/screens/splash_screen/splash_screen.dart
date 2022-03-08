import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/common/constant/app_images.dart';
import 'package:get/get.dart';
import '../../controllers/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  //const SplashScreen({Key? key}) : super(key: key);

  SplashScreenController splashViewController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightPink,
      body: Center(
        child: Image.asset(Images.ic_food_logo, height: 200, width: 200,),
      ),
    );
  }
}
