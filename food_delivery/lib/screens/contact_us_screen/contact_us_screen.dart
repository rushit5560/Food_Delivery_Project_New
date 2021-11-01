import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:get/get.dart';

import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  // const ContactUsScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();
  TextEditingController messageFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Contact Us'),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.05),
              LogoImage(),
              SizedBox(height: Get.height * 0.03),
              CallbackTextModule(),
              CallBackButtonModule(),
              FeedbackTextModule(),
              FormFieldsModule(
                formKey: formKey,
                fullNameFieldController: fullNameFieldController,
                phoneNoFieldController: phoneNoFieldController,
                messageFieldController: messageFieldController,
              ),
              SubmitButtonModule(formKey: formKey),
            ],
          ),
        ),
      ),
    );
  }
}
