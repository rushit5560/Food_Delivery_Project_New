import 'dart:convert';
import 'dart:developer';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../common/constant/enums.dart';
import '../../models/products_list_screen_model/get_all_products_model.dart';
import '../../models/products_list_screen_model/get_product_by_sub_cat_id_model.dart';
import '../../models/products_list_screen_model/get_products_by_cat_id_model.dart';


class ProductsListScreenController extends GetxController {
  ProductsEnum productsEnum = Get.arguments[0];
  String subCategoryId = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<GetAllProductList> allProductList = [];
  List<Food> productsListBySubCategoryId = [];
  // List<Product> productsListByCategoryId = [];


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
        allProductList.clear();

        for(int i = 0; i <getAllProductsModel.list!.length; i++) {
          if(getAllProductsModel.list![i].isActive == true) {
            allProductList.add(getAllProductsModel.list![i]);
          }
        }
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

  getSubCategoryWiseProductsFunction(String subCategoryId) async {
    isLoading(true);
    String url = ApiUrl.SubCategoryWiseProductApi + subCategoryId;
    log("Sub Category API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Sub Category Wise Product Response : ${response.body}");

      SubCategoryWiseProductsModel subCategoryWiseProductsModel = SubCategoryWiseProductsModel.fromJson(json.decode(response.body));
      isSuccessStatus = subCategoryWiseProductsModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        productsListBySubCategoryId =  subCategoryWiseProductsModel.food;
        log("productsListBySubCategoryId Length : ${productsListBySubCategoryId.length}");
      } else {
        log("productsListBySubCategoryId Else Else");
      }

    } catch(e) {
      log("getSubCategoryWiseProductsFunction Error :::$e");
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

  /*getProductsByCategoryId(String categoryId) async {
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

  }*/

  @override
  void onInit() {
    /// Product GetByCategoryId Or All Product
    if(productsEnum == ProductsEnum.AllProducts){
      print('ProductsEnum.AllProducts');
      getAllProducts();
    } else if(productsEnum == ProductsEnum.SubCategoryWiseProducts) {
      print('ProductsEnum.CategoryWiseProducts');
      getSubCategoryWiseProductsFunction(subCategoryId);
    }
    // getAllProducts();

    super.onInit();
  }

}