import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/category_screen_model/restaurant_wise_category_model.dart';
import '../../models/category_screen_model/search_category_model.dart';

class CategoryScreenController extends GetxController {
  String restaurantId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  TextEditingController searchFieldController = TextEditingController();
  List<Category> restaurantWiseCategoryList = [];
  List<SearchCategory> searchCategoryList = [];

  getRestaurantWiseCategoryListFunction() async {
    isLoading(true);
    String url =ApiUrl.RestaurantWiseCategoryApi;
    String finalUrl = url + restaurantId;
    print('Url : $finalUrl');

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));

      print('Response : $response');

      RestaurantWiseCategoryModel restaurantWiseCategoryModel = RestaurantWiseCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = restaurantWiseCategoryModel.status.obs;

      if(isSuccessStatus.value){
        restaurantWiseCategoryList = restaurantWiseCategoryModel.category;
        print('Restaurant wise allCategoryList : $restaurantWiseCategoryList');
      } else {
        print('Get All Category Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }

  searchCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.SearchCategoryApi;
    log("Search Category API URL : $url");

    try {
      Map<String, dynamic> data = {"searchdata" : "${searchFieldController.text.trim()}"};
      log("Data :: $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Search Category Response : ${response.body}");

      SearchCategoryModel searchCategoryModel = SearchCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = searchCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        searchCategoryList.clear();
        searchCategoryList = searchCategoryModel.category;
      } else {
        log("searchCategoryFunction Else Else");
      }

    } catch(e) {
      log("searchCategoryFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getRestaurantWiseCategoryListFunction();
    super.onInit();
  }
}