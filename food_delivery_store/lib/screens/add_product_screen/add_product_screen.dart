import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:food_delivery_admin/controllrs/add_product_screen_controller/add_product_screen_controller.dart';
import 'package:food_delivery_admin/screens/add_product_screen/add_product_screen_widgets.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
   AddProductScreen({Key? key}) : super(key: key);

   AddProductScreenController addProductScreenController = Get.put(AddProductScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBarModule(title: 'Add Product'),

      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                width: Get.width,
                //height: Get.height,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Form(
                  key: addProductScreenController.productFormKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      ProductImage(),
                      SizedBox(height: 20,),
                      ItemInfoTextField(),

                      SizedBox(height: 20,),
                      ItemCategoryTextField(),

                      SizedBox(height: 20,),
                      ItemDescriptionTextField(),

                      SizedBox(height: 20,),
                      ItemPriceTextField(),

                      SizedBox(height: 20,),
                      ItemQtyTextField(),

                      SizedBox(height: 20,),
                      EANTextField(),

                      SizedBox(height: 20,),
                      TagTextField(),


                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),
              AddProductButton(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
