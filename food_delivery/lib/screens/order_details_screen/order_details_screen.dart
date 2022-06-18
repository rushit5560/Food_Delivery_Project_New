import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/order_details_screen_controller/order_details_screen_controller.dart';
import 'package:food_delivery/screens/order_details_screen/order_details_screen_widgets.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);
  OrderDetailsScreenController orderDetailsScreenController = Get.put(OrderDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Order Details'),

      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            OrderDetailsImage(),
            OrderDetails()
          ],
        ),
      ),
    );
  }
}
