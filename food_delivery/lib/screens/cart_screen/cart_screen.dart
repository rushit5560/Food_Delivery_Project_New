import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';
import '../../controllers/cart_screen_controller/cart_screen_controller.dart';
import 'cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartScreenController = Get.put(CartScreenController());

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
