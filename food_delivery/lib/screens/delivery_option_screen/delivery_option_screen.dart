import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/delivery_option_screen_controller/delivery_option_screen_controller.dart';
import 'package:get/get.dart';
import 'delivery_option_screen_widgets.dart';

class DeliveryOptionScreen extends StatelessWidget {
  DeliveryOptionScreenController deliveryOptionScreenController
  = Get.put(DeliveryOptionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Delivery Option'),
      body: Column(
        children: [
          DeliveryAddressDetails(),
          TableCalender(),
          Expanded(
              child: SelectTimeModule(),
          ),
        ],
      ),
    );
  }

}


