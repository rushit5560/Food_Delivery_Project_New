import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/models/category_screen_model/restaurant_wise_category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantWiseCategoryScreenController extends GetxController{
  RxBool isLoading = false.obs;
  String categoryId = Get.arguments;
  RxBool isSuccessStatus = false.obs;
  List<Restaurant> restaurantWiseCategoryList = [];

  getRestaurantWiseCategoryListFunction() async {
    isLoading(true);
    String url =ApiUrl.RestaurantWiseCategoryApi;
    String finalUrl = url + categoryId;
    print('Url : $finalUrl');

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));

      print('Response : ${response.body}');

      RestaurantWiseCategoryModel restaurantWiseCategoryModel = RestaurantWiseCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = restaurantWiseCategoryModel.status.obs;

      if(isSuccessStatus.value){
        restaurantWiseCategoryList = restaurantWiseCategoryModel.category.restaurants;
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRestaurantWiseCategoryListFunction();
  }
}