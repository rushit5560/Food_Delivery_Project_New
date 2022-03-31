import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:food_delivery_admin/common/custom_drawer/custom_drawer.dart';
import 'package:get/get.dart';

import '../../controllers/new_order_screen_controller/new_order_screen_controller.dart';
import 'new_order_screen_widgets.dart';


class NewOrderScreen extends StatelessWidget {
  // const NewOrderScreen({Key? key}) : super(key: key);
  NewOrderScreenController newOrderScreenController = Get.put(NewOrderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'New Order', index: 1),

      // CustomDrawer Import From custom_drawer File
      drawer: CustomDrawer(),

      body: Obx(
        ()=> newOrderScreenController.isLoading.value ?
        CustomCircularProgressIndicator():
            Column(
          children: [
            const SizedBox(height: 20),
            TabsModule(),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                child: newOrderScreenController.isTodayOrderSelected.value
                       ? TodayOrdersModule() : NewOrderModule(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
