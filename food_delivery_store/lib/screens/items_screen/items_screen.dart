import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:food_delivery_admin/controllrs/items_screen_controller/items_screen_controller.dart';
import 'package:get/get.dart';

import 'items_screen_widgets.dart';

class ItemsScreen extends StatelessWidget {
  ItemScreenController itemScreenController = Get.put(ItemScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Items'),

      body: Obx(
        ()=> Column(
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
            print('Abc');
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
