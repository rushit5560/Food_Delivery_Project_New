import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/api_url.dart';
import '../../models/addon_models/add_addon_model.dart';
import '../../models/addon_models/delete_addon_model.dart';
import '../../models/addon_models/get_all_addons_model.dart';
import '../../models/addon_models/update_addon_model.dart';


class AddonScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  /// Add Addon Fields
  GlobalKey<FormState> addonFormKey = GlobalKey();
  TextEditingController addonNameFieldController = TextEditingController();
  TextEditingController addonPriceFieldController = TextEditingController();

  /// Update Addon Fields
  GlobalKey<FormState> updateAddonFormKey = GlobalKey();
  TextEditingController updateAddonNameFieldController = TextEditingController();
  TextEditingController updateAddonPriceFieldController = TextEditingController();

  List<AddonAll> addonList = [];


  /// Add New Addon Function
  addNewAddonFunction() async {
    isLoading(true);
    String url = ApiUrl.CreateAddonApi;
    log("URL : $url");

    try {

      Map<String, dynamic> data = {
        "Name": "${addonNameFieldController.text.trim()}",
        "Restaurant": "622b09a668395c49dcb4aa73"/*"${StoreDetails.storeId}"*/,
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
      // isLoading(false);
      await getAllAddonFunction();
    }
  }

  /// Get All Addon Function
  getAllAddonFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllAddonApi + "622b09a668395c49dcb4aa73" /*StoreDetails.storeId*/;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllAddonModel getAllAddonModel = GetAllAddonModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAddonModel.status.obs;

      if(isSuccessStatus.value) {
        addonList.clear();
        // addonList.addAll(getAllAddonModel.addon);
        for(int i = 0; i < getAllAddonModel.addon.length; i++) {
          if(getAllAddonModel.addon[i].isActive == true) {
            addonList.add(getAllAddonModel.addon[i]);
          }
        }

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

  /// Delete Addon Function
  deleteAddonFunction({required String addonId}) async {
    isLoading(true);
    String url = ApiUrl.DeleteAddonApi + addonId;
    log("url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url));
      log("response : ${response.body}");

      DeleteAddonModel deleteAddonModel = DeleteAddonModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteAddonModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${deleteAddonModel.message}");
        await getAllAddonFunction();
      } else {
        log("deleteAddonFunction Else Else");
      }

    } catch(e) {
      log("deleteAddonFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  /// Update Addon Function
  updateAddonFunction({required String addonId}) async {
    isLoading(true);
    String url = ApiUrl.UpdateAddonApi + addonId;
    log("URL : $url");

    try{
      Map<String, dynamic> data = {
        "Name" : "${updateAddonNameFieldController.text.trim()}",
        "Price" : "${updateAddonPriceFieldController.text.trim()}"
      };
      http.Response response = await http.post(Uri.parse(url), body: data);
      log("response : $response");

      UpdateAddonModel updateAddonModel = UpdateAddonModel.fromJson(json.decode(response.body));
      isSuccessStatus = updateAddonModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${updateAddonModel.msg}");
        Get.back();
      } else {
        log("updateAddonFunction Else Else");
      }


    } catch(e) {
      log("updateAddonFunction Error : $e");
    } finally {
      isLoading(false);
      await getAllAddonFunction();
    }

  }

  @override
  void onInit() {
    getAllAddonFunction();
    super.onInit();
  }

}