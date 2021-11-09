import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/app_colors.dart';
import 'package:food_delivery_driver/screens/sign_in_screen/sign_in_screen_widgets.dart';
//import 'package:food_delivery_admin/screens/sign_in_screen/sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  //const SignInScreen({Key? key}) : super(key: key);

  var _SignInformKey = GlobalKey<FormState>();

  TextEditingController signInTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightPink,
      resizeToAvoidBottomInset: false,
      // body: Center(
      //   child: SingleChildScrollView(
      //     child: Form(
      //       key: _SignInformKey,
      //       child: Container(
      //         margin: EdgeInsets.symmetric(horizontal: 20),
      //         child: SingleChildScrollView(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               //SignInText(),
      //               SizedBox(height: 10),
      //               SignInTextField(
      //                 signInTextEditingController: signInTextEditingController,
      //                 //icon: Icons.email,
      //                 hintText: "Enter Email",
      //               ),
      //               SizedBox(height: 15),
      //               PasswordTextField(
      //                 passwordTextEditingController: passwordTextEditingController,
      //                 //icon: Icons.password,
      //                 hintText: "Password",),
      //               /*SizedBox(height: 30),
      //               SignInButton(),
      //               SizedBox(height: 20),
      //               SignUpText(),*/
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                WelcomeText(),
                LoginForm(
                  signInTextEditingController: signInTextEditingController,
                  passwordTextEditingController: passwordTextEditingController,),
              ],
            ),
            SizedBox(height: 50,),
            ContinueButton()
          ],
        ),
      ),
    );
  }
}
