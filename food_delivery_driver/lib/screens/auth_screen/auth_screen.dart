import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/app_colors.dart';
import 'package:food_delivery_driver/screens/auth_screen/auth_screen_widgets.dart';
//import 'package:food_delivery_admin/common/app_colors.dart';
//import 'package:food_delivery_admin/screens/auth_screen/auth_screen_widgets.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightPink,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                WelcomeText(),
                TabView(),
              ],
            ),

            const SizedBox(height: 20),

            ContinueButton(),

            const SizedBox(height: 20),

            authentication()
          ],
        ),
      ),
    );
  }

  Widget authentication(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
           // googleAuthentication();
          },
          child: Container(
            height: 40,
            width: Get.width / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.colorDarkPink),
            child: Center(
              child: Text(
                "G",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),

        Container(
          height: 40,
          width: Get.width / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.colorDarkPink),
          child: Center(
            child: Text(
              "F",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        )
      ],
    );
  }
}
