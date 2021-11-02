import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/basket_screen_controller/basket_screen_controller.dart';
import 'package:get/get.dart';

import 'basket_screen_widgets.dart';

class BasketScreen extends StatelessWidget {
  BasketScreenController basketScreenController = Get.put(BasketScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: 'Basket'),

      body: Column(
        children: [
          SavingModule(),
          ContinueModule(),
          Expanded(
              child: CartItemsList(),
          ),

        ],
      ),
    );
  }
}


