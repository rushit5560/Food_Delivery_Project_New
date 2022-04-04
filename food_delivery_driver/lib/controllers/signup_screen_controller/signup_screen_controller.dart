import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_driver/common/constant/api_url.dart';
import 'package:food_delivery_driver/models/all_city_model/city_model.dart';
import 'package:food_delivery_driver/models/sign_up_model/sign_up_model.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../common/constant/driver_details.dart';
import '../../common/sharedpreference_data/sharedpreference_data.dart';
import '../../models/all_restaurants_model/all_restaurants_model.dart';
import '../../models/all_zone_model/get_all_zone_model.dart';
import '../../models/create_driver_wallet_model/create_driver_wallet_model.dart';

class SignUpScreenController extends GetxController {
  File? file;
  File? coverFile;
  File? identityFile;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  final GlobalKey<FormState> signupFormKey = GlobalKey();
  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final phoneNumberTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final identityTypeTextEditingController = TextEditingController();
  final identityNumberTextEditingController = TextEditingController();

  RxList<GetList> cityLists = [GetList(cityName: 'Select City')].obs;
  RxList<AllStore> getAllRestaurantsList = RxList();
  AllStore restaurantsDropDownValue = AllStore();
  GetList? cityDropDownValue;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  RxList<AllZone> zoneLists = [AllZone(id: "0", name: "Select Zone")].obs;
  AllZone zoneDropDownValue = AllZone();


  @override
  void onInit() {
    super.onInit();
    getAllRestaurantsListFunction();
    cityDropDownValue = cityLists[0];
  }

  /// DeliveryBoy Register Function
  Future deliverySignUpFunction() async {
    isLoading(true);
    String url = ApiUrl.SignUpApi;
    print('url : $url');

    try {
      var stream = http.ByteStream(file!.openRead());
      stream.cast();

      var stream1 = http.ByteStream(identityFile!.openRead());
      stream1.cast();

      var length = await file!.length();

      var coverLength = await identityFile!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", file!.path));
      request.files.add(await http.MultipartFile.fromPath("IdentityImage", identityFile!.path));

      request.fields['FirstName'] = "${firstNameTextEditingController.text.trim()}";
      request.fields['LastName'] = "${lastNameTextEditingController.text.trim()}";
      request.fields['Phone'] = "${phoneNumberTextEditingController.text.trim()}";
      request.fields['Password'] = "${passwordTextEditingController.text.trim()}";
      request.fields['Address'] = "${addressTextEditingController.text.trim()}";
      request.fields['Restaurant'] = "${restaurantsDropDownValue.id}";
      request.fields['Email'] = "${emailTextEditingController.text.trim().toLowerCase()}";
      request.fields['Zone'] = "${zoneDropDownValue.id}";
      request.fields['IdentityType'] = "${identityTypeTextEditingController.text.trim()}";
      request.fields['IdentityNumber'] = "${identityNumberTextEditingController.text.trim()}";

      print('request.fields: ${request.fields}');
      print('request.files: ${request.files}');

      var multiPart = http.MultipartFile(
        'Image',
        stream,
        length,
      );
      var multiPart1 = http.MultipartFile(
        'IdentityImage',
        stream1,
        coverLength,
      );

      request.files.add(multiPart);
      request.files.add(multiPart1);

      var response = await request.send();
      print('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        SignUpDriverModel response1 = SignUpDriverModel.fromJson(json.decode(value));
        print('response1 ::::::${response1.status}');
        isSuccessStatus = response1.status.obs;
        print('status : $isSuccessStatus');

        if(isSuccessStatus.value){
          Fluttertoast.showToast(msg: "${response1.message}");

          Get.offAll(()=> HomeScreen(), transition: Transition.zoom);
          clearSignUpFieldsFunction();

        } else {
           Fluttertoast.showToast(msg: "Email is Already Register");
          print('False False');
        }
      });

    } catch (e) {
      print('User SignUp Error : $e');
    } finally {
      isLoading(false);
    }
  }

  /// Get All City List Function
  /*getAllCityList() async {
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
        // cityLists.clear();
        //cityLists.add(GetList(cityName: 'Select City', stateId: StateId(sId: '0'), ));
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
  }*/

  /// Get All Zone List Function
  getAllZoneListFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllZoneApi;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("response : ${response.body}");

      GetAllZoneModel getAllZoneModel = GetAllZoneModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllZoneModel.status.obs;

      if(isSuccessStatus.value) {
        zoneLists.addAll(getAllZoneModel.allZone);
        zoneDropDownValue = zoneLists[0];
        log("Zone List : $zoneLists");
      } else {
        log("getAllZoneListFunction Else Else");
      }

    } catch(e) {
      log("getAllZoneListFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  loading() {
    isLoading(true);
    isLoading(false);
  }

  /// Clear All Text Fields
  clearSignUpFieldsFunction() {
    firstNameTextEditingController.clear();
    lastNameTextEditingController.clear();
    phoneNumberTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    addressTextEditingController.clear();
  }

  /// Get All Restaurants List
  getAllRestaurantsListFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllRestaurantsApi;
    log("URL :$url");

    try{

      http.Response response = await http.get(Uri.parse(url));
      log("response : ${response.body}");

      GetAllRestaurantsModel getAllRestaurantsModel = GetAllRestaurantsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllRestaurantsModel.status.obs;

      if(isSuccessStatus.value) {
        getAllRestaurantsList.addAll(getAllRestaurantsModel.allStore);
        restaurantsDropDownValue = getAllRestaurantsList[0];
      } else {
        log("getAllRestaurantsListFunction Else Else");
      }

    } catch(e) {
      log("getAllRestaurantsListFunction Error : $e");
    } finally {
      // isLoading(false);
      getAllZoneListFunction();
    }
  }

  /// Create Driver Wallet Using DriverId
  createDriverWalletFunction() async {
    isLoading(true);

    String url = ApiUrl.CreateDriverWalletApi;
    print('Yrl : $url');

    try{
      Map data = {
        "DeliveryPersonId" : "${DriverDetails.driverId}",
        "Amount" : "0",
        "RechargeDate" : "${DateTime.now()}",
        "Status" : "active",
        "Source" : "GooglePay"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      print('response : ${response.body}');

      CreateDriverWalletModel createDriverWalletModel = CreateDriverWalletModel.fromJson(json.decode(response.body));
      // isSuccessStatus = createDriverWalletModel.status.obs;
      isSuccessStatus.value = true;
      if(isSuccessStatus.value) {
        String walletId = createDriverWalletModel.wallet.id;
        sharedPreferenceData.setWalletIdInPrefs(walletId: walletId);
      } else {
        print('createDriverWalletFunction Else Else');
      }

    } catch(e) {
      print('createDriverWalletFunction Error : $e');
    } finally {
      isLoading(false);
    }

  }

}