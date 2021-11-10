import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/common_widgets.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:get/get.dart';


class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: 'Terms & Condition'),

      body: Column(
        children: [
          SizedBox(height: Get.height * 0.06),
          // Import From Common Widgets File
          LogoImage(),
          SizedBox(height: Get.height * 0.06),
          HeaderAndContentModule(
            header: 'Terms & Conditions',
            content: 'last updated 05 Sep 2021',
          ),
        ],
      ),
    );
  }
}
