import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../models/change_password_model/change_password_model.dart';

class ChangePasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isOldPassVisible = true.obs;
  RxBool isNewPassVisible = true.obs;
  RxBool isCNewPassVisible = true.obs;

  GlobalKey<FormState> changePassFormKey = GlobalKey();
  TextEditingController oldPassFieldController = TextEditingController();
  TextEditingController newPassFieldController = TextEditingController();
  TextEditingController cNewPassFieldController = TextEditingController();

  updatePasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.ChangePasswordApi;
    log("Update Password API URL : $url");

    try {
      Map<String, dynamic> data = {
        // "Email" : "$userEmail",
        "Password" : "${oldPassFieldController.text.trim()}",
        "newPassword" : "${newPassFieldController.text.trim()}",
        "confirmPassword" : "${cNewPassFieldController.text.trim()}"
      };
      log("Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);

      ChangePasswordModel changePasswordModel = ChangePasswordModel.fromJson(json.decode(response.body));
      isSuccessStatus = changePasswordModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${changePasswordModel.message}");
        Get.back();
      } else {
        log("updatePasswordFunction Else Else");
        if(changePasswordModel.message.contains("Wrong")){
          Fluttertoast.showToast(msg: "${changePasswordModel.message}");
        }
      }

    } catch(e) {
      log("updatePasswordFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

}