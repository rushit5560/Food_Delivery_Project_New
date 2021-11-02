import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/screens/sign_in_screen/sign_in_view_widgets.dart';
//import 'package:food_delivery/views/sign_in_screen/sign_in_view_widgets.dart';
//import 'package:food_delivery/widgets/sign_in_view_widgets/sign_in_view_widgets.dart';

class SignInScreen extends StatefulWidget {
  // const SignInView({Key? key}) : super(key: key);

  GlobalKey<FormState> loginFormKey;
  TextEditingController signInEmailFieldController;
  TextEditingController signInPasswordFieldController;
  TextEditingController signInPhoneFieldController;

  SignInScreen({
    required this.loginFormKey,
    required this.signInEmailFieldController,
    required this.signInPasswordFieldController,
    required this.signInPhoneFieldController});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _SignInformKey = GlobalKey<FormState>();
  //TextEditingController signInTextEditingController = TextEditingController();
  //TextEditingController mobileNumberTextEditingController = TextEditingController();
  //TextEditingController passwordTextEditingController = TextEditingController();
  bool isEmailField = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: widget.loginFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //SignInText(),
                      SizedBox(height: 10),
                      isEmailField
                      ? SignInTextField(
                        signInEmailFieldController: widget.signInEmailFieldController,
                          //icon: Icons.email,
                        hintText: "Enter Email",
                      )
                      : MobileNumberTextField(
                        signInPhoneFieldController: widget.signInPhoneFieldController,
                        //icon: Icons.email,
                        hintText: "Enter Mobile Number",
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isEmailField = !isEmailField;
                          });
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text( isEmailField ? "Use Phone Number" : "Use Email Id",
                            style: TextStyle(color: AppColors.colorDarkPink, fontSize: 17),),
                        ),
                      ),
                      SizedBox(height: 15),
                      PasswordTextField(
                        signInPasswordFieldController: widget.signInPasswordFieldController,
                          //icon: Icons.password,
                          hintText: "Password",),
                      SizedBox(height: 15),
                      /*SizedBox(height: 30),
                      SignInButton(),
                      SizedBox(height: 20),
                      SignUpText(),*/

                    ],
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
