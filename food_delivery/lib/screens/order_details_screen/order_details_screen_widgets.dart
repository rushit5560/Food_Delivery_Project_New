import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/controllers/order_details_screen_controller/order_details_screen_controller.dart';
import 'package:food_delivery/screens/my_orders_tab_screen/my_orders_tab_screen.dart';
import 'package:get/get.dart';

class OrderDetailsImage extends StatelessWidget {
  OrderDetailsImage({Key? key}) : super(key: key);
  final screenController = Get.find<OrderDetailsScreenController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
              screenController.orderImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  OrderDetails({Key? key}) : super(key: key);

  final screenController = Get.find<OrderDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: Get.height * 0.50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)),
        ),
        child: Transform(
          transform: Matrix4.translationValues(0, -1, 0),
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 15),
                //       child: CircleAvatar(
                //         radius: 25,
                //         backgroundColor: AppColors.colorDarkPink,
                //         child: GestureDetector(
                //           onTap: () async {
                //             // log("Click");
                //             // await productDetailScreenController.
                //             // addFoodInWishlistFunction(
                //             //     productId: "${productDetailScreenController.productId}",
                //             //     restaurantId: "${productDetailScreenController.productRestaurantId}"
                //             // );
                //           },
                //           child: Image.asset(
                //             Images.ic_wishlist,
                //             scale: 2,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  screenController.orderDetail,
                  style: TextStyle(
                      color: AppColors.colorDarkPink,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 15),

                Text("Order Id: ${screenController.orderId1}"),

                SizedBox(height: 10),

                Text("Order Date: ${screenController.orderDate}"),

                SizedBox(height: 15),

                GestureDetector(
                  onTap: (){
                    log('screenController.orderId: ${screenController.orderId}');
                    Get.to(() => MyOrdersTabScreen(), arguments: screenController.orderId);
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorDarkPink),
                    child: Center(
                      child: Text(
                        "Track Order",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                //Expanded(child: ProductList())

              ],
            ),
          ),
        ),
      ),
    );
  }
}

