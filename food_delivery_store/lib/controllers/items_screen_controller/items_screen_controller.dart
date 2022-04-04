import 'dart:convert';
import 'dart:developer';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/items_screen_models/get_all_admin_products_model.dart';
import '../../models/items_screen_models/get_restaurant_all_product_model.dart';

class ItemScreenController extends GetxController {
  RxBool isStoreProductsSelected = true.obs;
  RxBool isAdminProductsSelected = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Food> storeProductList = [];
  List<ListElement> adminProductsList = [];

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
    getAdminProductsListFunction();
  }

  /// Get Admin All Products List
  getAdminProductsListFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAdminProductsApi;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));

      GetAllAdminProductsModule getAllAdminProductsModule = GetAllAdminProductsModule.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAdminProductsModule.status.obs;

      if(isSuccessStatus.value) {
        adminProductsList.addAll(getAllAdminProductsModule.list);
      } else {
        log("getAdminProductsListFunction Else Else");
      }
    } catch(e) {
      log("getAdminProductsListFunction Error : $e");
    } finally {
      // isLoading(false);
      getStoreProductList();
    }
  }

  /// Get Store Products List
  getStoreProductList() async {
    print("Store Id: ${UserDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.GetRestaurantProductsApi + "${UserDetails.storeId}";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : ${response.body}');

      GetRestaurantAllProductModel getRestaurantAllProductModel = GetRestaurantAllProductModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantAllProductModel.status.obs;
      print("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        storeProductList = getRestaurantAllProductModel.food;
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