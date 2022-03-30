import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';

import '../../models/restaurant_list_screen_model/all_restaurant_list_model.dart';

class RestaurantListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<AllStore> allRestaurantList = [];

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

        for(int i = 0; i < allRestaurantModel.allStore.length; i++) {
          /// Only Active Store Add in List
          if(allRestaurantModel.allStore[i].isActive == true) {
            allRestaurantList.add(allRestaurantModel.allStore[i]);
          }
        }

        log("allRestaurantList : $allRestaurantList");
      } else {
        log("getAllRestaurantListFunction Else Else");
      }
    } catch(e) {
      log("getAllRestaurantListFunction Error1 : $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllRestaurantListFunction();
    super.onInit();
  }
}