import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/bank_info_model/bank_info_model.dart';

class SendToBankScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey();
  final holderNameFieldController = TextEditingController();
  final bankNameFieldController = TextEditingController();
  final branchCodeFieldController = TextEditingController();
  final accountNumberFieldController = TextEditingController();
  final upiFieldController = TextEditingController();


  updateDriverBankInfoFunction() async {
    isLoading(true);
    String url = ApiUrl.BankInfoApi;
    print('url : $url');

    try{
      Map data = {
        "BankName" : "${bankNameFieldController.text.trim()}",
        "BranchName" : "${bankNameFieldController.text.trim()}",
        "HolderName" : "${holderNameFieldController.text.trim()}",
        "AccountNo" : "${accountNumberFieldController.text.trim()}",
        "RestaurantId" : "619789eea7c5063b32cab139"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      print('response : ${response.body}');

      BankInfoModel bankInfoModel = BankInfoModel.fromJson(json.decode(response.body));
      isSuccessStatus = bankInfoModel.status.obs;

      if(isSuccessStatus.value) {
        Get.back();
        Fluttertoast.showToast(msg: '${bankInfoModel.msg}');
      } else {
        print('updateDriverBankInfoFunction Else Else');
      }

    } catch(e) {
      print('updateDriverBankInfoFunction Error : $e');
    }finally {
      isLoading(false);
    }
  }

}