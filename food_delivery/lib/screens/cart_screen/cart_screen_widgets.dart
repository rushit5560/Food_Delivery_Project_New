import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import '../../common/constant/app_colors.dart';
import '../../common/constant/app_images.dart';
import '../../controllers/cart_screen_controller/cart_screen_controller.dart';
import '../../models/cart_models/get_user_cart_model.dart';


class SavingModule extends StatelessWidget {
  const SavingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('${Images.ic_piggy_bank}',scale: 2),

              SizedBox(width: 15),
              Expanded(
                child: Text(
                  'You are Saving Rs 10.00 with this purchase',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CartItemsList extends StatelessWidget {
  final screenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: screenController.cartItemsList.length,
      itemBuilder: (context, index){

        CartItem singleItem = screenController.cartItemsList[index];
        String imgUrl = ApiUrl.ApiMainPath + singleItem.productId.image;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      _imageModule(imgUrl),
                      SizedBox(width: 10),
                      _nameModule(singleItem),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      _decrementButton(singleItem),
                      _itemQty(singleItem),
                      _incrementButton(singleItem),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _imageModule(String imgUrl) {
    return Image(
      height: Get.height * 0.09,
      width: Get.height * 0.09,
      image: NetworkImage('$imgUrl'),
    );
  }

  Widget _nameModule(CartItem singleItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${singleItem.productId.productName}',
          textScaleFactor: 1.2,
          style: TextStyle(
            color: AppColors.colorDarkPink,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '\$${singleItem.productId.price}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }

  Widget _decrementButton(CartItem singleItem) {
    return GestureDetector(
      onTap: () async {
        log("Before productQuantity : ${singleItem.productQuantity}");

        if(singleItem.productQuantity == 1) {

          /// if Cart List Length == 1 then Delete Full Cart
          if(screenController.cartItemsList.length == 1) {
            await screenController.deleteCartByIdFunction();
          } else {
            /// if Cart List Length != 1 then Delete Cart Item Only
            await screenController.deleteCartItemByIdFunction(cartItemId: singleItem.id);
          }

        } else {
          int itemQty = singleItem.productQuantity - 1;
          log("Cart Item Id : ${singleItem.id}");
          log("Item Qty : $itemQty");

          /// Decrease Cart Item Qty
          await screenController.updateCartItemQuantityByIdFunction(
              cartItemId: "${singleItem.id}",
              productQty: "$itemQty"
          );
        }

      },
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

  Widget _incrementButton(CartItem singleItem) {
    return GestureDetector(
      onTap: () async {
        int itemQty = singleItem.productQuantity + 1;
        log("Cart Item Id : ${singleItem.id}");
        log("Item Qty : $itemQty");

        /// Increase Cart Qty
        screenController.updateCartItemQuantityByIdFunction(
            cartItemId: "${singleItem.id}",
            productQty: "$itemQty"
        );
      },
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

  Widget _itemQty(CartItem singleItem) {
    return Obx(
          ()=> Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: screenController.isLoading.value
            ? Container()
            : Text(
          '${singleItem.productQuantity}',
          textScaleFactor: 1.1,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }


}

class ContinueModule extends StatelessWidget {
  ContinueModule({Key? key}) : super(key: key);
  final screenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkPink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Obx(
                      ()=> Text(
                        '\$ ${screenController.cartSubTotalAmount}',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'View Details',
                      textScaleFactor: 0.9,
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(()=> DeliveryOptionScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Continue',
                            textScaleFactor: 1,
                            style: TextStyle(
                              color: AppColors.colorDarkPink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.colorDarkPink,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}