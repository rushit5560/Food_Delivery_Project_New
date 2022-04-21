import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/screens/sign_in_screen/sign_in_screen_widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';


class SignInScreen extends StatelessWidget {
  final GoogleSignIn googleSignInManager = GoogleSignIn(scopes: ['email']);
  final signInScreenController = Get.put(SignInScreenController());

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
      body: Obx(
        () => signInScreenController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        WelcomeText(),
                        LoginForm(),
                      ],
                    ),
                    const SizedBox(height: 50),
                    ContinueButton(),
                    const SizedBox(height: 20),
                    SocialLogin(),
                  ],
                ),
              ),
      ),
    );
  }

/*Widget authentication(context) {
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
          Get.off(() => HomeScreen());
          */ /*Map params = {
            "userName": result.displayName ?? "",
            "emailId": result.email,
            "serviceName": 'GOOGLE',
            "uniqueId": "",
            "loginPassword": "",
          };*/ /*
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => IndexScreen()),
          // );
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
  }*/

}
