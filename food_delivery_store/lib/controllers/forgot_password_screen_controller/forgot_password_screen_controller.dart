import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../models/forgot_password_model/forgot_password_model.dart';

class ForgotPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> forgotPassFormKey = GlobalKey();
  TextEditingController emailFieldController = TextEditingController();


  forgotPasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.ForgotPasswordApi;
    log("Forgot Pass API URL : $url");

    try {
      Map<String, dynamic> data = {"Email" : "${emailFieldController.text.trim().toLowerCase()}"};
      log("data $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Forgot Pass Response : ${response.body}");

      ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel.fromJson(json.decode(response.body));
      isSuccessStatus = forgotPasswordModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${forgotPasswordModel.message}");
        Get.back();
      } else {
        log("forgotPasswordFunction Else Else");
        if(forgotPasswordModel.message.contains("user not found")) {
          Fluttertoast.showToast(msg: "${forgotPasswordModel.message}");
        }
      }


    } catch(e) {
      log("forgotPasswordFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

}