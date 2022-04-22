import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/common/field_validation.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen.dart';
import 'package:food_delivery_driver/screens/language_screen/language_screen.dart';
import 'package:food_delivery_driver/screens/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import '../forgot_password_screen/forgot_password_screen.dart';

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

class LoginForm extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 160),
      padding: EdgeInsets.only(left: 10, right: 10),
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
      child: Form(
        key: signInScreenController.loginFormKey,
        child: Column(
          children: [
            SizedBox(height: 30,),
            LoginText(),
            SizedBox(height: 30,),
            EmailTextField(hintText: "Enter Email"),
            SizedBox(height: 10,),
            PasswordTextField(hintText: "Password"),
            SizedBox(height: 20),
            ForgotPasswordTextModule(),
            SizedBox(height: 40,),
            NotUserText(),
            // SizedBox(height: 40,),
            // PreferredLang(),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Login",
        style: TextStyle(
            color: AppColors.colorDarkPink, fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NotUserText extends StatelessWidget {
  const NotUserText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not a User?",
          style: TextStyle(color: Colors.black),),
        SizedBox(width: 5,),
        GestureDetector(
          onTap: () {
            Get.to(()=> SignUpScreen());
          },
          child: Text("Click Here",
            style: TextStyle(color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}

class PreferredLang extends StatelessWidget {
  const PreferredLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => LanguageScreen());
      },
      child: Container(
        child: Text(
          "Select Preferred Language",
          style: TextStyle(
              color: AppColors.colorDarkPink, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  // const SignInTextField({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();
  final String hintText;

  EmailTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signInScreenController.emailTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}


class PasswordTextField extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();
  final String hintText;

  PasswordTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: signInScreenController.passwordTextEditingController,
      obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon,*/),
      validator: (value) => FieldValidator().validatePassword(value!),
    );
  }
}

class ForgotPasswordTextModule extends StatelessWidget {
  const ForgotPasswordTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(()=> ForgotPasswordScreen());
          },
          child: Text(
            "Forgot Password?",
            // textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.colorDarkPink,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

InputDecoration _inputDecoration({hintText}) {
  return InputDecoration(
    hintText: "$hintText",
    //prefixIcon: Icon(icon, color: Colors.black),
    //isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    // border: InputBorder.none,
    filled: true,
    fillColor: Colors.grey.shade200,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
  );
}

class ContinueButton extends StatelessWidget {
  ContinueButton({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(signInScreenController.loginFormKey.currentState!.validate()) {
          signInScreenController.userSignInFunction();
        }
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class SocialLogin extends StatefulWidget {


  @override
  _SocialLoginState createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  // FacebookAccessToken? _token;
  // FacebookUserProfile? _profile;
  // String? _imageUrl;
  // String? _email;
  final signInScreenController = Get.find<SignInScreenController>();
  //bool ? isLogin = false;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            signInScreenController.googleAuthentication(context);
          },
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 4,
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

        GestureDetector(
          onTap: (){
            _onPressedLogInButton().then((value) {
              if(signInScreenController.profile!.userId.isNotEmpty){

                Get.off(() => HomeScreen());
              }

            });
          },
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 4,
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
          ),
        )
      ],
    );
  }



  Future<void> _onPressedLogInButton() async {
    await signInScreenController.plugin.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );
    await signInScreenController.updateLoginInfo();
    await signInScreenController.plugin.logOut();
  }

}