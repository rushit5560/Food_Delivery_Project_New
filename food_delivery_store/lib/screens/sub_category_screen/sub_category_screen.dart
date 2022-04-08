import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/sub_category_screen_controller/sub_category_screen_controller.dart';
import 'sub_category_screen_widgets.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({Key? key}) : super(key: key);
  final subCategoryScreenController = Get.put(SubCategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Sub Category"),

      body: Obx(
        () => subCategoryScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AddSubCategoryModule(),
                  ),
                  const Divider(thickness: 1),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SubCategoryListModule(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
