import 'dart:convert';

import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/user_details.dart';
import 'package:food_delivery_admin/models/store_products_model/store_products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemScreenController extends GetxController {
  RxBool isStoreProductsSelected = true.obs;
  RxBool isAdminProductsSelected = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Food> storeProductList = [];

  // List<StoreProductModel> storeProductLists = [
  //   StoreProductModel(name: 'Pizza', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Burger', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Sandwich', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Hotdog', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Tacos', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Burrito', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Muffins', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Donuts', img: '${Images.ic_category1}', qty: '5'),
  //   StoreProductModel(name: 'Bacon', img: '${Images.ic_category1}', qty: '5'),
  // ];

  @override
  void onInit() {
    super.onInit();
    getStoreProductList();
  }

  getStoreProductList() async {
    print("Store Id: ${UserDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.StoreProductApi + "${UserDetails.storeId}";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : ${response.body}');

      RestaurantProductsModel restaurantProductsModel = RestaurantProductsModel.fromJson(json.decode(response.body));
      isSuccessStatus = restaurantProductsModel.status.obs;
      print("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        storeProductList = restaurantProductsModel.food;
        print('allStoreProductsOrder : $storeProductList');
      } else {
        print('Get All Store Products Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }
}