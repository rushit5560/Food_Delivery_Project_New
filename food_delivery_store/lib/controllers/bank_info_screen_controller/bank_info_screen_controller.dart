import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../models/bank_info_models/get_bank_info_model.dart';
import '../../models/bank_info_models/update_bank_info_model.dart';

class BankInfoScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String bankName = "";
  String branch = "";
  String holderName = "";
  String accountNo = "";

  GlobalKey<FormState> bankInfoFormKey = GlobalKey();
  TextEditingController bankNameFieldController = TextEditingController();
  TextEditingController branchCodeFieldController = TextEditingController();
  TextEditingController holderNameFieldController = TextEditingController();
  TextEditingController accountNoFieldController = TextEditingController();


  getRestaurantBankInfoFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantBankInfoApi + "622b09a668395c49dcb4aa73";
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetRestaurantBankInfoModel getRestaurantBankInfoModel = GetRestaurantBankInfoModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantBankInfoModel.status.obs;

      if(isSuccessStatus.value) {
        bankName = getRestaurantBankInfoModel.bankInfo.bankName;
        branch = getRestaurantBankInfoModel.bankInfo.branchName;
        holderName = getRestaurantBankInfoModel.bankInfo.holderName;
        accountNo = getRestaurantBankInfoModel.bankInfo.accountNo;

        bankNameFieldController.text = bankName;
        branchCodeFieldController.text = branch;
        holderNameFieldController.text = holderName;
        accountNoFieldController.text = accountNo;

      } else {
        log("getRestaurantBankInfoFunction Else Else");
      }

    } catch(e) {
      log("getRestaurantBankInfoFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  updateRestaurantBankInfoFunction() async {
    isLoading(true);
    String url = ApiUrl.EditRestaurantBankInfoApi;
    log("URL : $url");

    try {
      Map<String, dynamic> data = {
        "BankName" : "${bankNameFieldController.text.trim()}",
        "BranchName" : "${branchCodeFieldController.text.trim()}",
        "HolderName" : "${holderNameFieldController.text.trim()}",
        "AccountNo" : "${accountNoFieldController.text.trim()}",
        "RestaurantId" : "622b09a668395c49dcb4aa73"
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("response : $response");

      UpdateRestaurantBankInfoModel updateRestaurantBankInfoModel = UpdateRestaurantBankInfoModel.fromJson(json.decode(response.body));
      isSuccessStatus = updateRestaurantBankInfoModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${updateRestaurantBankInfoModel.msg}");
        Get.back();
        await getRestaurantBankInfoFunction();
      } else {
        log("updateRestaurantBankInfoFunction Else Else");
      }

    } catch(e) {
      log("editRestaurantBankInfoFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getRestaurantBankInfoFunction();
    super.onInit();
  }
}