import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/account_screen_controller/order_screen_controller.dart';
import 'package:get/get.dart';

import 'order_screen_widgets.dart';

class OrderScreen extends StatelessWidget {
  OrderScreenController orderScreenController =
      Get.put(OrderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Orders'),
      body: Obx(
        () => orderScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(5),
                child: orderScreenController.userOrderList.isEmpty
                    ? Center(child: Text('No Orders'))
                    : AllOrderListModule(),
              ),
      ),
    );
  }
}
