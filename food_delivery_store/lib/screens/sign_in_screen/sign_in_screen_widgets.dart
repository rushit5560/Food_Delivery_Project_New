import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/common/field_validation.dart';
import 'package:food_delivery_admin/controllrs/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:food_delivery_admin/screens/language_screen/language_screen.dart';
import 'package:food_delivery_admin/screens/new_order_screen/new_order_screen.dart';
import 'package:food_delivery_admin/screens/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

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
  //const TabView({Key? key}) : super(key: key);
  //late TabController tabController;
  //TabView({required this.tabController});
  //AuthScreenController authScreenController = Get.put(AuthScreenController());
  final signInScreenController = Get.find<SignInScreenController>();
  //IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Get.height * 0.55,
      margin: EdgeInsets.only(left: 20, right: 20, top: 160),
      padding: EdgeInsets.only(left: 10, right: 10),
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
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
            EmailTextField( hintText: "Email",),
            SizedBox(height: 10,),
            PasswordTextField( hintText: "Password",),
            SizedBox(height: 40,),
            NotUserText(),
            // SizedBox(height: 20,),
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

class PreferredLang extends StatelessWidget {
  const PreferredLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> LanguageScreen());
      },
      child: Container(
        child: Text(
          "Select Preferred Language",
          style: TextStyle(
              color: AppColors.colorDarkPink, fontSize: 15),
        ),
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
            Get.off(()=> SignUpScreen());
          },
          child: Text("Click Here",
            style: TextStyle(color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}


class EmailTextField extends StatelessWidget {
  // const SignInTextField({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();
  //IconData icon;

  String hintText;

  EmailTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    print('hintText : $hintText && icon && signInTextEditingController ${signInScreenController.signInTextEditingController}');
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signInScreenController.signInTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}


class PasswordTextField extends StatelessWidget {
  // const PasswordTextField({Key? key}) : super(key: key);
  //IconData icon;
  String hintText;
  final signInScreenController = Get.find<SignInScreenController>();

  PasswordTextField({
    required this.hintText,
  });

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



InputDecoration _inputDecoration({hintText, icon}) {
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
      onTap: () async {
        //
      if(signInScreenController.loginFormKey.currentState!.validate()) {
        await signInScreenController.userSignInFunction(
          email: signInScreenController.signInTextEditingController.text.trim()
              .toLowerCase(),
          password: signInScreenController.passwordTextEditingController.text
              .trim(),
        );
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

class socialLogin extends StatefulWidget {


  @override
  _socialLoginState createState() => _socialLoginState();
}

class _socialLoginState extends State<socialLogin> {
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

                Get.off(() => NewOrderScreen());
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