import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/field_validation.dart';
import 'package:food_delivery/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/all_area_model/all_area_model.dart';
import '../../models/all_city_model/city_model.dart';

class ProfilePicModule extends StatefulWidget {
  const ProfilePicModule({Key? key}) : super(key: key);
  @override
  _ProfilePicModuleState createState() => _ProfilePicModuleState();
}
class _ProfilePicModuleState extends State<ProfilePicModule> {
  final editProfileScreenController = Get.find<EditProfileScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        editProfileScreenController.userProfile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.file(editProfileScreenController.userProfile!,
                    height: 120, width: 120, fit: BoxFit.fill),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.network(editProfileScreenController.userProfilePicLink,
                    height: 120, width: 120, fit: BoxFit.fill),
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
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        editProfileScreenController.userProfile = File(image.path);
      });
    } else {}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        editProfileScreenController.userProfile = File(image.path);
      });
    } else {}
  }
}

class FullNameTextField extends StatelessWidget {
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editProfileScreenController.fullNameTextController,
      cursorColor: AppColors.colorDarkPink,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: inputDecoration('Full Name'),
    );
  }
}

/*class EmailTextField extends StatelessWidget {
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editProfileScreenController.emailTextController,
      cursorColor: AppColors.colorDarkPink,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: inputDecoration('Email'),
    );
  }
}*/

/*class PhoneNoTextField extends StatelessWidget {
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editProfileScreenController.phoneNoTextController,
      cursorColor: AppColors.colorDarkPink,
      validator: (value) => FieldValidator().validateMobile(value!),
      decoration: inputDecoration('Phone No.'),
    );
  }
}*/

class CityDropDownModule extends StatefulWidget {
  CityDropDownModule({Key? key}) : super(key: key);
  @override
  State<CityDropDownModule> createState() => _CityDropDownModuleState();
}
class _CityDropDownModuleState extends State<CityDropDownModule> {
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 45,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade300
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade100,
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<GetList>(
                focusColor: Colors.white,
                value: editProfileScreenController.cityDropDownValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: editProfileScreenController.cityLists.
                map<DropdownMenuItem<GetList>>((GetList value) {
                  return DropdownMenuItem<GetList>(
                    value: value,
                    child: Text(
                      value.cityName!,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Text(
                  "Select City",
                ),
                onChanged: (newValue) {
                  editProfileScreenController.cityDropDownValue!.cityName = newValue!.cityName;
                  editProfileScreenController.cityDropDownValue!.sId = newValue.sId;
                  editProfileScreenController.areaList.clear();
                  editProfileScreenController.areaList.add(GetAreaList(areaName: 'Select Area'));
                  editProfileScreenController.getAreaUsingCityId(cityId: "${editProfileScreenController.cityDropDownValue!.sId}");
                  print("cityDropDownValue : ${editProfileScreenController.cityDropDownValue}");
                  print('newValue.name : ${newValue.cityName}');
                  print('city: ${newValue.sId!}');
                  editProfileScreenController.loading();
                },
              ),
            ),
          ),
        ),
    );
  }
}


class AreaDropDownModule extends StatelessWidget {
  final editProfileScreenController =
      Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 45,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade300
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade100,
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<GetAreaList>(
                focusColor: Colors.white,
                value: editProfileScreenController.areaDropDownValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: editProfileScreenController.areaList.
                map<DropdownMenuItem<GetAreaList>>((GetAreaList value) {
                  return DropdownMenuItem<GetAreaList>(
                    value: value,
                    child: Text(
                      value.areaName!,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  editProfileScreenController.areaDropDownValue!.areaName = newValue!.areaName;
                  editProfileScreenController.areaDropDownValue!.id = newValue.id;
                  print('newValue.name : ${newValue.areaName}');
                  print('area: ${newValue.id}');
                  editProfileScreenController.loading();
                },
              ),
            ),
          ),
        ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  UpdateButton({Key? key}) : super(key: key);
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(editProfileScreenController.formKey.currentState!.validate()){
          editProfileScreenController.updateUserProfile();
        }
      },
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
