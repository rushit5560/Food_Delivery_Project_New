import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/addon_screen_controller/addon_screen_controller.dart';
import 'addon_screen_widgets.dart';

class AddonScreen extends StatelessWidget {
  AddonScreen({Key? key}) : super(key: key);
  final addonScreenController = Get.put(AddonScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Addons"),
      body: Obx(
        () => addonScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AddAddonsModule(),
                  ),
                  Divider(thickness: 1),
                  Expanded(child: AllAddonListModule()),
                ],
              ),
      ),
    );
  }
}
