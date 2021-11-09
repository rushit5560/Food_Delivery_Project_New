import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:get/get.dart';

import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  // const EditProfileScreen({Key? key}) : super(key: key);

  TextEditingController fullNameFieldController =  TextEditingController(text: 'John Doe');
  TextEditingController emailFieldController =  TextEditingController(text: 'demo@gmail.com');
  TextEditingController phoneNoFieldController =  TextEditingController(text: '1234567890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: 'Edit Profile'),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  HeaderText(),
                  const SizedBox(height: 30),
                  FullNameFieldModule(fullNameFieldController: fullNameFieldController),
                  const SizedBox(height: 15),
                  EmailFieldModule(emailFieldController: emailFieldController),
                  const SizedBox(height: 15),
                  PhoneNoFieldModule(phoneNoFieldController: phoneNoFieldController),
                  const SizedBox(height: 30),
                  UpdateButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
