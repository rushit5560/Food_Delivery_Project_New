import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/screens/sign_up_screen/sign_up_screen_widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/auth_screen_controller/auth_screen_conroller.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final authScreenController = Get.find<AuthScreenController>();

  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController referralCodeTextEditingController =
      TextEditingController();

  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(()=>
            authScreenController.isLoading.value ?
            Center(child: CircularProgressIndicator()) :
           SingleChildScrollView(
            child: Form(
              key: authScreenController.signUpFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        authScreenController.file != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: Image.file(authScreenController.file!,
                                    height: 100, width: 100, fit: BoxFit.cover),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: Container(
                                  color: AppColors.colorLightPink,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                        GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.colorDarkPink),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    UserNameTextFieldModule(hintText: 'User Name'),
                    const SizedBox(height: 15),
                    FullNameTextFieldModule(hintText: 'Full Name'),
                    const SizedBox(height: 15),
                    PhoneNoTextFieldModule(hintText: 'Mobile Number'),
                    const SizedBox(height: 15),
                    PasswordTextFieldModule(hintText: 'Password'),
                    const SizedBox(height: 15),
                    AddressTextFieldModule(hintText: 'Address'),
                    const SizedBox(height: 15),
                    SelectGenderDropDownModule(),
                    const SizedBox(height: 15),
                    EmailTextFieldModule(hintText: 'Email Address'),
                    const SizedBox(height: 15),
                    SelectCityDropDownModule(),
                    const SizedBox(height: 15),
                    SelectAreaDropDownModule(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // bool validateInputs() {
  //   if (authScreenController.signUpFormKey.currentState!.validate()) {
  //     authScreenController.signUpFormKey.currentState!.save();
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        gallery();
                        Get.back();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      camera();
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        authScreenController.file = File(image.path);
      });
    } else {}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        authScreenController.file = File(image.path);
      });
    } else {}
  }

}
