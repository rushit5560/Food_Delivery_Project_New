import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:get/get.dart';

import '../../models/my_wishlist_model/delete_wishlist_food_model.dart';
import '../../models/my_wishlist_model/get_wishlist_food_model.dart';

class MyWishListScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<WishListElement> wishList = [];

 getWishlistFoodFunction() async {
   isLoading(true);
   String url = ApiUrl.GetWishlistFoodApi + "${UserDetails.userId}";
   log("Get Wishlist Food API URL : $url");

   try {
     http.Response response = await http.get(Uri.parse(url));
      log("Get Wishlist Food Response : ${response.body}");

     GetWishlistFoodModel getWishlistFoodModel = GetWishlistFoodModel.fromJson(json.decode(response.body));
     isSuccessStatus = getWishlistFoodModel.status.obs;
     log("isSuccessStatus :: $isSuccessStatus");

     if(isSuccessStatus.value) {
       wishList.clear();
       wishList = getWishlistFoodModel.list;
       log("Get Wishlist Length : ${wishList.length}");
     } else {
       log("getWishlistFoodFunction Else Else");
     }

   } catch(e) {
     log("getWishlistFoodFunction Error ::: $e");
   } finally {
     isLoading(false);
   }
 }

 deleteFoodFromWishlistFunction({required String foodId}) async {
   isLoading(true);
   String url = ApiUrl.DeleteWishlistFoodApi + foodId;
   log("Delete Wishlist Food API URL : $url");

   try {
     http.Response response = await http.post(Uri.parse(url));
     log("Delete Food From Cart Response : ${response.body}");

     DeleteWishlistFoodModel deleteWishlistFoodModel = DeleteWishlistFoodModel.fromJson(json.decode(response.body));
     isSuccessStatus = deleteWishlistFoodModel.status.obs;
     
     if(isSuccessStatus.value) {
       Fluttertoast.showToast(msg: "${deleteWishlistFoodModel.message}");
     } else {
       log("deleteFoodFromWishlistFunction Else Else");
     }
     

   } catch(e) {
     log("deleteFoodFromWishlistFunction Error ::: $e");
   } finally {
     // isLoading(false);
     await getWishlistFoodFunction();
   }
 }


  @override
  void onInit() {
    getWishlistFoodFunction();
    super.onInit();
  }


}