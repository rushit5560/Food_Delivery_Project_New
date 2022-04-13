import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/models/all_city_model/city_model.dart';
import 'package:food_delivery_admin/models/sign_up_model/sign_up_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreenController extends GetxController{
  //File file = File.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  File? file;
  File? coverFile;

  final GlobalKey<FormState> signupFormKey = GlobalKey();

  final nameTextEditingController = TextEditingController();
  final storeNameTextEditingController = TextEditingController();
  final storeNumberTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final adminShareTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final deliveryRangeTextEditingController = TextEditingController();
  final storeAddressTextEditingController = TextEditingController();

  RxList<GetList> cityLists = [GetList(cityName: 'Select City')].obs;
  GetList? cityDropDownValue;

  @override
  void onInit() {
    super.onInit();
    getAllCityList();
  }

  Future adminSignUpFunction() async {
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
      request.files.add(await http.MultipartFile.fromPath("CoverImage", coverFile!.path));

      request.fields['StoreName'] = "${storeNameTextEditingController.text.trim()}";
      request.fields['FirstName'] = "${nameTextEditingController.text.trim()}";
      request.fields['LastName'] = "${nameTextEditingController.text.trim()}";
      request.fields['Phone'] = "${storeNumberTextEditingController.text.trim()}";
      request.fields['Password'] = "${passwordTextEditingController.text.trim()}";
      request.fields['Address'] = "${storeAddressTextEditingController.text.trim()}";
      request.fields['CityId'] = "617138be0c5a53d58e528817";
      request.fields['Email'] = "${emailTextEditingController.text.trim().toLowerCase()}";
      request.fields['DeliveryRange'] = "${deliveryRangeTextEditingController.text.trim()}";

      print('request.fields: ${request.fields}');
      print('request.files: ${request.files}');

      var multiPart = http.MultipartFile(
        'Image',
        stream,
        length,
      );
      var multiPart1 = http.MultipartFile(
        'CoverImage',
        stream1,
        coverLength,
      );

      request.files.add(multiPart);
      request.files.add(multiPart1);

      var response = await request.send();
      print('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        SignUpAdminModel response1 = SignUpAdminModel.fromJson(json.decode(value));
        print('response1 ::::::${response1.status}');
        isSuccessStatus = response1.status.obs;
        print('status : $isSuccessStatus');

        if(isSuccessStatus.value){
          Fluttertoast.showToast(msg: "${response1.message}");
          clearSignUpFieldsFunction();
          Get.back();

        } else {
          // Fluttertoast.showToast(msg: "${response1.message}");
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
    nameTextEditingController.clear();
    storeNameTextEditingController.clear();
    storeNumberTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    deliveryRangeTextEditingController.clear();
    storeAddressTextEditingController.clear();
  }
}