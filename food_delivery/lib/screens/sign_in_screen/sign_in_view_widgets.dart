import 'package:flutter/material.dart';
import 'package:food_delivery/common/field_validation.dart';
import 'package:food_delivery/screens/sign_up_screen/sign_up_screen.dart';
//import 'package:food_delivery/views/sign_up_screen/sign_up_screen.dart';
//import 'package:food_delivery/screens/sign_up_view/sign_up_screen.dart';
import 'package:get/get.dart';

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
  // const SignInTextField({Key? key}) : super(key: key);

  TextEditingController signInEmailFieldController;
  //IconData icon;

  String hintText;

  SignInTextField({
    required this.signInEmailFieldController,
    //required this.icon,

    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    print('hintText : $hintText && icon && signInTextEditingController $signInEmailFieldController');
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signInEmailFieldController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),

      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class MobileNumberTextField extends StatelessWidget {
  // const SignInTextField({Key? key}) : super(key: key);

  TextEditingController signInPhoneFieldController;
  //IconData icon;

  String hintText;

  MobileNumberTextField({
    required this.signInPhoneFieldController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    print('hintText : $hintText && icon && signInTextEditingController $signInPhoneFieldController');
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: signInPhoneFieldController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),

      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}


class PasswordTextField extends StatelessWidget {
  // const PasswordTextField({Key? key}) : super(key: key);
  TextEditingController ? signInPasswordFieldController;
  //IconData icon;
  String hintText;

  PasswordTextField({
    required TextEditingController signInPasswordFieldController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: signInPasswordFieldController,
          obscureText: true,
          decoration: _inputDecoration(hintText: hintText, /*icon: icon,*/),

      validator: (value) => FieldValidator().validatePassword(value!),

    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

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
        child: Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            //Get.to(()=> SignUpScreen());
          },
          child: Text(
            "Sign up",
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}

InputDecoration _inputDecoration({hintText, icon}) {
  return InputDecoration(
    hintText: "$hintText",
    //prefixIcon: Icon(icon, color: Colors.black),
    //isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    // border: InputBorder.none,
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