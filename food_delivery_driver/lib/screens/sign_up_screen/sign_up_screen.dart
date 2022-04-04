import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/common_widgets.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/models/all_city_model/city_model.dart';
import 'package:food_delivery_driver/screens/sign_up_screen/sign_up_screen_widgets.dart';
import 'package:get/get.dart';
import '../../controllers/signup_screen_controller/signup_screen_controller.dart';


class SignUpScreen extends StatefulWidget {
   SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final signUpScreenController = Get.put(SignUpScreenController());
  String? areaValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBarModule(title: 'Register', index: 2),
      body: Obx(() => signUpScreenController.isLoading.value ?
      CustomCircularProgressIndicator() :
         Form(
           key: signUpScreenController.signupFormKey,
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                   padding: EdgeInsets.only(left: 10, right: 10),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(color: Colors.grey, blurRadius: 20.0),
                     ],
                   ),
                   child: Column(
                     children: [
                       SizedBox(height: 20),
                       DriverImageModuleAndCoverImageModule(),

                       SizedBox(height: 20),
                       FirstNameTextField(hintText: "First Name"),
                       SizedBox(height: 15),
                       LastNameTextField(hintText: "Last Name"),
                       SizedBox(height: 15),
                       PhoneNumberTextField(hintText: "Phone Number"),
                       SizedBox(height: 15),
                       EmailTextField(hintText: "Email"),
                       SizedBox(height: 15),
                       PasswordTextField(hintText: "Password"),
                       SizedBox(height: 15),
                       AllRestaurantsDropDownMenuModule(),
                       SizedBox(height: 15),
                       // CityListDropDownModule(),
                       ZoneListDropDownModule(),
                       SizedBox(height: 15),
                       AddressTextField(hintText: "Address"),
                       SizedBox(height: 15),
                       IdentityTypeTextField(hintText: "Identity Type"),
                       SizedBox(height: 15),
                       IdentityNumberTextField(hintText: "Identity Number"),
                       SizedBox(height: 15),
                       IdentityImageModule(),
                       SizedBox(height: 15),

                     ],
                   ),
                 ),
                 SizedBox(height: 15),
                 ContinueButton(),
                 SizedBox(height: 15),
               ],
             ),
           ),
         ),
      ),
    );
  }


}
