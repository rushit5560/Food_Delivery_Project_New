import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/models/all_area_model/all_area_model.dart';
import 'package:food_delivery/models/all_city_model/city_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/sharedpreference_data/sharedpreference_data.dart';
import '../../models/auth_screen_models/registration_user_model.dart';
import '../../models/sign_in_model/sign_in_model.dart';
import '../../screens/index_screen/index_screen.dart';



class AuthScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isSignInEmailOption = true.obs;
  RxList<GetList> cityLists = [GetList(cityName: 'Select City')].obs;
  RxList<GetAreaList> areaList = [GetAreaList(areaName: 'Select Area')].obs;
  GetList cityDropDownValue = GetList();
  GetAreaList? areaDropDownValue;

  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  final GlobalKey<FormState> loginFormKey = GlobalKey();
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
  String selectedGenderValue = "Male";
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  RxBool signInPasswordProtect = false.obs;
  RxBool signInObsecureValue = true.obs;

  RxBool signUpPasswordProtect = false.obs;
  RxBool signUpObsecureValue = true.obs;


  /// Get City List
  getAllCityList() async {
    isLoading(true);
    String url = ApiUrl.AllCityApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('Get All City Response : ${response.body}');

      AllCityModel allCityModel = AllCityModel.fromJson(json.decode(response.body));
      print('allCityModel : $allCityModel');
      isSuccessStatus = allCityModel.status!.obs;
      print('allCityStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        print("Success");
        cityLists.addAll(allCityModel.getList!);
        cityDropDownValue = cityLists[0];
        print('cityLists : ${cityLists.length}');
      } else {
        print('Get All City Else Else');
      }

    } catch(e) {
      print('Get All City False False');
    } finally {
      isLoading(false);
    }
  }

  /// Get Area Using City Id
  getAreaUsingCityId({required String cityId}) async {
    isLoading(true);

    String url = ApiUrl.AllAreaUsingCityIdApi;
    String finalUrl = url + "$cityId";
    print('finalUrl : $finalUrl');

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : ${response.body}');

      CityWiseAreaModel cityWiseAreaModel = CityWiseAreaModel.fromJson(json.decode(response.body));
      isSuccessStatus = cityWiseAreaModel.status!.obs;

      if(isSuccessStatus.value) {
        areaList.addAll(cityWiseAreaModel.getList!);
        areaDropDownValue = areaList[0];
        print('Area List : ${areaList.length}');
      } else {
        print('getAreaUsingCityId false false');
      }
    } catch(e) {
      print('getAreaUsingCityId Error : $e');
    } finally{
      isLoading(false);
    }
  }

  /// Create User
  Future userSignUpFunction() async {
    isLoading(true);
    String url = ApiUrl.RegisterApi;
    print('url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      var stream = http.ByteStream(file!.openRead());
      stream.cast();
      var length = await file!.length();

      request.files.add(await http.MultipartFile.fromPath("Photo", file!.path));

      request.fields['UserName'] = "${userNameTextFieldController.text.trim()}";
      request.fields['FullName'] = "${fullNameTextFieldController.text.trim()}";
      request.fields['Phone'] = "${phoneNoTextFieldController.text.trim()}";
      request.fields['Password'] = "${passwordTextFieldController.text.trim()}";
      request.fields['Address'] = "${addressTextFieldController.text.trim()}";
      request.fields['Gender'] = "$selectedGenderValue";
      request.fields['CityId'] = "${cityDropDownValue.sId}";
      request.fields['AreaId'] = "${areaDropDownValue!.id}";
      request.fields['Email'] = "${emailTextFieldController.text.trim().toLowerCase()}";
      // request.fields['RoleId'] = "6179367e616b99f3c785a68e";

      var multiPart = http.MultipartFile('Photo', stream, length);

      request.files.add(multiPart);

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        RegistrationUserModel response1 = RegistrationUserModel.fromJson(json.decode(value));
        print('response1 ::::::${response1.status}');
        isSuccessStatus = response1.status.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "Activation Link Send To Your Email Account, Kindly Activate And Login", backgroundColor: AppColors.colorDarkPink, textColor: Colors.white);
          clearSignUpFieldsFunction();
        } else {
          Fluttertoast.showToast(msg: "Something went wrong!", backgroundColor: AppColors.colorDarkPink, textColor: Colors.white);
          print('False False');
        }
      });
    } catch (e) {
      print('User SignUp Error : $e');
      Fluttertoast.showToast(msg: "Something went wrong!", backgroundColor: AppColors.colorDarkPink, textColor: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  /// Clear SignUp Fields
  clearSignUpFieldsFunction() {
    userNameTextFieldController.clear();
    fullNameTextFieldController.clear();
    phoneNoTextFieldController.clear();
    passwordTextFieldController.clear();
    addressTextFieldController.clear();
    emailTextFieldController.clear();
    selectedGenderValue = "Male";
  }

  /// Create User Wallet API
  // createUserWallet() async {
  //   isLoading(true);
  //   String url = ApiUrl.CreateUserWalletApi;
  //   print('Url : $url');
  //
  //   try{
  //     Map data = {
  //       "UserId" : "${UserDetails.userId}",
  //       "Amount" : "0",
  //       "Status" : "Active",
  //       "Source" : "GooglePay"
  //     };
  //
  //     http.Response response = await http.post(Uri.parse(url), body: data);
  //     print('response : ${response.body}');
  //
  //     CreateUserWalletModel createUserWalletModel = CreateUserWalletModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = createUserWalletModel.status.obs;
  //     print('isSuccessStatus : $isSuccessStatus');
  //
  //     if(isSuccessStatus.value) {
  //       String userWalletId = createUserWalletModel.wallet.id;
  //       print('userWalletId : $userWalletId');
  //       sharedPreferenceData.setWalletIdInPrefs(walletId: userWalletId);
  //     } else {
  //       print('createUserWallet Else Else');
  //     }
  //
  //   } catch(e) {
  //     print('Create User Waller Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }


  /// User SignIn
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
        // await createUserWallet();
        Get.offAll(() => IndexScreen());
        Get.snackbar('User LoggedIn Successfully.', '');
      } else {
        print('SignIn False False');
        Fluttertoast.showToast(msg: "Wrong Mobile Number / Email Id Or Password", backgroundColor: AppColors.colorDarkPink, textColor: Colors.white);
        //Get.snackbar('Please Enter Valid Mobile Number Or Email', '');
      }

    } catch(e) {
      print('SignIn Error : $e');
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    super.onInit();
    getAllCityList();
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

  loading() {
    isLoading(true);
    isLoading(false);
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