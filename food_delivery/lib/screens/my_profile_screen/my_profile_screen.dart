import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/screens/my_profile_screen/my_profile_screen_widgets.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatelessWidget {
   MyProfileScreen({Key? key}) : super(key: key);

  TextEditingController nameTextEditingController = TextEditingController(text: "John Doe");
  TextEditingController emailTextEditingController = TextEditingController(text: "demo@gmail.com");
   TextEditingController phoneNumberTextEditingController = TextEditingController(text: "1234567890");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Profile'),

      body: SingleChildScrollView(
        child: Container(
        width: Get.width,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Profile(),
            SizedBox(height: 20),
            FullNameTextField(nameTextEditingController: nameTextEditingController),
            SizedBox(height: 10),
            EmailTextField(
              emailTextEditingController: emailTextEditingController,
              hintText: "Enter Email"),
            SizedBox(height: 10),
            PhoneNumberTextField(
              phoneNumberTextEditingController: phoneNumberTextEditingController,
              hintText: "Enter Email",
            ),
            SizedBox(height: 50),
            UpdateProfileButton(),
            SizedBox(height: 10),
          ],
        ),
        )
      ),
    );
  }
}
