import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/order_screen_controller/order_screen_controller.dart';
import 'package:get/get.dart';

import 'order_screen_widgets.dart';

class OrderScreen extends StatelessWidget {
  OrderScreenController orderScreenController = Get.put(OrderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: 'My Orders'),

      body: Padding(
        padding: const EdgeInsets.all(5),
        child: AllOrderListModule(orderScreenController: orderScreenController),
      ),
    );
  }


}
