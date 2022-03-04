import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController{
  //File file = File.obs;

  final GlobalKey<FormState> signupFormKey = GlobalKey();

  final nameTextEditingController = TextEditingController();
  final storeNameTextEditingController = TextEditingController();
  final storeNumberTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final adminShareTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final deliveryRangeTextEditingController = TextEditingController();
  final storeAddressTextEditingController = TextEditingController();
}