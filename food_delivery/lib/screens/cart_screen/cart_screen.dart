import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';
import '../../controllers/cart_screen_controller/cart_screen_controller.dart';
import 'cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Basket'),
      body: Obx(
        () => cartScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : cartScreenController.cartItemsList.isEmpty
                ? Center(
                    child: Text(
                      "Your cart is Empty",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorDarkPink,
                          fontSize: 17),
                    ),
                  )
                : Column(
                    children: [
                      SavingModule(),
                      ContinueModule(),
                      Expanded(
                        child: CartItemsList(),
                      ),
                    ],
                  ),
      ),
    );
  }
}