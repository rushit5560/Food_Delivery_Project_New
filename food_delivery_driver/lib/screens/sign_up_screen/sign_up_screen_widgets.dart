import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/controllrs/signup_screen_controller/signup_screen_controller.dart';
import 'package:get/get.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Sign Up",
        style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
    );
  }
}

class FirstNameTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  FirstNameTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.firstNameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class LastNameTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  LastNameTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.lastNameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  PhoneNumberTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: signupScreenController.phoneNumberTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class EmailTextField extends StatelessWidget {
  //const EmailTextField({Key? key}) : super(key: key);
  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  EmailTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signupScreenController.emailTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  PasswordTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.passwordTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}


class AddressTextField extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  AddressTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.addressTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}


class ContinueButton extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        signupScreenController.deliverySignUpFunction();
      },
      child: Container(
        height: 45, width: Get.width /3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink
        ),
        child: Center(
          child: Text("Continue",
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}



InputDecoration _inputDecoration({hintText, icon}) {
  return InputDecoration(
    hintText: "$hintText",
    //prefixIcon: Icon(icon, color: Colors.black),
    // isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    filled: true,
    fillColor: Colors.grey.shade200,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)
    ),
  );
}