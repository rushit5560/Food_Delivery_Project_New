import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../common/constants/api_url.dart';
import '../../models/customer_review_models/food_details_model.dart';
import '../../models/customer_review_models/get_single_product_review_model.dart';

class ReviewDetailsScreenController extends GetxController {
  String productId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<SingleReview> productReviewList = [];

  SingleProduct singleProduct = SingleProduct();



  /// Get Product Details By Id
  getProductDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.GetProductDetailsApi + productId;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      FoodDetailsModel foodDetailsModel = FoodDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = foodDetailsModel.status.obs;

      if(isSuccessStatus.value) {
        singleProduct = foodDetailsModel.product;
        log("singleProduct : $singleProduct");
      } else {
        log("getProductDetailsByIdFunction Else Else");
      }

    } catch(e) {
      log("getProductDetailsByIdFunction Error : $e");
    } finally {
      // isLoading(false);
      await getProductReviewByIdFunction();
    }

  }

  /// Get Product Review List By Id
  getProductReviewByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.GetFoodReviewsApi + productId;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetSingleProductReviewModel getSingleProductReviewModel = GetSingleProductReviewModel.fromJson(json.decode(response.body));
      isSuccessStatus = getSingleProductReviewModel.status.obs;

      if(isSuccessStatus.value) {
        productReviewList.clear();
        productReviewList.addAll(getSingleProductReviewModel.review);
        log("productReviewList : $productReviewList");
      } else {
        log("getProductReviewByIdFunction Else Else");
      }

    } catch(e) {
      log("getProductDetailsByIdFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getProductDetailsByIdFunction();
    super.onInit();
  }

}