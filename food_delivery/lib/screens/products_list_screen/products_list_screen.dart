import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../common/constant/enums.dart';
import '../../common/custom_appbar.dart';
import '../../controllers/products_list_screen_controller/products_list_screen_controller.dart';
import 'products_list_screen_widgets.dart';

class ProductsListScreen extends StatelessWidget {
  ProductsListScreen({Key? key}) : super(key: key);
  final productsListScreenController = Get.put(ProductsListScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: productsListScreenController.isLoading.value
            ? commonAppBarModule(title: '')
            : commonAppBarModule(title: 'Products'),
        body: productsListScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                // child: AllProductsListModule(),
                child: productsListScreenController.productsEnum ==
                        ProductsEnum.AllProducts
                    ? productsListScreenController.allProductList.isEmpty
                        ? Center(child: Text('No Products'))
                        : AllProductsListModule()
                    : productsListScreenController
                            .productsListBySubCategoryId.isEmpty
                        ? Center(child: Text('No Products'))
                        : ProductsListBySubCategoryIdModule(),
              ),
      ),
    );
  }
}
