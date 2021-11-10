import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/screens/new_order_screen/new_order_screen.dart';
import 'package:food_delivery_admin/screens/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorDarkPink,
      height: Get.height /3.5,
      padding: EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("Welcome",
              style: TextStyle(color: Colors.white,fontSize: 23, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  //const TabView({Key? key}) : super(key: key);
  //late TabController tabController;
  //TabView({required this.tabController});
  //AuthScreenController authScreenController = Get.put(AuthScreenController());

  TextEditingController signInTextEditingController;
  TextEditingController passwordTextEditingController;
  //IconData icon;

  LoginForm({
    required this.signInTextEditingController,
    required this.passwordTextEditingController
    //required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Get.height * 0.55,
      margin: EdgeInsets.only(left: 20, right: 20, top: 160),
      padding: EdgeInsets.only(left: 10, right: 10),
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 30,),
          LoginText(),
          SizedBox(height: 30,),
          EmailTextField(signInTextEditingController: signInTextEditingController, hintText: "Email",),
          SizedBox(height: 10,),
          PasswordTextField(passwordTextEditingController: passwordTextEditingController, hintText: "Password",),
          SizedBox(height: 40,),
          NotUserText(),
          SizedBox(height: 20,),
          PreferredLang(),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Login",
        style: TextStyle(
            color: AppColors.colorDarkPink, fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PreferredLang extends StatelessWidget {
  const PreferredLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Select Preferred Language",
        style: TextStyle(
            color: AppColors.colorDarkPink, fontSize: 15),
      ),
    );
  }
}

class NotUserText extends StatelessWidget {
  const NotUserText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not a User?",
          style: TextStyle(color: Colors.black),),
        SizedBox(width: 5,),
        GestureDetector(
          onTap: () {
            Get.off(()=> SignUpScreen());
          },
          child: Text("Click Here",
            style: TextStyle(color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}


class EmailTextField extends StatelessWidget {
  // const SignInTextField({Key? key}) : super(key: key);

  TextEditingController signInTextEditingController;
  //IconData icon;

  String hintText;

  EmailTextField({
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

class ContinueButton extends StatelessWidget {
  ContinueButton({Key? key}) : super(key: key);
  //late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Get.offAll(() => IndexScreen());
        Get.offAll(() => NewOrderScreen());
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}