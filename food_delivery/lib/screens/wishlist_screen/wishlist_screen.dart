import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/my_wishlist_screen_controller/my_wishlist_screen_controller.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../common/constant/app_colors.dart';
import 'wishlist_screen_widgets.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({Key? key}) : super(key: key);

  final wishListScreenController = Get.put(MyWishListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Wishlist'/*, index: 2*/),
      body: Obx(
        () => wishListScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : wishListScreenController.wishList.length == 0
                ? Center(
                    child: Text(
                      "No Food in wishlist",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorDarkPink,
                          fontSize: 17),
                    ),
                  )
                : WishListModule(),
      ),
    );
  }
}
