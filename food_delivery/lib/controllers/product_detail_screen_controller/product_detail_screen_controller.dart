import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/product_details_model/give_product_review_model.dart';
import '../../models/product_details_model/product_details_model.dart';


class ProductDetailScreenController extends GetxController{
  String productId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt qty = 1.obs;

  String productName = '';
  int productPrice = 0;
  String productDescription = '';


  void onClickedDec() {
    isLoading(true);
    if (qty > 0) {
      qty--;
    }
    isLoading(false);
  }

  void onClickedInc() {
    isLoading(true);
    if(qty < 9){
      qty++;
    }
    isLoading(false);
  }

  giveProductReview(double rating) async {
    // isLoading(true);
    String url = ApiUrl.ProductReviewApi;
    print('Url : $url');

    try{
      Map<String, dynamic> data = {
        "Product" : "$productId",
        "Customer" : "61f0ffb3927a090dae0cd777",
        "Review" : "Testy Dish",
        "Rating" : "$rating"
      };

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('response : $response');

      GiveProductReviewModel giveProductReviewModel = GiveProductReviewModel.fromJson(json.decode(response.body));
      isSuccessStatus = giveProductReviewModel.status.obs;

      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        Get.snackbar('${giveProductReviewModel.message}', '');
      } else {
        print('Give Product Review False False');
      }
    } catch(e) {
      print('Give Review Error : $e');
    } finally{
      // isLoading(false);
    }
  }

  getProductByProductId() async {
    isLoading(true);
    String url = ApiUrl.ProductByIdApi;
    String finalUrl = url + "$productId";
    print('finalUrl : $finalUrl');

    try {
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : $response');

      ProductDetailsModel productDetailsModel =
          ProductDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = productDetailsModel.status.obs;

      if (isSuccessStatus.value) {
        productName = productDetailsModel.product.productName;
        productPrice = productDetailsModel.product.price;
        productDescription = productDetailsModel.product.description;
        print('productName : $productName');
        print('productPrice : $productPrice');
        print('productDescription : $productDescription');
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
    getProductByProductId();
    super.onInit();
  }
}