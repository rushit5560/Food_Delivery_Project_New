import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/user_cart_details.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/sharedpreference_data/sharedpreference_data.dart';
import '../../models/cart_models/delete_cart_item_model.dart';
import '../../models/cart_models/delete_cart_model.dart';
import '../../models/cart_models/get_user_cart_model.dart';
import '../../models/cart_models/update_cart_item_qty_model.dart';



class CartScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<CartItem> cartItemsList = [];
  CartDetail? userCartDetail;
  RxString cartItemRestaurantId = "".obs;
  RxInt cartSubTotalAmount = 0.obs;
  RxInt cartTotalItems = 0.obs;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  TextEditingController couponFieldController = TextEditingController();

  /// Get Cart Details
  getUserCartDetailsByIdFunction() async {
    log("User Id : ${UserDetails.userId}");
    isLoading(true);
    String url = ApiUrl.GetUserCartApi + UserDetails.userId;
    log("User Cart URL : $url");

    try{
       http.Response response = await http.get(Uri.parse(url));

       GetUserCartModel getUserCartModel = GetUserCartModel.fromJson(json.decode(response.body));
       isSuccessStatus = getUserCartModel.status.obs;

       if(isSuccessStatus.value) {
         for(int i=0 ; i< getUserCartModel.cartItem.length ; i++){
           cartItemRestaurantId = getUserCartModel.cartItem[i].id.obs;
         }


         cartItemsList.clear();
         cartItemsList.addAll(getUserCartModel.cartItem);
         log("CartItemsList Length : ${cartItemsList.length}");


         userCartDetail = getUserCartModel.cart;
         log("userCartDetail : $userCartDetail");

         // cartSubTotalAmount.value = getUserCartModel.cart.subTotal;

         cartSubTotalAmount = 0.obs;
         cartTotalItems = 0.obs;
         for(int i=0; i < cartItemsList.length; i++) {
           cartSubTotalAmount = cartSubTotalAmount + (cartItemsList[i].productPrice * cartItemsList[i].productQuantity);
           cartTotalItems = cartTotalItems + cartItemsList[i].productQuantity;
         }

         sharedPreferenceData.setUserCartDetails(cartId: "${getUserCartModel.cart.id}", cartRestaurantId: "${getUserCartModel.cart.restaurantId.id}");

       } else {
         log("getUserCartDetailsByIdFunction Else Else");
         cartItemsList = [];
         cartSubTotalAmount = 0.obs;
         cartTotalItems = 0.obs;
       }


    } catch(e) {
      log("getUserCartDetailsByIdFunction Error :: $e");
      cartItemsList = [];
      cartSubTotalAmount = 0.obs;
      cartTotalItems = 0.obs;

    } finally {
      isLoading(false);
    }

  }


  /// Update Cart Item Quantity
  updateCartItemQuantityByIdFunction({required String cartItemId, required String productQty}) async {
    isLoading(true);
    String url = ApiUrl.UpdateCartItemQuantityApi;
    log("Update Cart Item Qty : $url");

    try{
      Map<String, dynamic> data = {
        "id" : "$cartItemId",
        "ProductQuantity" : "$productQty"
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      UpdateCartItemQtyModel updateCartItemQtyModel = UpdateCartItemQtyModel.fromJson(json.decode(response.body));
      isSuccessStatus = updateCartItemQtyModel.status.obs;

      if(isSuccessStatus.value) {
        log("isSuccessStatus : $isSuccessStatus");
        await getUserCartDetailsByIdFunction();
      } else {
        log("updateCartItemQuantityByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e){
      log("updateCartItemQuantityByIdFunction Error :: $e");
    } finally {
      isLoading(false);
    }

  }


  /// Delete Cart
  deleteCartByIdFunction() async {
    // isLoading(true);
    String url = ApiUrl.DeleteUserCartApi;
    log("Delete User Cart Item API URL : $url");

    try{
      Map<String, dynamic> data = {
        "cartitemid" : "$cartItemRestaurantId",
        "cartid" : "${UserCartDetails.userCartId}"
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      DeleteCartModel deleteCartModel = DeleteCartModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteCartModel.status.obs;

      if(isSuccessStatus.value) {
        log("deleteCartModel isSuccessStatus : $isSuccessStatus");

        /// Remove Cart Details From Prefs Storage & Local Variable
        await sharedPreferenceData.deleteUserCartDetails();

        await getUserCartDetailsByIdFunction();
      } else {
       log("deleteCartItemByIdFunction Else Else");
      }

    } catch(e){
      log("deleteCartItemByIdFunction Error ::: $e");
    } finally {
      // isLoading(false);
    }
  }


  /// Delete Cart Item
  deleteCartItemByIdFunction({required String cartItemId}) async {
    isLoading(true);
    String url = ApiUrl.DeleteCartItemApi;
    log("Delete Cart Item API URL : $url");

    try {
      Map<String, dynamic> data = {"CartItemId" : "$cartItemId"};
      log("Delete Cart Item Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      DeleteCartItemModel deleteCartItemModel = DeleteCartItemModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteCartItemModel.status.obs;

      if(isSuccessStatus.value) {
        log("deleteCartItemModel isSuccessStatus : $isSuccessStatus");

        /// Get Updated User Cart
        await getUserCartDetailsByIdFunction();
      } else {
        log("deleteCartItemByIdFunction Else Else");
      }

    } catch(e) {
      log("deleteCartItemByIdFunction Error :: $e");
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