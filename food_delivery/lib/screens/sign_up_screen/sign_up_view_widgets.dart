import 'package:flutter/material.dart';
import 'package:food_delivery/common/field_validation.dart';
import 'package:food_delivery/screens/sign_in_screen/sign_in_screen.dart';
//import 'package:food_delivery/views/sign_in_screen/sign_in_screen.dart';
//import 'package:food_delivery/screens/sign_in_view/sign_in_screen.dart';
//import 'package:food_delivery/screens/sign_up_view/sign_up_screen.dart';
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

class NameTextField extends StatelessWidget {

  TextEditingController fullNameFieldController;

  String hintText;
  String name="";


  NameTextField({
    required this.fullNameFieldController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: fullNameFieldController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      // onSaved: (String ? val) {
      //   name = val!;
      // },
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }

}

class EmailTextField extends StatelessWidget {
  //const EmailTextField({Key? key}) : super(key: key);
  TextEditingController  emailFieldController;
  String email="";
  //IconData icon;
  String hintText;

  EmailTextField({
    required this.emailFieldController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailFieldController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      // onSaved: (String ? val) {
      //   email = val!;
      // },
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class PhoneTextField extends StatelessWidget {
  TextEditingController phoneFieldController;
  //IconData icon;
  String phone ="";
  String hintText;

  PhoneTextField({
    required this.phoneFieldController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: phoneFieldController,
    //  obscureText: true,
       decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      onSaved: (String ? val) {
        phone = val!;
      },
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class ReferalCodeTextField extends StatelessWidget {
  TextEditingController ? referalCodeTextEditingController;
  //IconData icon;
  String hintText;

  ReferalCodeTextField({
    required TextEditingController referalCodeTextEditingController,
    //required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: referalCodeTextEditingController,
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

class SignInText extends StatelessWidget {
  const SignInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),

        SizedBox(width: 5,),

        GestureDetector(
          onTap: (){
            //Get.to(()=> SignInScreen());
          },
          child: Text("Sign In",
            style: TextStyle(color: Colors.blue),),
        )
      ],
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