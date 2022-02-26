import 'package:flutter/material.dart';
import 'package:food_delivery/common/field_validation.dart';

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
  final TextEditingController signInEmailFieldController;
  final String hintText;

  SignInTextField({
    required this.signInEmailFieldController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signInEmailFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class MobileNumberTextField extends StatelessWidget {
  final TextEditingController signInPhoneFieldController;
  final String hintText;

  MobileNumberTextField({
    required this.signInPhoneFieldController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: signInPhoneFieldController,
      decoration: _inputDecoration(hintText: hintText),
      maxLength: 10,
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController? signInPasswordFieldController;
  final String hintText;

  PasswordTextField({
    required this.signInPasswordFieldController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: signInPasswordFieldController,
      obscureText: true,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validatePassword(value!),
    );
  }
}

/*class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}*/

/*class SignUpText extends StatelessWidget {
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
}*/

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
