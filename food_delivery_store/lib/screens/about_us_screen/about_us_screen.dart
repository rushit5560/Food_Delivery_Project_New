import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  String content = 'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum is simply dummy text of the printing and typesetting industry.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'About Us'),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.06),
            // Import From Common Widgets File
            LogoImage(),
            SizedBox(height: Get.height * 0.06),
            HeaderAndContentModule(
              header: 'About Us',
              content: '$content',
            ),
          ],
        ),
      ),
    );
  }
}
