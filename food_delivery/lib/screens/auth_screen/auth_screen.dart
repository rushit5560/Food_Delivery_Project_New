import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/controllers/auth_screen_controller/auth_screen_conroller.dart';
import 'package:food_delivery/screens/auth_screen/auth_screen_widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  //const AuthView({Key? key}) : super(key: key);
  //final FacebookLogin  plugin = FacebookLogin(debug: true);
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
  // GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
   TextEditingController phoneFieldController = TextEditingController();
  File ? file;

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

    return Scaffold(
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
                    file: file
                ),
              ],
            ),

            const SizedBox(height: 20),

            ContinueButton(
                signUpFormKey: signUpFormKey,
                tabController: _tabController,
                file : file),

            const SizedBox(height: 20),

            authentication()
          ],
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

  /*Widget tabView(){
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
            controller: _tabController,
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
              controller: _tabController,
              children: [
                SignInScreen(),
                SignUpScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }*/

  /*Widget continueButton(){
    return Container(
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
    );
  }*/

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

  /*Future<void> _facebookLogInButton() async {
    await widget.plugin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    await _updateLoginInfo();
    await widget.plugin.logOut();
  }

  Future<void> _updateLoginInfo() async {
    final plugin = widget.plugin;
    final token = await plugin.accessToken;
    FacebookUserProfile? profile;
    String? email;
    String? imageUrl;

    if (token != null) {
      print("token===$token");
      profile = await plugin.getUserProfile();
      print("profile===$profile");
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin.getUserEmail();
      }
      imageUrl = await plugin.getProfileImageUrl(width: 100);
    }

    setState(() {
      _token = token;
      _profile = profile;
      _email = email;
      _imageUrl = imageUrl;
    });
  }*/

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
