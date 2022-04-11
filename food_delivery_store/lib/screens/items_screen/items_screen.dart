import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:food_delivery_admin/screens/add_product_screen/add_product_screen.dart';
import 'package:get/get.dart';

import '../../controllers/items_screen_controller/items_screen_controller.dart';
import 'items_screen_widgets.dart';

class ItemsScreen extends StatelessWidget {
  final itemScreenController = Get.put(ItemScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Items'),

      body: Obx(
        ()=>  itemScreenController.isLoading.value ?
        CustomCircularProgressIndicator():
        Column(
          children: [
            const SizedBox(height: 20),
            MainTabsModule(),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                child: itemScreenController.isStoreProductsSelected.value
                    ? StoreProductsModule()
                    : AdminProductsModule(),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: () {
          if(itemScreenController.isStoreProductsSelected.value){
            Get.to(()=> AddProductScreen());
          } else if(itemScreenController.isAdminProductsSelected.value) {
            print('DEF');
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorDarkPink,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }

}
