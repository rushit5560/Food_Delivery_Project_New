import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery_admin/screens/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

import '../../controllers/auth_screen_controller/auth_screen_controller.dart';


class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorDarkPink,
      height: Get.height /3.5,
      padding: EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("Welcome",
              style: TextStyle(color: Colors.white,fontSize: 23, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}

class TabView extends StatelessWidget {
  //const TabView({Key? key}) : super(key: key);
  //late TabController tabController;
  //TabView({required this.tabController});
  AuthScreenController authScreenController = Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.55,
      margin: EdgeInsets.only(left: 20, right: 20, top: 160),
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.colorDarkPink,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: AppColors.colorDarkPink,
            labelPadding: EdgeInsets.only(top: 10.0, bottom: 10),
            unselectedLabelColor: Colors.grey,
            controller:  authScreenController.tabController,
            labelStyle: TextStyle(fontSize: 20),

            tabs: [
              Container(
                child: Tab(
                  text: "Login",

                ),
              ),
              Container(
                child: Tab(
                  text: "Sign up",
                ),
              ),

            ],
          ),
          Container(
            height: Get.height * 0.45,
            child: TabBarView(
              controller: authScreenController.tabController,
              children: [
                SignInScreen(),
                SignUpScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  ContinueButton({Key? key}) : super(key: key);
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Get.offAll(() => IndexScreen());
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}