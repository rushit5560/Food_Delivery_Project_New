import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/field_validation.dart';
import 'package:food_delivery/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicModule extends StatefulWidget {
  const ProfilePicModule({Key? key}) : super(key: key);

  @override
  _ProfilePicModuleState createState() => _ProfilePicModuleState();
}

class _ProfilePicModuleState extends State<ProfilePicModule> {
  File? file;
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        file != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.file(file!,
                    height: 120, width: 120, fit: BoxFit.fill),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Container(
                  color: AppColors.colorLightPink,
                  height: 120, width: 120,
                  //child: FlutterLogo(),
                ),
              ),
        GestureDetector(
          onTap: () {
            _showPicker(context);
          },
          child: Container(
            height: 25,
            width: 25,
            margin: EdgeInsets.only(bottom: 10),
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
    );
  }

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
                      title: new Text('Photo Library'),
                      onTap: () {
                        gallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      camera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void gallery() async {
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    } else {}
  }

  void camera() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    } else {}
  }
}

class FullNameTextField extends StatelessWidget {
  TextEditingController fullNameTextController;

  FullNameTextField({required this.fullNameTextController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fullNameTextController,
      cursorColor: AppColors.colorDarkPink,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: inputDecoration('Full Name'),
    );
  }
}

class EmailTextField extends StatelessWidget {
  TextEditingController emailTextController;

  EmailTextField({required this.emailTextController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailTextController,
      cursorColor: AppColors.colorDarkPink,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: inputDecoration('Email'),
    );
  }
}

class PhoneNoTextField extends StatelessWidget {
  TextEditingController phoneNoTextController;

  PhoneNoTextField({required this.phoneNoTextController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneNoTextController,
      cursorColor: AppColors.colorDarkPink,
      validator: (value) => FieldValidator().validateMobile(value!),
      decoration: inputDecoration('Phone No.'),
    );
  }
}

class CityDropDownModule extends StatelessWidget {
  EditProfileScreenController editProfileScreenController =
      Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(left: 10),
        height: 50,
        //gives the height of the dropdown button
        width: MediaQuery.of(context).size.width,
        //gives the width of the dropdown button
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade200
            //border: Border.all(color: Colors.grey),
            ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey.shade100,
              // background color for the dropdown items
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown:
                    true, //If false (the default), then the dropdown's menu will be wider than its button.
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusColor: Colors.white,
              value: editProfileScreenController.cityType.value,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Surat',
                'Ahmedabad',
                'Baroda',
                'Rajkot',
                'Gandhinagar',
                'Bhavanagar',
                'Junagagh',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: Text(
                "Select Address Type",
                /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
              ),
              onChanged: (String? value) {
                //setState(() {
                editProfileScreenController.cityType.value = value!;
                //});
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AreaDropDownModule extends StatelessWidget {
  EditProfileScreenController editProfileScreenController =
      Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(left: 10),
        height: 50,
        //gives the height of the dropdown button
        width: MediaQuery.of(context).size.width,
        //gives the width of the dropdown button
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade200
            //border: Border.all(color: Colors.grey),
            ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey.shade100,
              // background color for the dropdown items
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown:
                    true, //If false (the default), then the dropdown's menu will be wider than its button.
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusColor: Colors.white,
              value: editProfileScreenController.areaType.value,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Varachha',
                'Mota Varachha',
                'Nana Varachha',
                'Udhna',
                'Vesu',
                'Adajan',
                'Pal',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: Text(
                "Select Address Type",
                /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
              ),
              onChanged: (String? value) {
                //setState(() {
                editProfileScreenController.areaType.value = value!;
                //});
              },
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkPink,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            'Update',
            textScaleFactor: 1.1,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    fillColor: Colors.grey.shade200,
    filled: true,
    hintText: '$hintText',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
  );
}
