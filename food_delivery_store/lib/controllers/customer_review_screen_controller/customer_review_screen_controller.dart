import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../models/customer_review_models/get_product_review_model.dart';

class CustomerReviewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Review> reviewList = [];

  getCustomerReviewFunction() async {
    isLoading(true);
    String url = ApiUrl.GetCustomerFoodReviewApi + "622b09a668395c49dcb4aa73" /*StoreDetails.storeId*/;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetProductReviewModel getProductReviewModel = GetProductReviewModel.fromJson(json.decode(response.body));
      isSuccessStatus = getProductReviewModel.status.obs;

      if(isSuccessStatus.value) {
        reviewList.clear();

        for(int i =0; i < getProductReviewModel.review.length; i++) {
          if(getProductReviewModel.review[i].isActive == true) {
            reviewList.add(getProductReviewModel.review[i]);
          }
        }

        log("reviewList : $reviewList");

      } else {
        log("getCustomerReviewFunction Else Else");
      }



    } catch(e) {
      log("getCustomerReviewFunction Error : $e");
    } finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCustomerReviewFunction();
    super.onInit();
  }
}