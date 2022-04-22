import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/store_profile_screen_controller/store_profile_screen_controller.dart';
import 'store_profile_screen_widgets.dart';

class StoreProfileScreen extends StatelessWidget {
  StoreProfileScreen({Key? key}) : super(key: key);
  final storeProfileScreenController = Get.put(StoreProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Profile"),

      body: Obx(
          () => storeProfileScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Form(
                key: storeProfileScreenController.storeFormKey,
                child: Column(
                  children: [
                    StoreProfileModule(),
                    const SizedBox(height: 10),

                    StoreNameFieldModule(),
                    const SizedBox(height: 10),


                    Row(
                      children: [
                        Expanded(child: FirstNameFieldModule()),
                        const SizedBox(width: 10),
                        Expanded(child: LastNameFieldModule()),
                      ],
                    ),
                    const SizedBox(height: 10),

                    AddressFieldModule(),
                    const SizedBox(height: 10),

                    // StoreGenderDropDownModule(),
                    // const SizedBox(height: 10),

                    PhoneFieldModule(),
                    const SizedBox(height: 20),


                    SubmitButtonModule(),
                    const SizedBox(height: 20),

                    ChangePassTextModule(),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
            )
          )
      ),
    );
  }
}
