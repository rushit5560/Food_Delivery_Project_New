import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/common/constants/field_validation.dart';
import 'package:get/get.dart';
import '../../controllers/signup_screen_controller/signup_screen_controller.dart';

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

class SellerNameTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  SellerNameTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.nameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateSellerName(value!),
    );
  }
}

class StoreNameTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  StoreNameTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.storeNameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateStoreName(value!),
    );
  }
}

class StoreNumberTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  StoreNumberTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: signupScreenController.storeNumberTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateMobile(value!),
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
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class AdminShareTextField extends StatelessWidget {
  //const EmailTextField({Key? key}) : super(key: key);
  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  AdminShareTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signupScreenController.adminShareTextEditingController,
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
      validator: (value) => FieldValidator().validatePassword(value!),
    );
  }
}

class DeliveryRangeTextField extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  DeliveryRangeTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.deliveryRangeTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateRange(value!),
    );
  }
}

class StoreAddressTextField extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();
  String hintText;

  StoreAddressTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.storeAddressTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateAddress(value!),
    );
  }
}


class ContinueButton extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      if(signupScreenController.signupFormKey.currentState!.validate()){
        if(signupScreenController.file == null){
          Fluttertoast.showToast(msg: 'Profile Image required...!');
        } else if(signupScreenController.coverFile == null){
          Fluttertoast.showToast(msg: 'Cover Image required...!');
        } else{
          signupScreenController.adminSignUpFunction();
        }

      }

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