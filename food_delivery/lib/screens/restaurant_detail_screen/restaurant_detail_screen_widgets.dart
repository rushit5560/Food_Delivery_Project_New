import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/controllers/restaurant_details_screen_controller/restaurant_details_screen_controller.dart';
import 'package:food_delivery/screens/product_detail_screen/product_details_screen.dart';
import 'package:get/get.dart';


class AddButton extends StatelessWidget {
  AddButton({Key? key}) : super(key: key);
  //final productDetailScreenController = Get.find<ProductDetailScreenController>();
  //final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // log("productDetailScreenController.productRestaurantId : ${productDetailScreenController.productRestaurantId}");
        // log("UserCartDetails.userCartRestaurantId : ${UserCartDetails.userCartRestaurantId}");
        //
        // if(productDetailScreenController.productRestaurantId == UserCartDetails.userCartRestaurantId) {
        //   await productDetailScreenController.addUserCartItemFunction();
        // } else if(UserCartDetails.userCartRestaurantId == "") {
        //   await productDetailScreenController.addUserCartItemFunction();
        // } else {
        //   showUpdateCartDialog(context);
        // }

        // if(productDetailScreenController.productRestaurantId != UserCartDetails.userCartRestaurantId) {
        //   if(UserCartDetails.userCartRestaurantId == "") {
        //     await productDetailScreenController.addUserCartItemFunction();
        //   } else {
        //     showUpdateCartDialog(context);
        //   }
        // }
        // else {
        //   await productDetailScreenController.addUserCartItemFunction();
        // }


      },
      child: Container(
        height: 60,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(15),
                topLeft: Radius.circular(15)),
            color: AppColors.colorDarkPink
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Obx(
                  //()=>
                      Container(
                child: Text("\$productDetailScreenController.subTotalAmount.value", style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold
                ),),
              ),
           // ),
            Container(
              height: 40,width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add",
                    style: TextStyle(
                      color: AppColors.colorDarkPink,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.add, color: AppColors.colorDarkPink),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }

  showUpdateCartDialog(BuildContext context) {

    Widget noButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.colorLightPink,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "No",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.colorDarkPink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget replaceButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () async {
            /// First Delete Old Cart & Create New Cart
            Get.back();
            // await cartScreenController.deleteCartByIdFunction();
            // awaitwait productDetailScreenController.addUserCartItemFunction();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.colorDarkPink,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Replace",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.colorLightPink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Replace cart item ?",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      content: Text("You have food from another restaurant in cart. If you continue, your all previous food from cart will be removed."),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: [
        // okButton,
        Row(
          children: [
            Expanded(child: noButton()),
            Expanded(child: replaceButton()),
          ],
        ),
      ],
    );


    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

class RestaurantImage extends StatelessWidget {
  RestaurantImage({Key? key}) : super(key: key);

  final screenController = Get.find<RestaurantDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    log('screenController.restaurantImage : ${screenController.restaurantImage}');
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
              screenController.restaurantImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantDetails extends StatelessWidget {
  RestaurantDetails({Key? key}) : super(key: key);

  final screenController = Get.find<RestaurantDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: Get.height * 0.50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)),
        ),
        child: Transform(
          transform: Matrix4.translationValues(0, -1, 0),
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 15),
                //       child: CircleAvatar(
                //         radius: 25,
                //         backgroundColor: AppColors.colorDarkPink,
                //         child: GestureDetector(
                //           onTap: () async {
                //             // log("Click");
                //             // await productDetailScreenController.
                //             // addFoodInWishlistFunction(
                //             //     productId: "${productDetailScreenController.productId}",
                //             //     restaurantId: "${productDetailScreenController.productRestaurantId}"
                //             // );
                //           },
                //           child: Image.asset(
                //             Images.ic_wishlist,
                //             scale: 2,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  screenController.restaurantName,
                  style: TextStyle(
                      color: AppColors.colorDarkPink,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Container(
                      height: 35, width: Get.width/5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorDarkPink
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(screenController.restaurantRating.toString(), style: TextStyle(color: Colors.white, fontSize: 18),),
                          SizedBox(width: 5,),
                          Icon(Icons.star, color: Colors.white,)
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Rating",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),

                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      glow: false,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        //productDetailScreenController.giveProductReview(rating);
                      },
                    )
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  children: [
                    Icon(Icons.alarm),
                    SizedBox(width: 10),
                    Text(
                      "${screenController.minDeliveryTime}-${screenController.maxDeliveryTime} min",
                      style: TextStyle(
                        color: Colors.black,fontSize: 17
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(child: ProductList())

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _decrementButton() {
    return GestureDetector(
      //onTap: () => productDetailScreenController.onClickedDec(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Center(
            child: Icon(Icons.remove, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }

  Widget _incrementButton() {
    return GestureDetector(
      //onTap: () => productDetailScreenController.onClickedInc(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Center(
            child: Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }

  Widget _itemQty() {
    return /*Obx(
          () => */Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          'productDetailScreenController.qty',
          textScaleFactor: 1.1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
     // ),
    );
  }
}

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.productList.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        //GetAllProductList singleProduct = productsListScreenController.allProductList[i];
        return allProductsListTile(i);
      },
    );
  }

  allProductsListTile(i){
    return GestureDetector(
      onTap: () {
        print('Product Id : ${screenController.productList[i].id}');
        Get.to(()=> ProductDetailScreen(), arguments: screenController.productList[i].id);
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
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(ApiUrl.ApiMainPath + screenController.productList[i].image),
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
                              screenController.productList[i].productName,
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
                                  screenController.productList[i].description,
                                  maxLines: 1,
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              screenController.productList[i].price.toString(),
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                              child: Text(
                                "Qty - ${screenController.productList[i].quantity}gms",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
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
