import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/all_restaurants_model/all_restaurants_model.dart';
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

  RxList<AllStore> getAllRestaurantsList = RxList();
  AllStore restaurantsDropDownValue = AllStore();


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
        "RestaurantId" : "${restaurantsDropDownValue.id}"
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

  getAllRestaurantsListFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllRestaurantsApi;
    log("URL :$url");

    try{

      http.Response response = await http.get(Uri.parse(url));
      log("response : ${response.body}");

      GetAllRestaurantsModel getAllRestaurantsModel = GetAllRestaurantsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllRestaurantsModel.status.obs;

      if(isSuccessStatus.value) {
        getAllRestaurantsList.addAll(getAllRestaurantsModel.allStore);
        restaurantsDropDownValue = getAllRestaurantsList[0];
      } else {
        log("getAllRestaurantsListFunction Else Else");
      }

    } catch(e) {
      log("getAllRestaurantsListFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllRestaurantsListFunction();
    super.onInit();
  }

}