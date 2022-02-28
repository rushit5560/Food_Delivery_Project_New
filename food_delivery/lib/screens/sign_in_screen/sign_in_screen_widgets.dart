import 'package:flutter/material.dart';
import 'package:food_delivery/common/field_validation.dart';
import 'package:get/get.dart';

import '../../controllers/auth_screen_controller/auth_screen_conroller.dart';

class SignInText extends StatelessWidget {
  const SignInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "SignIn",
        style: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SignInTextField extends StatelessWidget {
  final String hintText;
  SignInTextField({required this.hintText});
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: authScreenController.signInEmailTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class MobileNumberTextField extends StatelessWidget {
  final String hintText;
  MobileNumberTextField({required this.hintText});
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: authScreenController.signInPhoneNoTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      maxLength: 10,
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final String hintText;
  PasswordTextField({required this.hintText});
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: authScreenController.signInPasswordTextFieldController,
      obscureText: true,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validatePassword(value!),
    );
  }
}

InputDecoration _inputDecoration({hintText}) {
  return InputDecoration(
    hintText: "$hintText",
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    filled: true,
    fillColor: Colors.grey.shade200,
    counterText: '',
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
  );
}
