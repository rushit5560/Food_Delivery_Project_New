import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/common_widgets.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../controllers/order_statuswise_screen_controller/order_statuswise_screen_controller.dart';
import 'order_statuswise_screen_widgets.dart';

class OrderStatusWiseScreen extends StatelessWidget {
  OrderStatusWiseScreen({Key? key}) : super(key: key);
  final orderStatusWiseScreenController =
      Get.put(OrderStatusWiseScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Orders"),
      body: Obx(
        () => orderStatusWiseScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  StatusTabsModule().commonAllSidePadding(padding: 10),
                  const SizedBox(height: 15),
                  StatusWiseListModule(),
                ],
              ),
      ),
    );
  }
}
