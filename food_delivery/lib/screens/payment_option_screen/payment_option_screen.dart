import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/payment_option_screen_controller/payment_option_screen_controller.dart';
import 'package:get/get.dart';

import 'payment_option_screen_widgets.dart';

class PaymentOptionScreen extends StatelessWidget {
  // const PaymentOptionScreen({Key? key}) : super(key: key);
  PaymentOptionScreenController paymentOptionScreenController
  = Get.put(PaymentOptionScreenController());

  TextEditingController promoCodeFieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(

        appBar: commonAppBarModule(title: 'Payment Option'),

        body: SingleChildScrollView(
          child: Column(
            children: [
              OfferCodesModule(),
              CustomDivider(),
              PromoCodeTextField(promoCodeFieldText: promoCodeFieldText),
              CustomDivider(),
              PaymentMethod(),
            ],
          ),
        ),
      ),
    );
  }



}
