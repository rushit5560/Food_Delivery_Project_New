import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../common/sharedpreference_data/sharedpreference_data.dart';
import '../../models/auth_screen_models/all_city_model.dart';
import '../../models/sign_in_model/sign_in_model.dart';
import '../../screens/index_screen/index_screen.dart';


class AuthScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isSignInEmailOption = true.obs;
  // List<> allCityList = [];

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  final userNameTextFieldController = TextEditingController();
  final fullNameTextFieldController = TextEditingController();
  final phoneNoTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final signInEmailTextFieldController = TextEditingController();
  final signInPhoneNoTextFieldController = TextEditingController();
  final signInPasswordTextFieldController = TextEditingController();

  File? file;
  String? selectedCityValue;
  String? selectedAreaValue;
  String selectedGenderValue = "Male";
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  getAllCityList() async {
    isLoading(true);
    String url = ApiUrl.AllCityApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('Get All City Response : $response');

      AllCityModel allCityModel = AllCityModel.fromJson(json.decode(response.body));
      // isSuccessStatus = allCityModel.s

    } catch(e) {
      print('Get All City False False');
    } finally {
      isLoading(false);
    }
  }

  userSignInFunction({required String email, required String phoneNo, required String password}) async {
    isLoading(true);

    String url = ApiUrl.SignInApi;
    print('Url : $url');

    try{
      Map<String, dynamic> data = signInSelectedOption(
        email: email,
        phoneNo: phoneNo,
        password: password,
      );

      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      SignInModel signInModel = SignInModel.fromJson(json.decode(response.body));
      isSuccessStatus = signInModel.status.obs;

      if(isSuccessStatus.value) {
        String userToken = signInModel.token;
        print('userToken : $userToken');
        await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
        Get.offAll(() => IndexScreen());
        Get.snackbar('User LoggedIn Successfully.', '');
      } else {
        print('SignIn False False');
      }

    } catch(e) {
      print('SignIn Error : $e');
    } finally {
      isLoading(false);
    }
  }


  // RxBool isLoading = false.obs;
  // FacebookUserProfile? profile;
  // final FacebookLogin  plugin = FacebookLogin(debug: true);

  @override
  void onInit() {
    super.onInit();
    // updateLoginInfo();
  }

  Map<String, dynamic> signInSelectedOption({String? email,String? phoneNo, required String password}) {
    Map<String, dynamic> signInWithEmail = {
      "Email" : email,
      "Password" : password,
    };
    Map<String, dynamic> signInWithPhone = {
      "Phone" : phoneNo,
      "Password" : password,
    };
    return isSignInEmailOption.value ? signInWithEmail : signInWithPhone;
  }

  /*Future googleAuthentication(context) async {
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
  //   isLoading(true);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   googleSignIn.signOut();
  //   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //     await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //
  //     // Getting users credential
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //     User? user = result.user;
  //     print("Email: ${result.user!.email}");
  //     print("Username: ${result.user!.displayName}");
  //     print("User Id: ${result.user!.uid}");
  //     // todo - Set UserId
  //
  //     //login = prefs.getString('userId');
  //     //print(login);
  //     if (result != null) {
  //       prefs.setString('userId', result.user!.uid);
  //       prefs.setString('userName', result.user!.displayName!);
  //       prefs.setString('email', result.user!.email!);
  //       prefs.setString('photo', result.user!.photoURL!);
  //       prefs.setBool('isLoggedIn', false);
  //
  //       Get.off(() => IndexScreen());
  //     }
  //   }
  //   isLoading(false);
  // }
  //
  //
  // Future<void> updateLoginInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final plugin1 = plugin;
  //   final token = await plugin1.accessToken;
  //
  //   String? email;
  //   String? imageUrl;
  //
  //   if (token != null) {
  //     print("token===$token");
  //     profile = await plugin1.getUserProfile();
  //     print("profile===$profile");
  //     if (token.permissions.contains(FacebookPermission.email.name)) {
  //       email = await plugin1.getUserEmail();
  //     }
  //     imageUrl = await plugin1.getProfileImageUrl(width: 100);
  //     if(profile != null) {
  //       if(profile!.userId.isNotEmpty){
  //         prefs.setString('userId', profile!.userId);
  //         prefs.setString('userName', profile!.firstName!);
  //         prefs.setString('email', email!);
  //         prefs.setString('photo', imageUrl!.toString());
  //
  //         String ? userId = prefs.getString('userId');
  //         String ? uName = prefs.getString('userName');
  //         String ? uEmail = prefs.getString('email');
  //         String ? uPhotoUrl = prefs.getString('photo');
  //         print('id: $userId, username : $uName, email : $uEmail, photo : $uPhotoUrl');
  //       }
  //     }
  //
  //
  //     //
  //   }
  //
  //   //setState(() {
  //   // _token = token;
  //   // profile1 = profile;
  //   // _email = email;
  //   // _imageUrl = imageUrl;
  //   //});
  // }

}*/
}