import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/screens/wallet_screen/wallet_screen_widgets.dart';
import 'package:get/get.dart';

import '../../controllers/wallet_screen_controller/wallet_screen_controller.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);
  final walletScreenController = Get.put(WalletScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Wallet'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Obx(
            () => walletScreenController.isLoading.value
                ? CustomCircularProgressIndicator()
                : Column(
                    children: [
                      WalletValue(),
                      WalletButton(),
                      const SizedBox(height: 5),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 5),
                      PriceRow(),
                      const SizedBox(height: 5),
                      Divider(color: Colors.grey),
                      const SizedBox(height: 5),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
