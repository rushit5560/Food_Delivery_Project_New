import 'dart:convert';
import 'dart:developer';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/cart_models/get_user_cart_model.dart';


class CartScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<CartItem> cartItemsList = [];
  CartDetail? userCartDetail;
  RxString cartItemRestaurantId = "".obs;
  RxInt cartSubTotalAmount = 0.obs;

  /// Get Cart Details
  getUserCartDetailsByIdFunction() async {
    log("User Id : ${UserDetails.userId}");
    isLoading(true);
    String url = ApiUrl.GetUserCartApi + UserDetails.userId;
    log("User Cart URL : $url");

    try{
       http.Response response = await http.get(Uri.parse(url));
       log("Get User Cart Response : ${response.body}");

       GetUserCartModel getUserCartModel = GetUserCartModel.fromJson(json.decode(response.body));
       isSuccessStatus = getUserCartModel.status.obs;

       if(isSuccessStatus.value) {
         cartItemRestaurantId = getUserCartModel.cart.restaurantId.id.obs;

         cartItemsList.clear();
         cartItemsList.addAll(getUserCartModel.cartItem);
         log("CartItemsList Length : ${cartItemsList.length}");


         userCartDetail = getUserCartModel.cart;
         log("userCartDetail : $userCartDetail");

         cartSubTotalAmount.value = getUserCartModel.cart.subTotal;

       } else {
         log("getUserCartDetailsByIdFunction Else Else");
       }


    } catch(e) {
      log("getUserCartDetailsByIdFunction Error :: $e");
    } finally {
      isLoading(false);
    }

  }



  @override
  void onInit() {
    getUserCartDetailsByIdFunction();
    super.onInit();
  }

}