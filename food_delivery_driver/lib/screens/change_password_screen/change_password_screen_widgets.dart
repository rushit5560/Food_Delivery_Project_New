import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import '../../common/field_validation.dart';
import '../../controllers/change_password_screen_controller/change_password_screen_controller.dart';

class OldPasswordFieldModule extends StatelessWidget {
  OldPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: screenController.oldPasswordFieldController,
        cursorColor: AppColors.colorDarkPink,
        obscureText: screenController.isOldPassVisible.value,
        validator: (value) => FieldValidator().validatePassword(value!),
        decoration:
            changePassInputDecoration('Old Password', 1, screenController),
      ),
    );
  }
}

class NewPasswordFieldModule extends StatelessWidget {
  NewPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: screenController.newPasswordFieldController,
        cursorColor: AppColors.colorDarkPink,
        obscureText: screenController.isNewPassVisible.value,
        validator: (value) => FieldValidator().validatePassword(value!),
        decoration:
            changePassInputDecoration('New Password', 2, screenController),
      ),
    );
  }
}

class CNewPasswordFieldModule extends StatelessWidget {
  CNewPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: screenController.cNewPasswordFieldController,
        cursorColor: AppColors.colorDarkPink,
        obscureText: screenController.isCNewPassVisible.value,
        validator: (value) => FieldValidator().validatePassword(value!),
        decoration: changePassInputDecoration(
            'Confirm New Password', 3, screenController),
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await screenController.updatePasswordFunction(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            "Submit",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.colorLightPink,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration changePassInputDecoration(
    String hintText, int index, ChangePasswordScreenController controller) {
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
    suffixIcon: index == 1
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
              ),
  );
}
