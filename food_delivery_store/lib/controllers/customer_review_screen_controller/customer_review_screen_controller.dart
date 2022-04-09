import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

class CustomerReviewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  getCustomerReviewFunction() async {
    isLoading(true);
    String url = ApiUrl.GetCustomerFoodReviewApi;
    log("URL : $url");

    try{

      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");



    } catch(e) {
      log("getCustomerReviewFunction Error : $e");
    } finally{
      isLoading(false);
    }
  }
}