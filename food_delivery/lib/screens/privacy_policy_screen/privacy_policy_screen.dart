import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/terms_condition_screen_controller/terms_condition_screen_controller.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({Key? key}) : super(key: key);

  final termsAndConditionScreenController = Get.put(TermsAndConditionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Privacy Policy'),

      body: Obx(()=>
      termsAndConditionScreenController.isLoading.value ?
      CircularProgressIndicator():
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.06),
            // Import From Common Widgets File
            LogoImage(),
            SizedBox(height: Get.height * 0.06),
            //Text("mhbmbm"),
            Html(
              data: termsAndConditionScreenController.privacyPolicy,
            ),
            // HeaderAndContentModule(
            //   header: 'Terms & Conditions',
            //   content: Html(
            //     data: termsAndConditionScreenController.termsAndCondition,
            //   ),
            // ),
            // Html(
            //    data: termsAndConditionScreenController.termsAndCondition,
            //  ),
          ],
        ),
      ),
      ),
    );
  }
}
