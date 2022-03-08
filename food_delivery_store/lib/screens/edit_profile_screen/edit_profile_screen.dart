import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:food_delivery_admin/controllrs/profile_controller/profile_controller.dart';
import 'package:get/get.dart';

import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  // const EditProfileScreen({Key? key}) : super(key: key);

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: 'Edit Profile'),

      body: Obx(()=> profileController.isLoading.value ?
      Center(child: CircularProgressIndicator()) :
         Padding(
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
                    FullNameFieldModule(),
                    const SizedBox(height: 15),
                    EmailFieldModule(),
                    const SizedBox(height: 15),
                    PhoneNoFieldModule(),
                    const SizedBox(height: 30),
                    UpdateButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
