import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:get/get.dart';

import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  // const EditProfileScreen({Key? key}) : super(key: key);
  EditProfileScreenController editProfileScreenController = Get.put(EditProfileScreenController());
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneNoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Update Profile'),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ProfilePicModule(),
            const SizedBox(height: 20),
            FullNameTextField(fullNameTextController: fullNameTextController),
            const SizedBox(height: 15),
            EmailTextField(emailTextController: emailTextController),
            const SizedBox(height: 15),
            PhoneNoTextField(phoneNoTextController: phoneNoTextController),
            const SizedBox(height: 15),
            CityDropDownModule(),
            const SizedBox(height: 15),
            AreaDropDownModule(),
            const SizedBox(height: 25),
            UpdateButton(),
          ],
        ),
      ),
    );
  }
}
