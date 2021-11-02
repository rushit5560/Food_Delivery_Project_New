import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/controllers/auth_screen_controller/auth_screen_conroller.dart';
import 'package:food_delivery/screens/auth_screen/auth_screen_widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  AuthScreenController authViewController = Get.put(AuthScreenController());
  late TabController _tabController;

  GoogleSignIn googleSignInManager = GoogleSignIn(
    scopes: ['email'],
  );
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController signInEmailFieldController = TextEditingController();
  TextEditingController signInPasswordFieldController = TextEditingController();
  TextEditingController signInPhoneFieldController = TextEditingController();
  File? file;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: AppColors.colorLightPink,
        body: SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                children: [
                  WelcomeText(),
                  TabView(
                      tabController: _tabController,
                      signUpFormKey: signUpFormKey,
                      fullNameFieldController: fullNameFieldController,
                      emailFieldController: emailFieldController,
                      phoneFieldController: phoneFieldController,
                      file: file,
                      loginFormKey : loginFormKey,
                      signInEmailFieldController: signInEmailFieldController,
                      signInPasswordFieldController: signInPasswordFieldController,
                      signInPhoneFieldController: signInPhoneFieldController
                  ),
                ],
              ),

              const SizedBox(height: 20),

              ContinueButton(
                  signUpFormKey: signUpFormKey,
                  tabController: _tabController,
                  file : file,
                  loginFormKey: loginFormKey
              ),

              const SizedBox(height: 20),

              authentication()
            ],
          ),
        ),
      ),
    );

  }

  Widget backGround() {
    return Column(
      children: [
        Expanded(
          flex: 35,
          child: Container(
            color: AppColors.colorDarkPink,
          ),
        ),
        Expanded(
          flex: 65,
          child: Container(
            color: AppColors.colorLightPink,
          ),
        ),

      ],
    );
  }

  Widget authentication(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            googleAuthentication();
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

        Container(
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
        )
      ],
    );
  }

  googleAuthentication() async {
    try {
      googleSignInManager.signOut();
      final result = await googleSignInManager.signIn();
      if (result != null) {
        if (result.email != "") {
          Map params = {
            "userName": result.displayName ?? "",
            "emailId": result.email,
            "serviceName": 'GOOGLE',
            "uniqueId": "",
            "loginPassword": "",
          };
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          // _socialLoginAPI(params, state.context);
          print("userName");
        } else {
          // commonMessageDialog(state.context,
          //     title: "Error",
          //     message:
          //     "Your Google account is not linked with email. Please signup and login with email and password.");
        }
      }
    } catch (error) {
      print(error);
    }
  }


}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home page"),
      ),
    );
  }
}