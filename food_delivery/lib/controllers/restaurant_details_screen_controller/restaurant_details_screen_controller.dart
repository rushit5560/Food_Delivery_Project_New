import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/models/get_all_product_list_of_restaurant_model/get_all_product_list_of_restaurant_model.dart';
import 'package:food_delivery/models/restaurant_details_model/restaurant_details_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantDetailsScreenController extends GetxController{
  String restaurantId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String restaurantName = '';
  double restaurantRating = 0.0;
  String minDeliveryTime = '';
  String maxDeliveryTime = '';
  String restaurantImage = '';

  List<Food> productList = [];


  /// Restaurant details
  getRestaurantByRestaurantId() async {
    isLoading(true);
    String url = ApiUrl.RestaurantByIdApi;
    String finalUrl = url + "$restaurantId";
    print('finalUrl : $finalUrl');

    try {
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : $response');

      RestaurantDetailsModel restaurantDetailsModel =
      RestaurantDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = restaurantDetailsModel.status.obs;
      log('isSuccessStatus: $isSuccessStatus');

      if (isSuccessStatus.value) {
        restaurantImage = "${ApiUrl.ApiMainPath}" + restaurantDetailsModel.user.image;
        restaurantName = restaurantDetailsModel.user.storeName;
        restaurantRating = restaurantDetailsModel.user.rating;
        minDeliveryTime = restaurantDetailsModel.user.minDeliveryTime;
        maxDeliveryTime = restaurantDetailsModel.user.maxDeliveryTime;

        log('restaurantImage: $restaurantImage');
      } else {
        print('Get Product By Id Else Else');
      }
    } catch (e) {
      print('Error : $e');
    } finally {
      //isLoading(false);
      getAllProductListOfRestaurant();
    }
  }

  /// Get All Product List Of Restaurant
  getAllProductListOfRestaurant() async {
    isLoading(true);
    String url = ApiUrl.GetAllProductOfRestaurantApi;
    String finalUrl = url + "$restaurantId";
    print('finalUrl : $finalUrl');

    try {
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('getAllProductListOfRestaurant response : ${response.body}');

      GetAllProductListOfRestaurantModel getAllProductListOfRestaurantModel =
      GetAllProductListOfRestaurantModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllProductListOfRestaurantModel.status.obs;
      log('isSuccessStatus: $isSuccessStatus');

      if (isSuccessStatus.value) {
        // for(int i = 0; i <getAllProductListOfRestaurantModel.food.length; i++) {
        //   if(getAllProductListOfRestaurantModel.food[i].isActive == true) {
        //     productList.add(getAllProductListOfRestaurantModel.food[i]);
        //   }
        // }
        productList = getAllProductListOfRestaurantModel.food;
        print('productList : $productList');

       // log('restaurantImage: $restaurantImage');
      } else {
        print('Get Product By Id Else Else');
      }
    } catch (e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getRestaurantByRestaurantId();
    super.onInit();
  }
}