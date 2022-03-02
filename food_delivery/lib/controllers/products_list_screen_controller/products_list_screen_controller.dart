import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/products_list_screen_model/get_all_products_model.dart';


class ProductsListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<GetList> allProductList = [];


  getAllProducts() async {
    isLoading(true);
    String url = ApiUrl.AllProductsApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('Response : $response');

      GetAllProductsModel getAllProductsModel = GetAllProductsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllProductsModel.status!.obs;
      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        allProductList = getAllProductsModel.getList!;
        print('allProductList : $allProductList');
      } else {
        print('Get All Products Else Else');
      }

    } catch(e) {
      print('Get All Products Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

}