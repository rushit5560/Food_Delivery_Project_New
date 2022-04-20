import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';

import '../../models/restaurant_list_screen_model/all_restaurant_list_model.dart';
import '../../models/restaurant_list_screen_model/search_restaurant_list_model.dart';

class RestaurantListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<AllStore> allRestaurantList = [];
  List<SearchStore> searchRestaurantList = [];


  TextEditingController restaurantSearchFieldController = TextEditingController();


  getAllRestaurantListFunction() async {
    isLoading(true);
    String url = ApiUrl.AllRestaurantApi;
    log("Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      AllRestaurantModel allRestaurantModel = AllRestaurantModel.fromJson(json.decode(response.body));
      isSuccessStatus = allRestaurantModel.status.obs;
      // log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        allRestaurantList.clear();
        allRestaurantList.addAll(allRestaurantModel.allStore);

        log("allRestaurantList Length : ${allRestaurantList.length}");
      } else {
        log("getAllRestaurantListFunction Else Else");
      }
    } catch(e) {
      log("getAllRestaurantListFunction Error1 : $e");
    } finally {
      isLoading(false);
    }
  }

  searchRestaurantListFunction() async {
    isLoading(true);
    String url = ApiUrl.SearchRestaurantApi;
    log("Search Restaurant API URL : $url");

    try {
      Map<String, dynamic> data = {
        "searchdata" : "${restaurantSearchFieldController.text.trim().toString()}",
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);

      SearchRestaurantModel searchRestaurantModel = SearchRestaurantModel.fromJson(json.decode(response.body));
      isSuccessStatus = searchRestaurantModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        searchRestaurantList.clear();

        /// Only Active Store Add in List
        for(int i = 0; i < searchRestaurantModel.store.length; i++) {
          if(searchRestaurantModel.store[i].isActive == true) {
            searchRestaurantList.add(searchRestaurantModel.store[i]);
          }
        }
        log("searchRestaurantList Length : ${searchRestaurantList.length}");
        if(searchRestaurantList.length == 0) {
          Fluttertoast.showToast(msg: "Search Food Not Available!");
        }
      } else {
       log("searchRestaurantListFunction Else Else");
      }

    } catch(e) {
      log("searchRestaurantListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getAllRestaurantListFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}