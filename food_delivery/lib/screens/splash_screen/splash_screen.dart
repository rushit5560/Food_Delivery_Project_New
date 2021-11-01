import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/controllers/splash_screen_controller/splash_screen_controller.dart';
//import 'package:food_delivery/controllers/splash_view_controller/splash_screen_controller.dart';
//import 'package:food_delivery/views/splash_screen/splash_view_widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  // const SplashView({Key? key}) : super(key: key);

  // Connection Of View And Their Controller
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
