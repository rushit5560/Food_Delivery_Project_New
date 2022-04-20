import 'package:flutter/material.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';
import '../../controllers/change_password_screen_controller/change_password_screen_controller.dart';
import 'change_password_screen_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.put(ChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Change Password'),

      body: Container(
        child: Form(
          key: changePasswordScreenController.changePassFormKey,
          child: Column(
            children: [
              OldPasswordFieldModule(),
              const SizedBox(height: 10),
              NewPasswordFieldModule(),
              const SizedBox(height: 10),
              CNewPasswordFieldModule(),
              const SizedBox(height: 20),
              SubmitButtonModule(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ).commonAllSidePadding(padding: 20),
    );
  }
}
