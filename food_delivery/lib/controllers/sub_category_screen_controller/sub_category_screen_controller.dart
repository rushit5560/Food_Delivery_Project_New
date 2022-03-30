import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';

import '../../models/sub_category_screen_model/sub_category_by_category_id_model.dart';

// import '../../models/sub_category_screen_model/sub_category_by_category_id_model.dart';

class SubCategoryScreenController extends GetxController {
  /// Category Id Get From Category Screen
  // String subCategoryId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController subCategorySearchFieldController = TextEditingController();
  List<SubCategory> subCategoryList = [];


  getCategoryWiseSubCategoryFunction() async {
    isLoading(true);

    String url = ApiUrl.CategoryWiseSubCategoryApi;
    String finalUrl = url + "6221995a75fcf57c10dcf2b8";
    log("Url : $finalUrl");

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));
      log("Response : ${response.body}");

      SubCategoryByCatIdModel subCategoryByCatIdModel = SubCategoryByCatIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = subCategoryByCatIdModel.status.obs;

      if(isSuccessStatus.value) {
        subCategoryList = subCategoryByCatIdModel.subcategory;
      } else {
        log("getCategoryWiseSubCategoryFunction Else Part");
      }

    } catch(e) {
      log("getCategoryWiseSubCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCategoryWiseSubCategoryFunction();
    super.onInit();
  }

}