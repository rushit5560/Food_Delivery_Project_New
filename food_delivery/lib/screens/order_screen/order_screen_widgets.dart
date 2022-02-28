import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/order_screen_controller/order_screen_controller.dart';
import 'package:food_delivery/screens/order_detail_screen/order_detail_screen.dart';
import 'package:get/get.dart';

class AllOrderListModule extends StatelessWidget {
  OrderScreenController orderScreenController = Get.find<OrderScreenController>();
  // AllOrderListModule({required this.orderScreenController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: orderScreenController.orderList.length,
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
                          _orderItemNameModule(index),
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
            image: AssetImage('${orderScreenController.orderList[index].itemImg}'),
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
            Row(
              children: [
                // Hot Dog Text Module
                Text(
                  '${orderScreenController.orderList[index].itemName}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorDarkPink,
                      fontSize: Get.height * 0.025
                  ),
                ),
                SizedBox(width: 20),
                // Qty Module
                Text(
                  '${orderScreenController.orderList[index].itemQty} Items',
                  textScaleFactor: 0.9,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // Date And Time Module
                Text(
                  '${orderScreenController.orderList[index].dateAndTime}',
                  textScaleFactor: 0.8,
                ),
                SizedBox(width: 10),
                // Order Id Module
                Text(
                  'Order ID ${orderScreenController.orderList[index].orderId}',
                  textScaleFactor: 0.8,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Payment Method - ${orderScreenController.orderList[index].payMethod}',
              textScaleFactor: 0.8,
            ),
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
              '\$${orderScreenController.orderList[index].itemAmount}',
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.colorDarkPink,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Text(
                    '${orderScreenController.orderList[index].orderStatus}',
                    textScaleFactor: 0.9,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
