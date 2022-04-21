import 'package:flutter/material.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import '../../common/field_validation.dart';
import '../../controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';


class ForgotPasswordFormModule extends StatelessWidget {
  ForgotPasswordFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.forgotPassFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: screenController.emailFieldController,
            cursorColor: AppColors.colorDarkPink,
            validator: (value) => FieldValidator().validateEmail(value!),
            decoration: emailInputDecoration('Enter Email'),
          ),
          const SizedBox(height: 20),
          ForgotPassSubmitButtonModule(),
          const SizedBox(height: 20),
        ],
      ).commonAllSidePadding(padding: 20),
    );
  }
}

class ForgotPassSubmitButtonModule extends StatelessWidget {
  ForgotPassSubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.forgotPassFormKey.currentState!.validate()) {
          await screenController.forgotPasswordFunction();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Text(
          "Submit",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.colorLightPink,
          ),
        ).commonSymmetricPadding(horizontal: 20, vertical: 12),
      ),
    );
  }
}


InputDecoration emailInputDecoration(String hintText) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    fillColor: Colors.grey.shade200,
    filled: true,
    hintText: '$hintText',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    /*suffixIcon: index == 1
        ? Obx(
          () => GestureDetector(
        onTap: () => controller.isOldPassVisible.value = !controller.isOldPassVisible.value,
        child: Icon(
          controller.isOldPassVisible.value
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded,
          color: AppColors.colorDarkPink,
          size: 22,
        ),
      ),
    )
        : index == 2
        ? Obx(
          () => GestureDetector(
        onTap: ()=> controller.isNewPassVisible.value = !controller.isNewPassVisible.value,
        child: Icon(
          controller.isNewPassVisible.value
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded,
          color: AppColors.colorDarkPink,
          size: 22,
        ),
      ),
    )
        : Obx(
          () => GestureDetector(
        onTap: () => controller.isCNewPassVisible.value = !controller.isCNewPassVisible.value,
        child: Icon(
          controller.isCNewPassVisible.value
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded,
          color: AppColors.colorDarkPink,
          size: 22,
        ),
      ),
    ),*/
  );
}
