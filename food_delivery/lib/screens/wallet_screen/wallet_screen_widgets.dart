import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:get/get.dart';

import '../../controllers/wallet_screen_controller/wallet_screen_controller.dart';

class WalletValue extends StatelessWidget {
  WalletValue({Key? key}) : super(key: key);
  final walletScreenController = Get.find<WalletScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          //width: Get.width,
          alignment: Alignment.center,
          child: Text("Advance Value",
              style: TextStyle(color: Colors.black, fontSize: 23)),
        ),
        SizedBox(height: 20,),
        Container(
          child: Text("\$${walletScreenController.walletAmount.value}",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 23),),
        )
      ],
    );
  }
}

class WalletButton extends StatelessWidget {
  const WalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorDarkPink
              ),
              child: Column(
                children: [
                  Image.asset(Images.ic_wallet1, scale: 2,),
                  SizedBox(height: 10,),
                  Text("Recharge History",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),)
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorDarkPink
              ),
              child: Column(
                children: [
                  Image.asset(Images.ic_top_up, scale: 2.3,),
                  SizedBox(height: 10,),
                  Text("Wallet History",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),)
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorDarkPink
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.ic_finance, scale: 2.3,),
                  SizedBox(height: 10,),
                  Text("Spent Analysis",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorLightPink
                ),
                child: Container(
                  child: Center(
                    child: Text("\$-10",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                )

            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorLightPink
                ),
                child: Container(
                  child: Center(
                    child: Text("\$-20",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                )

            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorLightPink
                ),
                child: Container(
                  child: Center(
                    child: Text("\$-50",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                )

            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorLightPink
                ),
                child: Container(
                  child: Center(
                    child: Text("\$-100",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                )

            ),
          )
        ],
      ),
    );
  }
}