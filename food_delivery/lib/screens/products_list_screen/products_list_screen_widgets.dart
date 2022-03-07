import 'package:flutter/material.dart';
import 'package:food_delivery/screens/product_detail_screen/product_details_screen.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import '../../common/constant/app_images.dart';
import '../../controllers/products_list_screen_controller/products_list_screen_controller.dart';
import '../../models/products_list_screen_model/get_all_products_model.dart';
import '../../models/products_list_screen_model/get_products_by_cat_id_model.dart';

class AllProductsListModule extends StatelessWidget {
  AllProductsListModule({Key? key}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsListScreenController.allProductList.length,
      itemBuilder: (context, i) {
        GetAllProductList singleProduct = productsListScreenController.allProductList[i];
        return AllProductsListTile(singleProduct: singleProduct);
      },
    );
  }
}

class AllProductsListTile extends StatelessWidget {
  final GetAllProductList singleProduct;
  AllProductsListTile({Key? key, required this.singleProduct}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Product Id : ${singleProduct.sId}');
        Get.to(()=> ProductDetailScreen(), arguments: singleProduct.sId);
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


class ProductsListByCategoryIdModule extends StatelessWidget {
  ProductsListByCategoryIdModule({Key? key}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsListScreenController.productsListByCategoryId.length,
      itemBuilder: (context, i) {
        Product product = productsListScreenController.productsListByCategoryId[i];
          return ProductsListByCategoryIdTile(product: product);
      },
    );
  }
}

class ProductsListByCategoryIdTile extends StatelessWidget {
  final Product product;
  ProductsListByCategoryIdTile({Key? key, required this.product}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Product Id : ${product.id}');
        Get.to(()=> ProductDetailScreen(), arguments: product.id);
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
                            "${product.productName}",
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
                                "${product.description}",
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
                                "\$${product.price}",
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
