import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import 'extra_screen_controller.dart';

class ExtraScreen extends StatelessWidget {
  ExtraScreen({Key? key}) : super(key: key);
  final extraScreenController = Get.put(ExtraScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => extraScreenController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: MultiSelectDialogField(
                        items: extraScreenController.attributeDropDownData,
                        title: Text(
                          "Select Attribute",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        selectedColor: AppColors.colorDarkPink,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade200,
                        ),
                        buttonIcon: Icon(Icons.arrow_drop_down_outlined),
                        onConfirm: (result) {},
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
