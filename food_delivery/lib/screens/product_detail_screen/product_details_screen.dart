import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
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



  Widget _extra() {
    return Stack(
      //alignment: Alignment.bottomCenter,
      children: [
        Container(
          //height: Get.height * 0.30,
          //width: Get.width,
          child: Image.asset(
            Images.ic_category3,
            fit: BoxFit.cover,
          ),
        ),
        // Container(
        //   width: Get.width,
        //   //height: Get.height /2,
        //   margin: EdgeInsets.only(left: 15, right: 15),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
        //           topRight: Radius.circular(10)),
        //       color: Colors.black
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text("Burger", style: TextStyle(
        //         color: AppColors.colorDarkPink
        //       ),),
        //       Row(
        //         children: [
        //           Text("\$150.00", style: TextStyle(
        //               color: AppColors.colorDarkPink
        //           ),),
        //
        //            Row(
        //             children: [
        //               _decrementButton(),
        //               _itemQty(),
        //               _incrementButton(),
        //             ],
        //           ),
        //         ],
        //
        //       )
        //
        //     ],
        //   ),
        // )

        /*Container(
             margin: EdgeInsets.only(top: 100,left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              color: Colors.white
            ),
            child: Column(
              children: [
                Container(
                  child: Text("Burger"),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Text("\$150.00"),
                      ),
                      Row(
                        children: [

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),*/
      ],
    );
  }
}
