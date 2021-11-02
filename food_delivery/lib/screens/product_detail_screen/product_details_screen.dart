import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/product_detail_screen_controller/product_detail_screen_controller.dart';
import 'package:food_delivery/screens/product_detail_screen/product_detail_screen_widgets.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailScreenController productDetailScreenController =
      Get.put(ProductDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Burger'),
      bottomNavigationBar: AddButton(),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ProductImage(),
            ProductDetails()

          ],
        ),
      ),
    );
  }

}
