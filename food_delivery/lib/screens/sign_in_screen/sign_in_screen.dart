import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/screens/sign_in_screen/sign_in_screen_widgets.dart';
import 'package:get/get.dart';

import '../../controllers/auth_screen_controller/auth_screen_conroller.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final authScreenController = Get.find<AuthScreenController>();
  // bool isEmailField = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: authScreenController.loginFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Obx(
                    ()=> Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //SignInText(),
                        SizedBox(height: 10),
                        authScreenController.isSignInEmailOption.value
                            ? SignInTextField(hintText: "Enter Email")
                            : MobileNumberTextField(hintText: "Enter Mobile Number"),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            authScreenController.isSignInEmailOption.value =
                            !authScreenController.isSignInEmailOption.value;
                            print('isSignInEmailOption : ${authScreenController.isSignInEmailOption.value}');
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              authScreenController.isSignInEmailOption.value
                                  ? "Use Phone Number"
                                  : "Use Email Id",
                              style: TextStyle(
                                  color: AppColors.colorDarkPink, fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        PasswordTextField(hintText: "Password"),
                        SizedBox(height: 15),
                        ForgotPasswordTextModule(),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
