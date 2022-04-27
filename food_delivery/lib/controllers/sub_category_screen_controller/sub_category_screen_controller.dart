import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import '../../models/sub_category_screen_model/search_sub_category_model.dart';
import '../../models/sub_category_screen_model/sub_category_by_category_id_model.dart';


class SubCategoryScreenController extends GetxController {
  /// Category Id Get From Category Screen
  String subCategoryId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController subCategorySearchFieldController = TextEditingController();
  List<SubCategory> subCategoryList = [];
  List<SearchSbCategory> searchSubCategoryList = [];


  getCategoryWiseSubCategoryFunction() async {
    isLoading(true);

    String url = ApiUrl.CategoryWiseSubCategoryApi;
    String finalUrl = url + subCategoryId;
    log("Url : $finalUrl");

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));
      log("Response : ${response.body}");

      SubCategoryByCatIdModel subCategoryByCatIdModel = SubCategoryByCatIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = subCategoryByCatIdModel.status.obs;

      if(isSuccessStatus.value) {
        subCategoryList.clear();

        for(int i = 0; i < subCategoryByCatIdModel.subcategory.length; i++) {
          if(subCategoryByCatIdModel.subcategory[i].isActive == true) {
            subCategoryList.add(subCategoryByCatIdModel.subcategory[i]);
          }
        }

      } else {
        log("getCategoryWiseSubCategoryFunction Else Part");
      }

    } catch(e) {
      log("getCategoryWiseSubCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }


  searchSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.SearchSubCategoryApi;
    log("Search Sub Category API URL : $url");

    try {
      Map<String, dynamic> data = {"searchdata" : "${subCategorySearchFieldController.text.trim()}"};
      log("Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      // log("Search Sub Category Response : ${response.body}");

      SearchSubCategoryModel searchSubCategoryModel = SearchSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = searchSubCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        searchSubCategoryList.clear();
        for(int i = 0; i < searchSubCategoryModel.category.length; i++) {
          if(searchSubCategoryModel.category[i].isActive == true) {
            searchSubCategoryList.add(searchSubCategoryModel.category[i]);
          }
        }

        log("searchSubCategoryList Length : ${searchSubCategoryList.length}");
      } else {
        log("searchSubCategoryFunction Else Else");
      }


    } catch(e) {
      log("searchSubCategoryFunction Error ::: $e");
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