import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';
import '../../controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'forgot_password_screen_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Forgot Password'),

      body: Column(
        children: [

          ForgotPasswordFormModule(),
        ],
      ),
    );
  }
}
