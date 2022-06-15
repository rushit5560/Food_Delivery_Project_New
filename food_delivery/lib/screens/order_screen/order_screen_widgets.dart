import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/account_screen_controller/order_screen_controller.dart';
import 'package:food_delivery/screens/order_detail_screen/order_detail_screen.dart';
import 'package:get/get.dart';

import '../../common/constant/app_images.dart';

class AllOrderListModule extends StatelessWidget {
  final orderScreenController = Get.find<OrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: orderScreenController.userOrderList.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(()=> OrderDetailScreen());
            },
            child: Container(
              height: Get.height * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          _orderItemImageModule(index),
                          SizedBox(width: 10),
                          Expanded(
                            child: _orderItemNameModule(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _orderItemAmountAndStatusModule(index),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _orderItemImageModule(int index) {
    return Container(
      height: Get.height * 0.09,
      width: Get.height * 0.09,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Center(
          child: Image(
            image: NetworkImage(ApiUrl.ApiMainPath + orderScreenController.userOrderList[index].restaurantId.image),
          ),
        ),
      ),
    );
  }

  Widget _orderItemNameModule(int index) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  // Hot Dog Text Module
                  Expanded(
                    flex: 7,
                    child: Text(
                      '${orderScreenController.userOrderList[index].details}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorDarkPink,
                          fontSize: Get.height * 0.025,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  // Qty Module
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${orderScreenController.userOrderList[index].quantity} Items',
                      textScaleFactor: 0.9,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // Date And Time Module
                Text(
                  '${orderScreenController.userOrderList[index].orderDate.day} ${orderScreenController.userOrderList[index].orderDate.month}, ${orderScreenController.userOrderList[index].orderDate.hour}:${orderScreenController.userOrderList[index].orderDate.minute}',
                  textScaleFactor: 0.8,
                ),
                SizedBox(width: 10),
                // Order Id Module
                Expanded(
                  child: Text(
                    'Order ID ${orderScreenController.userOrderList[index].id}',
                    maxLines: 1,
                    textScaleFactor: 0.8,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 8),
            // Text(
            //   'Payment Method - ${orderScreenController.userOrderList[index].orderType}',
            //   textScaleFactor: 0.8,
            // ),
          ],
        ),
      ),
    );
  }

  Widget _orderItemAmountAndStatusModule(int index) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '\$${orderScreenController.userOrderList[index].amount}',
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: AppColors.colorDarkPink,
            //   ),
            //   child: Center(
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            //       child: Text(
            //         '${orderScreenController.userOrderList[index].orderType}',
            //         textScaleFactor: 0.9,
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
