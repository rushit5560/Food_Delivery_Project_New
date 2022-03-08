import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/common_widgets.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/screens/today_order_screen/today_order_screen_widgets.dart';
import 'package:get/get.dart';

import '../../controllrs/today_order_screen_controller/today_order_screen_controller.dart';

class TodayOrderScreen extends StatelessWidget {
  TodayOrderScreen({Key? key}) : super(key: key);
  final todayOrderScreenController = Get.put(TodayOrderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Today Order'),

      body: Obx(()=>
          todayOrderScreenController.isLoading.value
          ? CustomCircularProgressIndicator()
          : todayOrderScreenController.allOrderList.isEmpty
          ? Center(child: Text(''))
          : TodayOrderListModule()),
    );
  }
}



