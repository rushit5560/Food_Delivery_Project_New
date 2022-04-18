import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/common/constant/user_cart_details.dart';
import 'package:food_delivery/controllers/product_detail_screen_controller/product_detail_screen_controller.dart';
import 'package:get/get.dart';
import '../../controllers/cart_screen_controller/cart_screen_controller.dart';


class AddButton extends StatelessWidget {
  AddButton({Key? key}) : super(key: key);
  final productDetailScreenController = Get.find<ProductDetailScreenController>();
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        if(productDetailScreenController.productRestaurantId != UserCartDetails.userCartRestaurantId) {
          Fluttertoast.showToast(msg: "You Selected From other Restaurant!");
        } else {
          await productDetailScreenController.addUserCartItemFunction();
        }


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
            Obx(
              ()=> Container(
                child: Text("\$${productDetailScreenController.subTotalAmount.value}", style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold
                ),),
              ),
            ),
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




}

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(
              Images.ic_category3,
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

class ProductDetails extends StatelessWidget {
   ProductDetails({Key? key}) : super(key: key);

  final productDetailScreenController =
  Get.put(ProductDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: Get.height * 0.45,
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
          transform: Matrix4.translationValues(0, -28, 0),
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.colorDarkPink,
                        child: Image.asset(
                          Images.ic_wishlist,
                          scale: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${productDetailScreenController.productName}",
                  style: TextStyle(
                      color: AppColors.colorDarkPink,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${productDetailScreenController.productPrice}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        _decrementButton(),
                        _itemQty(),
                        _incrementButton(),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Type - Regular",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),

                    Text(
                      "Qty - 150gms",
                      style: TextStyle(
                          color: Colors.black,fontSize: 18
                      ),
                    ),
                    Container(width: 60,)

                  ],
                ),

                SizedBox(height: 10,),

                Text(
                  "Item Details",
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
                          Text("4.5", style: TextStyle(color: Colors.white, fontSize: 18),),
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
                        productDetailScreenController.giveProductReview(rating);
                      },
                    )
                  ],
                ),

                SizedBox(height: 10),

                Text(
                  "${productDetailScreenController.productDescription}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _decrementButton() {
    return GestureDetector(
      onTap: () => productDetailScreenController.onClickedDec(),
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
      onTap: () => productDetailScreenController.onClickedInc(),
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
    return Obx(
          () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: productDetailScreenController.isLoading.value
            ? Container()
            : Text(
          '${productDetailScreenController.qty}',
          textScaleFactor: 1.1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
