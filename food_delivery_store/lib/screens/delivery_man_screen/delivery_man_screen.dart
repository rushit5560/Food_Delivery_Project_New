import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/delivery_man_screen_controller/delivery_man_screen_controller.dart';
import 'delivery_man_screen_widgets.dart';

class DeliveryManScreen extends StatelessWidget {
  DeliveryManScreen({Key? key}) : super(key: key);
  final deliveryManScreenController = Get.put(DeliveryManScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "DeliveryMan"),
      body: Obx(
        () => deliveryManScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DeliveryManListModule(),
                  ),
                  AddDeliveryManButtonModule(),
                ],
              ),
      ),
    );
  }
}
