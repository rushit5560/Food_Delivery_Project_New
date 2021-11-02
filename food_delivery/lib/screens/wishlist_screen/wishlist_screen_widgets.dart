import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/controllers/my_wishlist_screen_controller/my_wishlist_screen_controller.dart';
import 'package:get/get.dart';

class WishList extends StatelessWidget {
  MyWishListScreenController wishListScreenController;

  WishList({required this.wishListScreenController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: wishListScreenController.wishList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colorGrey),
              child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Image.asset(
                                wishListScreenController.wishList[index].img)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: Get.height / 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  wishListScreenController.wishList[index].name,
                                  style: TextStyle(
                                      color: AppColors.colorDarkPink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        wishListScreenController
                                            .wishList[index].price,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Type - " +
                                                wishListScreenController
                                                    .wishList[index].type,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Qty - " +
                                                wishListScreenController
                                                    .wishList[index].qty,
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