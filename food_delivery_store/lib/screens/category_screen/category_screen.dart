import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';
import '../../controllers/category_screen_controller/category_screen_controller.dart';
import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Category'),

      body: Obx(
        () => categoryScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AddCategoryModule(),
                  ),
                  Divider(thickness: 1),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AllCategoryListModule(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
