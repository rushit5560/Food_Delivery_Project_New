import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/store_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/items_screen_models/delete_store_product_model.dart';
import '../../models/items_screen_models/get_all_admin_products_model.dart';
import '../../models/items_screen_models/get_restaurant_all_product_model.dart';

class ItemScreenController extends GetxController {
  RxBool isStoreProductsSelected = true.obs;
  RxBool isAdminProductsSelected = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Food> storeProductList = [];
  List<ListElement> adminProductsList = [];


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
    print("Store Id: ${StoreDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.GetRestaurantProductsApi + /*"${StoreDetails.storeId}"*/"622b09a668395c49dcb4aa73";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : ${response.body}');

      GetRestaurantAllProductModel getRestaurantAllProductModel = GetRestaurantAllProductModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantAllProductModel.status.obs;
      print("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        storeProductList.clear();

        for(int i = 0; i < getRestaurantAllProductModel.food.length; i++) {
          if(getRestaurantAllProductModel.food[i].isActive == true) {
            storeProductList.add(getRestaurantAllProductModel.food[i]);
          }
        }
        print('getStoreProductList : $storeProductList');
      } else {
        print('Get All Store Products Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }


  /// Delete Product
  deleteStoreProductByIdFunction({required String productId}) async {
    isLoading(true);
    String url = ApiUrl.ApiMainPath + productId;
    log("URL  :$url");

    try{
      http.Response response = await http.post(Uri.parse(url));
      log("response : $response");

      DeleteStoreProductModel deleteStoreProductModel = DeleteStoreProductModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteStoreProductModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${deleteStoreProductModel.message}");
      } else {
        log("deleteStoreProductByIdFunction Else Else");
      }

    } catch(e) {
      log("deleteStoreProductByIdFunction Error :: $e");
    } finally {
      // isLoading(false);
      await getStoreProductList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    // getAdminProductsListFunction();
    getStoreProductList();
  }


}