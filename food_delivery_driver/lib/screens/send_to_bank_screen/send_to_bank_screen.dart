import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/common_functions.dart';
import 'package:food_delivery_driver/common/common_widgets.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:get/get.dart';
import '../../controllers/send_to_bank_screen_controller/send_to_bank_screen_controller.dart';
import 'send_to_bank_screen_widgets.dart';

class SendToBankScreen extends StatelessWidget {
  final sendToBankScreenController = Get.put(SendToBankScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        appBar: commonAppBarModule(title: 'Send To Bank'),
        body: Obx(
          () => sendToBankScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      AvailableBalanceModule(),
                      BankInfo(),
                      BankDetailsForm(),
                      const SizedBox(height: 20),
                      SendToBankButton(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
