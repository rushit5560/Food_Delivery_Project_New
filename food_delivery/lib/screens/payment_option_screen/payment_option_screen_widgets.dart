import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/controllers/payment_option_screen_controller/payment_option_screen_controller.dart';
import 'package:get/get.dart';

class OfferCodesModule extends StatelessWidget {
  PaymentOptionScreenController paymentOptionScreenController;
  OfferCodesModule({required this.paymentOptionScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Coupon/Ongoing Offers Codes',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.5,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: paymentOptionScreenController.offerCodeList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${paymentOptionScreenController.offerCodeList[index].title}',
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${paymentOptionScreenController.offerCodeList[index].description}',

                              ),
                            ],
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.colorDarkPink
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Center(
                              child: Text(
                                '${paymentOptionScreenController.offerCodeList[index].code}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 0.9,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: AppColors.colorDarkPink,
      thickness: 1,
    );
  }
}

class PromoCodeTextField extends StatelessWidget {
  TextEditingController promoCodeFieldText;
  PromoCodeTextField({required this.promoCodeFieldText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: promoCodeFieldText,
        cursorColor: AppColors.colorDarkPink,
        decoration: _inputDecoration(),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      hintText: 'Enter Promo Code here',
      filled: true,
      fillColor: Colors.grey.shade200,
      isDense: true,
      contentPadding: EdgeInsets.all(15),
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => _onApplyClickedMethod(promoCodeFieldText.text.trim()),
              child: Container(
                child: Text(
                  'Apply',
                  textScaleFactor: 1.2,
                  style: TextStyle(color: AppColors.colorDarkPink),
                ),
              ),
            ),
          ),
        ],
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
    );
  }

  void _onApplyClickedMethod(String text) {
    print('Apply Clk : $text');

  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Payment Method',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.5,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _commonPaymentMethodTile(0, Images.ic_wallet ,'App Wallet'),
          _commonPaymentMethodTile(1, Images.ic_pay_on_delivery ,'Pay On Delivery'),
          _commonPaymentMethodTile(2, Images.ic_paypal ,'Razor Pay'),
        ],
      ),
    );
  }

  Widget _commonPaymentMethodTile(int index,String img, String text) {
    return GestureDetector(
      onTap: () => _onPaymentMethodClicked(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: Get.height * 0.06,
                        width: Get.height * 0.06,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('$img'),
                              scale: 1
                          ),
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        '$text',
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                index == 0
                    ? Container(
                  child: Text(
                    '\$123456',
                    textScaleFactor: 1.2,
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPaymentMethodClicked(int index) {
    if(index == 0){
      print('Index 0');
    }
    else if(index == 1){
      print('Index 1');
    }
    else if(index == 2){
      print('Index 2');
    }
  }

}
