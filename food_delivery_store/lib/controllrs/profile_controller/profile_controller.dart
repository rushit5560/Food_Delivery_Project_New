import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/api_url.dart';
import 'package:food_delivery_admin/common/user_details.dart';
import 'package:food_delivery_admin/models/profile_model/profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController{
  String fullName = '';
  String email = '';
  int ? phone;
  // TextEditingController ? fullNameFieldController;
  // TextEditingController ? emailFieldController;
  // TextEditingController ? phoneNoFieldController;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  //List<Deliveryperson> profileList = [];

  getProfile() async {
    isLoading(true);
    String url = ApiUrl.GetProfileApi + "${UserDetails.storeId}";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : ${response.body}');

      ProfileModel profileModel = ProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = profileModel.status.obs;
      print("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        fullName = profileModel.user.firstName + " " + profileModel.user.lastName;
        email = profileModel.user.email;
        phone = profileModel.user.phone;
        print('fullName : $fullName');
        print('Email : $email');
        print('Phone : $phone');
      } else {
        print('Get All Banner Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    super.onInit();
    getProfile();
    // fullNameFieldController = TextEditingController(text: '$fullName');
    // emailFieldController = TextEditingController(text: '$email');
    // phoneNoFieldController = TextEditingController(text: '$phone');
  }


}