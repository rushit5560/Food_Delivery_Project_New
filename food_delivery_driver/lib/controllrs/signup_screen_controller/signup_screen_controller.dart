import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_driver/common/constant/api_url.dart';
import 'package:food_delivery_driver/models/all_city_model/city_model.dart';
import 'package:food_delivery_driver/models/sign_up_model/sign_up_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreenController extends GetxController{
  //File file = File.obs;
  File? file;
  File? coverFile;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final GlobalKey<FormState> signupFormKey = GlobalKey();

  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final phoneNumberTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();

  RxList<GetList> cityLists = [GetList(cityName: 'Select City')].obs;
  GetList? cityDropDownValue;


  @override
  void onInit() {
    super.onInit();
    getAllCityList();
    cityDropDownValue = cityLists[0];
  }

  Future deliverySignUpFunction() async {
    isLoading(true);
    String url = ApiUrl.SignUpApi;
    print('url : $url');

    try {
      var stream = http.ByteStream(file!.openRead());
      stream.cast();

      var stream1 = http.ByteStream(coverFile!.openRead());
      stream1.cast();

      var length = await file!.length();

      var coverLength = await coverFile!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", file!.path));
      request.files.add(await http.MultipartFile.fromPath("IdentityImage", coverFile!.path));

      request.fields['FirstName'] = "${firstNameTextEditingController.text.trim()}";
      request.fields['LastName'] = "${lastNameTextEditingController.text.trim()}";
      request.fields['Phone'] = "${phoneNumberTextEditingController.text.trim()}";
      request.fields['Password'] = "${passwordTextEditingController.text.trim()}";
      request.fields['Address'] = "${addressTextEditingController.text.trim()}";
      request.fields['Restaurant'] = "61fa612f77c72b016b4af342";
      request.fields['Email'] = "${emailTextEditingController.text.trim().toLowerCase()}";

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
  }

  loading() {
    isLoading(true);
    isLoading(false);
  }

  clearSignUpFieldsFunction() {
    firstNameTextEditingController.clear();
    lastNameTextEditingController.clear();
    phoneNumberTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    addressTextEditingController.clear();
  }

}