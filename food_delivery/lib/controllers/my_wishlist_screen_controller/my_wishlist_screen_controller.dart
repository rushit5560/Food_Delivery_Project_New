import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:food_delivery/models/my_wishlist_model/wishlist_model.dart';
import 'package:get/get.dart';

import '../../models/my_wishlist_model/get_wishlist_food_model.dart';

class MyWishListScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  // List<WishListModel> wishList = [];
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

  // getWishList(){
  //   wishList.add(
  //     WishListModel(
  //         img: Images.ic_category6,
  //         name: 'Hot Dog',
  //         price: '\$150.00',
  //         qty: '150 gms',
  //         type: 'Regular'
  //     ),
  //   );
  //   wishList.add(
  //     WishListModel(
  //         img: Images.ic_category4,
  //         name: 'SandWich',
  //         price: '\$150.00',
  //         qty: '150 gms',
  //         type: 'Regular'
  //     ),
  //   );
  //   wishList.add(
  //     WishListModel(
  //         img: Images.ic_category3,
  //         name: 'Burger',
  //         price: '\$150.00',
  //         qty: '150 gms',
  //         type: 'Regular'
  //     ),
  //   );
  //   wishList.add(
  //     WishListModel(
  //         img: Images.ic_category5,
  //         name: 'Pizza',
  //         price: '\$150.00',
  //         qty: '150 gms',
  //         type: 'Regular'
  //     ),
  //   );
  //   wishList.add(
  //     WishListModel(
  //         img: Images.ic_category1,
  //         name: 'Burger',
  //         price: '\$150.00',
  //         qty: '150 gms',
  //         type: 'Regular'
  //     ),
  //   );
  //   wishList.add(
  //     WishListModel(
  //         img: Images.ic_category1,
  //         name: 'Burger',
  //         price: '\$150.00',
  //         qty: '150 gms',
  //         type: 'Regular'
  //     ),
  //   );
  // }


  @override
  void onInit() {
    getWishlistFoodFunction();
    super.onInit();
  }


}