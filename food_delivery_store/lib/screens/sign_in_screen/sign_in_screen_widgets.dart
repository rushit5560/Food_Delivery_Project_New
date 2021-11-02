import 'package:flutter/material.dart';

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

  TextEditingController signInTextEditingController;
  //IconData icon;

  String hintText;

  SignInTextField({
    required this.signInTextEditingController,
    //required this.icon,

    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    print('hintText : $hintText && icon && signInTextEditingController $signInTextEditingController');
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signInTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
    );
  }
}


class PasswordTextField extends StatelessWidget {
  // const PasswordTextField({Key? key}) : super(key: key);
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
      keyboardType: TextInputType.visiblePassword,
      controller: passwordTextEditingController,
      obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon,*/),

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


InputDecoration _inputDecoration({hintText, icon}) {
  return InputDecoration(
    hintText: "$hintText",
    //prefixIcon: Icon(icon, color: Colors.black),
    //isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    // border: InputBorder.none,
    filled: true,
    fillColor: Colors.grey.shade300,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade300)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade300)
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade300)
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade300)
    ),
  );
}