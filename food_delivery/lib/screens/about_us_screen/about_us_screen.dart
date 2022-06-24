import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/terms_condition_screen_controller/terms_condition_screen_controller.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);
  final termsAndConditionScreenController = Get.put(TermsAndConditionScreenController());
  //final String content = 'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum is simply dummy text of the printing and typesetting industry.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'About Us'),

      body: SingleChildScrollView(
        child: Obx(()=>
        termsAndConditionScreenController.isLoading.value ?
        CircularProgressIndicator():
          Column(
            children: [
              SizedBox(height: Get.height * 0.06),
              // Import From Common Widgets File
              LogoImage(),
              SizedBox(height: Get.height * 0.06),
              Html(
                data: termsAndConditionScreenController.aboutUs,
              ),
              // HeaderAndContentModule(
              //   header: 'About Us',
              //   content: '$content',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
