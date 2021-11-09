import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
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

class SellerNameTextField extends StatelessWidget {

  TextEditingController ? nameTextEditingController;
  //IconData icon;
  String hintText;

  SellerNameTextField({
    required TextEditingController nameTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: nameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class StoreNameTextField extends StatelessWidget {

  TextEditingController ? storeNameTextEditingController;
  //IconData icon;
  String hintText;

  StoreNameTextField({
    required TextEditingController storeNameTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: storeNameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class StoreNumberTextField extends StatelessWidget {

  TextEditingController ? storeNumberTextEditingController;
  //IconData icon;
  String hintText;

  StoreNumberTextField({
    required TextEditingController storeNumberTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: storeNumberTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class EmailTextField extends StatelessWidget {
  //const EmailTextField({Key? key}) : super(key: key);
  TextEditingController ? emailTextEditingController;
  //IconData icon;
  String hintText;

  EmailTextField({
    required TextEditingController emailTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class AdminShareTextField extends StatelessWidget {
  //const EmailTextField({Key? key}) : super(key: key);
  TextEditingController ? adminShareTextEditingController;
  //IconData icon;
  String hintText;

  AdminShareTextField({
    required TextEditingController adminShareTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: adminShareTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  TextEditingController ? passwordTextEditingController;
  //IconData icon;
  String hintText;

  PasswordTextField({
    required TextEditingController passwordTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: passwordTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class DeliveryRangeTextField extends StatelessWidget {
  TextEditingController ? deliveryRangeTextEditingController;
  //IconData icon;
  String hintText;

  DeliveryRangeTextField({
    required TextEditingController deliveryRangeTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: deliveryRangeTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class StoreAddressTextField extends StatelessWidget {
  TextEditingController ? storeAddressTextEditingController;
  //IconData icon;
  String hintText;

  StoreAddressTextField({
    required TextEditingController storeAddressTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: storeAddressTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        //border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45, width: Get.width /3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorDarkPink
      ),
      child: Center(
        child: Text("Continue",
          style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
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