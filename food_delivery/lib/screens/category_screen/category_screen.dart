import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:get/get.dart';

import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  final categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Category'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Import From Widget File
            SearchFieldModule(),
            Expanded(
              // Import From Widget File
              child: Obx(
                () => categoryScreenController.isLoading.value
                    ? CustomCircularProgressIndicator()
                    : categoryScreenController.searchCategoryList.isNotEmpty
                        ? SearchCategoryListModule()
                        : CategoryListModule(),
                //:Container()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
