import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/my_wishlist_screen_controller/my_wishlist_screen_controller.dart';
import 'package:get/get.dart';

import 'wishlist_screen_widgets.dart';

class WishListScreen extends StatelessWidget {
   WishListScreen({Key? key}) : super(key: key);

  MyWishListScreenController wishListScreenController = Get.put(MyWishListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Wishlist', index: 2),

      body: Container(
        //height: Get.height,
        child: WishList(wishListScreenController: wishListScreenController,),
      ),
    );
  }
}
