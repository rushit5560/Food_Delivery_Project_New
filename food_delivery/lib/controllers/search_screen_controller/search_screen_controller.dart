import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/search_screen_models/search_product_model.dart';

class SearchScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController searchFieldController = TextEditingController();
  List<SingleFoodItem> searchedFoodList = [];

  searchFoodProductsFunction() async {
    isLoading(true);
    String url = ApiUrl.SearchFoodProductsApi;
    log("Search Products API URL : $url");

    try {
      Map<String, dynamic> data = {
        "searchdata": "${searchFieldController.text.trim()}",
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("response : ${response.body}");

      SearchProductsModel searchProductsModel = SearchProductsModel.fromJson(json.decode(response.body));
      isSuccessStatus = searchProductsModel.status.obs;

      if(isSuccessStatus.value) {
        searchedFoodList.clear();

        for(int i = 0; i < searchProductsModel.food.length; i++) {
          if(searchProductsModel.food[i].isActive == true) {
            searchedFoodList.add(searchProductsModel.food[i]);
          }
        }

        log("searchedFoodList Length : ${searchedFoodList.length}");

      } else {
        log("searchFoodProductsFunction Else Else");
      }


    } catch (e) {
      log("searchFoodProductsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }
}
