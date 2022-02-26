import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/screens/index_screen/index_screen.dart';
import 'package:food_delivery/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery/screens/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

import '../../controllers/auth_screen_controller/auth_screen_conroller.dart';

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
  final TabController tabController;
  TabView({required this.tabController});

  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.55,
      margin: EdgeInsets.only(left: 20, right: 20, top: 160),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.colorDarkPink,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: AppColors.colorDarkPink,
            labelPadding: EdgeInsets.only(top: 10.0, bottom: 10),
            unselectedLabelColor: Colors.grey,
            controller:  tabController,
            labelStyle: TextStyle(fontSize: 20),
            tabs: [
              Container(
                child: Tab(text: "Login"),
              ),
              Container(
                child: Tab(text: "Sign up"),
              ),
            ],
          ),
          Container(
            height: Get.height * 0.45,
            child: TabBarView(
              controller: tabController,
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
  final TabController tabController;
  ContinueButton({required this.tabController});

  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(tabController.index == 0){
          print("0");
          if(validateInputsLogin()){
            Get.offAll(() => IndexScreen());
          }
        }
        else{
          print("1");
          if(validateInputs()){
            Get.offAll(() => IndexScreen());
          }
        }
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

  bool validateInputs() {
    if (authScreenController.signUpFormKey.currentState!.validate()) {
      authScreenController.signUpFormKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  bool validateInputsLogin() {
    if (authScreenController.loginFormKey.currentState!.validate()) {
      authScreenController.loginFormKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }
}
