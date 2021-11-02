import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/controllers/basket_screen_controller/basket_screen_controller.dart';
import 'package:food_delivery/screens/delivery_option_screen/delivery_option_screen.dart';
import 'package:food_delivery/screens/payment_option_screen/payment_option_screen.dart';
import 'package:get/get.dart';

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
  BasketScreenController basketScreenController = Get.find<BasketScreenController>();
  // CartItemsList({required this.basketScreenController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: basketScreenController.basketItemsList.length,
      itemBuilder: (context, index){
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
                      _imageModule(index),
                      SizedBox(width: 10),
                      _nameModule(index),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      _decrementButton(index),
                      _itemQty(index),
                      _incrementButton(index),
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

  Widget _imageModule(int index) {
    return Image(
      height: Get.height * 0.09,
      width: Get.height * 0.09,
      image: AssetImage('${basketScreenController.basketItemsList[index].img}'),
    );
  }

  Widget _nameModule(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${basketScreenController.basketItemsList[index].name}',
          textScaleFactor: 1.2,
          style: TextStyle(
            color: AppColors.colorDarkPink,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '\$${basketScreenController.basketItemsList[index].amount}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }

  Widget _decrementButton(int index) {
    return GestureDetector(
      onTap: () => basketScreenController.onClickedDec(index),
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

  Widget _incrementButton(int index) {
    return GestureDetector(
      onTap: () => basketScreenController.onClickedInc(index),
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

  Widget _itemQty(int index) {
    return Obx(
      ()=> Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: basketScreenController.isLoading.value
            ? Container()
            : Text(
          '${basketScreenController.basketItemsList[index].qty}',
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
  const ContinueModule({Key? key}) : super(key: key);

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
                    Text(
                      '\$ 450.00',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                  Get.to(()=> DeliveryOptionScreen());
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

