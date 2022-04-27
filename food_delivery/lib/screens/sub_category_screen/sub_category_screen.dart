import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../common/custom_appbar.dart';
import '../../controllers/sub_category_screen_controller/sub_category_screen_controller.dart';
import 'sub_category_screen_widgets.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({Key? key}) : super(key: key);
  final subCategoryScreenController = Get.put(SubCategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Sub Category'),
      body: Column(
        children: [
          SubCategorySearchFieldModule().commonAllSidePadding(padding: 8),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(
              () => subCategoryScreenController.isLoading.value
                  ? CustomCircularProgressIndicator()
                  : subCategoryScreenController.searchSubCategoryList.isNotEmpty
                      ? SearchSubCategoryListModule().commonAllSidePadding(padding: 8)
                      : SubCategoryListModule().commonAllSidePadding(padding: 8),
            ),
          ),
        ],
      ),
    );
  }
}
