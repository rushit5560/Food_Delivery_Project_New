import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/my_wishlist_screen_controller/my_wishlist_screen_controller.dart';
import 'package:get/get.dart';

import '../../models/my_wishlist_model/get_wishlist_food_model.dart';


class WishListModule extends StatelessWidget {
  final screenController = Get.find<MyWishListScreenController>();

  // WishList({required this.wishListScreenController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: screenController.wishList.length,
          itemBuilder: (context, index) {
            WishListElement singleItem = screenController.wishList[index];
            String imgUrl = ApiUrl.ApiMainPath + screenController.wishList[index].productId.image;
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colorGrey),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Image.network(imgUrl)),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: Get.height / 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${singleItem.productId.productName}",
                                  style: TextStyle(
                                      color: AppColors.colorDarkPink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${singleItem.productId.price}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Type - ${singleItem.productId.productType.value}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Qty - ${singleItem.productId.quantity}",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
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
            );
          }),
    );
  }
}
