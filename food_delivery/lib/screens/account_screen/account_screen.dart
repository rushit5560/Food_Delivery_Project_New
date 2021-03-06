import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/account_screen_controller/account_screen_controller.dart';
import 'package:get/get.dart';
import 'account_screen_widgets.dart';

class AccountScreen extends StatelessWidget {
  final accountScreenController = Get.put(AccountScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Account'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Import From account_screen_widgets File
            Obx(() => accountScreenController.isLoading.value
                ? CustomCircularProgressIndicator()
                : AccountDetailsModule()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EditProfileButtonModule(),
                ChangePassTextModule(),
              ],
            ),
            HeaderTextModule(text: 'Account Information'),
            AccountInfoListModule(),
            HeaderTextModule(text: 'Others'),
            OtherInfoListModule(),
            LogoutButtonModule(),
          ],
        ),
      ),
    );
  }
}
