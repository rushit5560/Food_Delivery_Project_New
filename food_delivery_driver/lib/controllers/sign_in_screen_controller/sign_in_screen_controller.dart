import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:food_delivery_driver/common/constant/api_url.dart';
import 'package:food_delivery_driver/common/constant/driver_details.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/sharedpreference_data/sharedpreference_data.dart';
import '../../models/create_driver_wallet_model/create_driver_wallet_model.dart';
import '../../models/sign_in_model/sign_in_model.dart';
class SignInScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  FacebookUserProfile? profile;
  final FacebookLogin  plugin = FacebookLogin(debug: true);
  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  void onInit() {
    print('-----------Controller Init Method Called.-----------');
    //Timer(Duration(seconds: 5), () => getOnBoardingValue());
    super.onInit();
    updateLoginInfo();
  }

  Future googleAuthentication(context) async {
    // try {
    //   googleSignInManager.signOut();
    //   final result = await googleSignInManager.signIn();
    //   if (result != null) {
    //     if (result.email != "") {
    //       Map params = {
    //         "userName": result.displayName ?? "",
    //         "emailId": result.email,
    //         "serviceName": 'GOOGLE',
    //         "uniqueId": "",
    //         "loginPassword": "",
    //       };
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => IndexScreen()),
    //       );
    //       // _socialLoginAPI(params, state.context);
    //       print("userName");
    //     } else {
    //       // commonMessageDialog(state.context,
    //       //     title: "Error",
    //       //     message:
    //       //     "Your Google account is not linked with email. Please signup and login with email and password.");
    //     }
    //   }
    // } catch (error) {
    //   print(error);
    // }
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      print("Email: ${result.user!.email}");
      print("Username: ${result.user!.displayName}");
      print("User Id: ${result.user!.uid}");
      // todo - Set UserId

      //login = prefs.getString('userId');
      //print(login);
      if (result != null) {
        prefs.setString('userId', result.user!.uid);
        prefs.setString('userName', result.user!.displayName!);
        prefs.setString('email', result.user!.email!);
        prefs.setString('photo', result.user!.photoURL!);
        prefs.setBool('isLoggedIn', false);

        Get.off(() => HomeScreen());
      }
    }
    isLoading(false);
  }

  Future<void> updateLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final plugin1 = plugin;
    final token = await plugin1.accessToken;

    String? email;
    String? imageUrl;

    if (token != null) {
      print("token===$token");
      profile = await plugin1.getUserProfile();
      print("profile===$profile");
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin1.getUserEmail();
      }
      imageUrl = await plugin1.getProfileImageUrl(width: 100);
      if(profile != null) {
        if(profile!.userId.isNotEmpty){
          prefs.setString('userId', profile!.userId);
          prefs.setString('userName', profile!.firstName!);
          prefs.setString('email', email!);
          prefs.setString('photo', imageUrl!.toString());

          String ? userId = prefs.getString('userId');
          String ? uName = prefs.getString('userName');
          String ? uEmail = prefs.getString('email');
          String ? uPhotoUrl = prefs.getString('photo');
          print('id: $userId, username : $uName, email : $uEmail, photo : $uPhotoUrl');
        }
      }


      //
    }

    //setState(() {
    // _token = token;
    // profile1 = profile;
    // _email = email;
    // _imageUrl = imageUrl;
    //});
  }

  userSignInFunction() async {
    isLoading(true);
    String url = ApiUrl.SignInApi;
    print('Url : $url');

    try{
      Map data = {
        "Email" : "${emailTextEditingController.text.trim().toLowerCase()}",
        "Password" : "${passwordTextEditingController.text.trim()}"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      print('response : ${response.body}');

      UserSignInModel userSignInModel = UserSignInModel.fromJson(json.decode(response.body));
      isSuccessStatus = userSignInModel.status.obs;

      if(isSuccessStatus.value) {
        String driverToken = userSignInModel.token;
        print('driverToken : $driverToken');
        await sharedPreferenceData.setDriverLoginDetailsInPrefs(driverToken: driverToken);
        // await createDriverWalletFunction();
        Get.offAll(() => HomeScreen());
        Get.snackbar('Driver LoggedIn Successfully.', '');
      } else {
        print('userSignInFunction Else Else');
      }

    } catch(e) {
      print('userSignInFunction Error : $e');
    } finally {
      isLoading(false);
    }
  }



}