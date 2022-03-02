import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/product_detail_screen_controller/product_detail_screen_controller.dart';
import 'package:food_delivery/screens/product_detail_screen/product_details_screen_widgets.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final productDetailScreenController =
      Get.put(ProductDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: productDetailScreenController.isLoading.value
            ? commonAppBarModule(title: '')
            : commonAppBarModule(title: '${productDetailScreenController.productName}'),
        bottomNavigationBar: productDetailScreenController.isLoading.value
            ? Container()
            : AddButton(),
        body: productDetailScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [ProductImage(), ProductDetails()],
                ),
              ),
      ),
    );
  }
}
