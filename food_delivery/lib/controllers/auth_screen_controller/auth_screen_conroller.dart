import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  final userNameTextFieldController = TextEditingController();
  final fullNameTextFieldController = TextEditingController();
  final phoneNoTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();

  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController signInEmailFieldController = TextEditingController();
  TextEditingController signInPasswordFieldController = TextEditingController();
  TextEditingController signInPhoneFieldController = TextEditingController();
  File? file;
  String? chosenValue;
  String? areaValue;
  String? selectedGenderValue;


  @override
  void onInit() {
    super.onInit();
  }

}