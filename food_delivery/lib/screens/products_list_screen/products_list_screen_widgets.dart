import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import '../../common/constant/app_images.dart';
import '../../controllers/products_list_screen_controller/products_list_screen_controller.dart';
import '../../models/products_list_screen_model/get_all_products_model.dart';

class AllProductsListModule extends StatelessWidget {
  AllProductsListModule({Key? key}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsListScreenController.allProductList.length,
      itemBuilder: (context, i) {
        GetList singleProduct = productsListScreenController.allProductList[i];
        return AllProductsListTile(singleProduct: singleProduct);
      },
    );
  }
}

class AllProductsListTile extends StatelessWidget {
  final GetList singleProduct;
  AllProductsListTile({Key? key, required this.singleProduct}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Product Id : ${singleProduct.id}');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(flex: 2, child: Image.asset(Images.ic_category1)),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: Get.height / 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${singleProduct.productName}",
                            maxLines: 1,
                            style: TextStyle(
                                color: AppColors.colorDarkPink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            child: Flexible(
                              child: Text(
                                "${singleProduct.description}",
                                maxLines: 2,
                                style:
                                    TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${singleProduct.price}",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              Text("Type - Regular"),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Qty - 150gms",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.colorDarkPink,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
