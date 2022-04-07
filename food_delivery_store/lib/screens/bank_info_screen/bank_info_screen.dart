import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/bank_info_screen_controller/bank_info_screen_controller.dart';
import 'bank_info_screen_widgets.dart';

class BankInfoScreen extends StatelessWidget {
  BankInfoScreen({Key? key}) : super(key: key);
  final bankInfoScreenController = Get.put(BankInfoScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: "Bank Info"),

      body: Obx(
        () => bankInfoScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BankDetailsFormModule(),
                    const SizedBox(height: 20),
                    EditBankInfoButton(),
                  ],
                ),
              ),
      ),
    );
  }
}
