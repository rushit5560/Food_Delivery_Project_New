import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/screens/product_detail_screen/product_details_screen.dart';
import 'package:get/get.dart';
import '../../common/constant/app_colors.dart';
import '../../controllers/products_list_screen_controller/products_list_screen_controller.dart';
import '../../models/products_list_screen_model/get_all_products_model.dart';
import '../../models/products_list_screen_model/get_product_by_sub_cat_id_model.dart';


/// All Products Module
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
    String productImage = ApiUrl.ApiMainPath + "${singleProduct.image}";
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(productImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100,
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
                                  maxLines: 1,
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
                                Text("Type - ${singleProduct.productType!.value}"),
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}


/// Sub Category Wise Product Module
class ProductsListBySubCategoryIdModule extends StatelessWidget {
  ProductsListBySubCategoryIdModule({Key? key}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsListScreenController.productsListBySubCategoryId.length,
      itemBuilder: (context, i) {
        Food product = productsListScreenController.productsListBySubCategoryId[i];
          return ProductsListBySubCategoryIdTile(product: product);
      },
    );
  }
}

class ProductsListBySubCategoryIdTile extends StatelessWidget {
  final Food product;
  ProductsListBySubCategoryIdTile({Key? key, required this.product}) : super(key: key);
  final productsListScreenController = Get.find<ProductsListScreenController>();

  @override
  Widget build(BuildContext context) {
    String productImage = ApiUrl.ApiMainPath + "${product.image}";
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
                  Expanded(flex: 2, child: Image.network(productImage)),
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
                              Text("Type - ${product.productType.value}"),
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
