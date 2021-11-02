import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/contact_us_screen_controller/contact_us_screen_controller.dart';
import 'package:get/get.dart';

import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  // const ContactUsScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();
  TextEditingController messageFieldController = TextEditingController();

  ContactUsScreenController contactScreenController = Get.put(ContactUsScreenController());

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
              DropDown(),
              SizedBox(height: Get.height * 0.02),
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
