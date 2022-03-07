import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreenController extends GetxController{
  //File file = File.obs;
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


  @override
  void onInit() {
    super.onInit();
  }


}