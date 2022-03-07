import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:get/get.dart';

import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // const EditProfileScreen({Key? key}) : super(key: key);
  final editProfileScreenController = Get.put(EditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Update Profile'),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
          ()=> editProfileScreenController.isLoading.value
          ? CustomCircularProgressIndicator()
          : SingleChildScrollView(
            child: Form(
              key: editProfileScreenController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ProfilePicModule(),
                  const SizedBox(height: 20),
                  FullNameTextField(),
                  const SizedBox(height: 15),
                  EmailTextField(),
                  const SizedBox(height: 15),
                  PhoneNoTextField(),
                  const SizedBox(height: 15),
                  CityDropDownModule(),
                  const SizedBox(height: 15),
                  AreaDropDownModule(),
                  const SizedBox(height: 25),
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
