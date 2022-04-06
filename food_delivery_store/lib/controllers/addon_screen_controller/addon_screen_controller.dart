import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/api_url.dart';
import '../../common/store_details.dart';
import '../../models/addon_models/add_addon_model.dart';
import '../../models/addon_models/get_all_addons_model.dart';


class AddonScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> addonFormKey = GlobalKey();
  TextEditingController addonNameFieldController = TextEditingController();
  TextEditingController addonPriceFieldController = TextEditingController();

  List<AddonAll> addonList = [];


  addNewAddonFunction() async {
    isLoading(true);
    String url = ApiUrl.CreateAddonApi;
    log("URL : $url");

    try {

      Map<String, dynamic> data = {
        "Name": "${addonNameFieldController.text.trim()}",
        "Restaurant": /*"622b09a668395c49dcb4aa73"*/"${StoreDetails.storeId}",
        "Price": "${addonPriceFieldController.text.trim()}"
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("response body : ${response.body}");

      AddAddonModel addAddonModel = AddAddonModel.fromJson(json.decode(response.body));
      isSuccessStatus = addAddonModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if (isSuccessStatus.value) {
        addonNameFieldController.clear();
        addonPriceFieldController.clear();
        Fluttertoast.showToast(msg: "${addAddonModel.message}");
      } else {
        log("addNewCategoryFunction Else Else");
      }
    } catch (e) {
      log("addNewCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  getAllAddonFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllAddonApi + /*"622b09a668395c49dcb4aa73"*/ StoreDetails.storeId;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllAddonModel getAllAddonModel = GetAllAddonModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAddonModel.status.obs;

      if(isSuccessStatus.value) {
        addonList.addAll(getAllAddonModel.addon);
        log("addonList : $addonList");
      } else {
        log("getAllAddonFunction Else Else");
      }


    } catch(e) {
      log("getAllAddonFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getAllAddonFunction();
    super.onInit();
  }

}