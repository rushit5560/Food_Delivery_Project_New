import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../controllers/items_screen_controller/items_screen_controller.dart';
import 'update_item_screen_widgets.dart';

class UpdateItemScreen extends StatelessWidget {
  final String productId;
  UpdateItemScreen({Key? key, required this.productId}) : super(key: key);
  final screenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: "Update Product"),

      body: Obx(
        ()=> screenController.isLoading.value
        ? CustomCircularProgressIndicator()
        : SingleChildScrollView(
          child: Form(
            key: screenController.updateItemFormKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  UpdateProductImageModule(),
                  const SizedBox(height: 10),

                  UpdateProductNameFieldModule(),
                  const SizedBox(height: 10),

                  UpdateProductDescriptionFieldModule(),
                  const SizedBox(height: 10),

                  FoodTypeDropDownModule(),
                  const SizedBox(height: 10),

                  UpdateCategoryDropDownModule(),
                  const SizedBox(height: 10),

                  UpdateSubCategoryDropDownModule(),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(child: UpdateProductPriceFieldModule()),
                      const SizedBox(width: 15),
                      Expanded(child: UpdateProductMrpFieldModule()),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(child: DiscountTypeDropDownModule()),
                      const SizedBox(width: 15),
                      Expanded(child: UpdateProductDiscountFieldModule()),
                    ],
                  ),
                  const SizedBox(height: 10),

                  UpdateProductQtyFieldModule(),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(child: UpdateStartTimeModule()),
                      const SizedBox(width: 15),
                      Expanded(child: UpdateEndTimeModule()),
                    ],
                  ),
                  const SizedBox(height: 20),

                  UpdateProductButtonModule(productId: productId),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
