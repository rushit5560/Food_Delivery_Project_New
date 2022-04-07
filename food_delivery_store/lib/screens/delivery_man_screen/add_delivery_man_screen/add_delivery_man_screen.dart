import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../controllers/delivery_man_screen_controller/delivery_man_screen_controller.dart';
import 'add_delivery_man_screen_widgets.dart';

class AddDeliveryManScreen extends StatelessWidget {
  AddDeliveryManScreen({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Add Delivery Man"),

      body: Obx(
        () => screenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: screenController.addDeliveryBoyFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DeliveryBoyImageModule(),
                        const SizedBox(height: 10),
                        FirstNameFieldModule(),
                        const SizedBox(height: 10),
                        LastNameFieldModule(),
                        const SizedBox(height: 10),
                        EmailFieldModule(),
                        const SizedBox(height: 10),
                        AddressFieldModule(),
                        const SizedBox(height: 10),
                        PhoneFieldModule(),
                        const SizedBox(height: 10),
                        PasswordFieldModule(),
                        const SizedBox(height: 10),
                        IdentityTypeDropDownModule(),
                        const SizedBox(height: 10),
                        IdentityNumberFieldModule(),
                        const SizedBox(height: 10),
                        IdentityImageModule(),
                        const SizedBox(height: 10),
                        AllZoneDropDownModule(),
                        const SizedBox(height: 20),
                        SubmitButtonModule(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
