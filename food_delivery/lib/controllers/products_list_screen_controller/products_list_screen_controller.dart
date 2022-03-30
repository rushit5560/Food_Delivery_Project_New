import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/enums.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/products_list_screen_model/get_all_products_model.dart';
import '../../models/products_list_screen_model/get_products_by_cat_id_model.dart';


class ProductsListScreenController extends GetxController {
  ProductsEnum productsEnum = Get.arguments[0];
  String categoryId = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<GetAllProductList> allProductList = [];
  List<Product> productsListByCategoryId = [];


  getAllProducts() async {
    isLoading(true);
    String url = ApiUrl.AllProductsApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('Response : ${{response.body}}');

      GetAllProductsModel getAllProductsModel = GetAllProductsModel.fromJson(json.decode(response.body)) ;
      isSuccessStatus = getAllProductsModel.status!.obs;
      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        allProductList = getAllProductsModel.list!;
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

  // getProductsByCategoryId(String categoryId) async {
  //   isLoading(true);
  //   print('categoryId : $categoryId');
  //   String url = ApiUrl.CategoryWiseProductApi;
  //   String finalUrl = url + "$categoryId";
  //   print('finalUrl : $finalUrl');
  //
  //   try{
  //     http.Response response = await http.get(Uri.parse(url));
  //     print('response : ${response.body}');
  //
  //     ProductsByCategoryIdModel productsByCategoryIdModel = ProductsByCategoryIdModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = productsByCategoryIdModel.status.obs;
  //     print('isSuccessStatus : $isSuccessStatus');
  //
  //     if(isSuccessStatus.value) {
  //       productsListByCategoryId = productsByCategoryIdModel.product.obs;
  //       print('productsListByCategoryId : $productsListByCategoryId');
  //     } else {
  //       print('Product Get By Category Id : $productsListByCategoryId');
  //     }
  //
  //   } catch(e) {
  //     print('Category Wise Product Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  //
  // }

  getProductsByCategoryId(String categoryId) async {
    isLoading(true);
    print('categoryId : $categoryId');
    String url = ApiUrl.CategoryWiseProductApi;
    String finalUrl = url + "$categoryId";
    print('finalUrl : $finalUrl');

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : ${response.body}');

      ProductsByCategoryIdModel productsByCategoryIdModel = ProductsByCategoryIdModel.fromJson(json.decode(response.body));
      print('productsByCategoryIdModel : $productsByCategoryIdModel');
      isSuccessStatus = productsByCategoryIdModel.status.obs;
      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value) {
        productsListByCategoryId = productsByCategoryIdModel.product;
        print('productsListByCategoryId : $productsListByCategoryId');
      } else {
        print('Product Get By Category Id Else Else');
      }

    } catch(e) {
      print('Category Wise Product Error : $e');
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    /// Product GetByCategoryId Or All Product
    if(productsEnum == ProductsEnum.AllProducts){
      print('ProductsEnum.AllProducts');
      getAllProducts();
    } else if(productsEnum == ProductsEnum.SubCategoryWiseProducts) {
      print('ProductsEnum.CategoryWiseProducts');
      getProductsByCategoryId(categoryId);
    }

    super.onInit();
  }

}