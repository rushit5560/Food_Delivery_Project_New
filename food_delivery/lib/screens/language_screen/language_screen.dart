import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/language_screen_controller/language_screen_controller.dart';
import 'package:get/get.dart';

import 'language_screen_widgets.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreenController languageScreenController = Get.put(LanguageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Languages'),

      body: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          LogoImage(),
          SizedBox(height: Get.height * 0.05),
          HeaderAndContentModule(
            header: 'Choose a language',
            content: 'Select Your Preferred Language while using this app',
          ),
          Expanded(
              child: LanguageListModule(languageScreenController: languageScreenController),
          ),
          ContinueButtonModule(),
          SizedBox(height: Get.height * 0.01),
        ],
      ),
    );
  }
}
