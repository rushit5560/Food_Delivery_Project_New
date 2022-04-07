

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/field_validation.dart';
import '../../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../../controllers/delivery_man_screen_controller/delivery_man_screen_controller.dart';
import '../../../models/delivery_man_models/get_all_area_model.dart';

class FirstNameFieldModule extends StatelessWidget {
  FirstNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.firstNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "First Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class LastNameFieldModule extends StatelessWidget {
  LastNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.lastNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Last Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class EmailFieldModule extends StatelessWidget {
  EmailFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: screenController.emailFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Email"),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class AddressFieldModule extends StatelessWidget {
  AddressFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.addressFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Address"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class PhoneFieldModule extends StatelessWidget {
  PhoneFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: screenController.phoneFieldController,
      maxLength: 10,
      decoration: addProductTextFieldDecoration(hintText: "Phone"),
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class PasswordFieldModule extends StatelessWidget {
  PasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.passwordFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Password"),
      validator: (value) => FieldValidator().validatePassword(value!),
    );
  }
}

class IdentityNumberFieldModule extends StatelessWidget {
  IdentityNumberFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.identityNumberFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Identity Number"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class IdentityTypeDropDownModule extends StatelessWidget {
  IdentityTypeDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade200,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade100,
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(

                  value: screenController.identityTypeValue.value,

                  items: <String>[
                    'Aadhaar Card',
                    'Passport',
                    'Driving License',
                    'NID',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (value){
                    screenController.isLoading(true);
                    screenController.identityTypeValue.value = value!;
                    log("${screenController.identityTypeValue.value}");
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }
}

class DeliveryBoyImageModule extends StatelessWidget {
  DeliveryBoyImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        screenController.deliveryBoyImgFile != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.file(screenController.deliveryBoyImgFile!,
              height: 100, width: 100, fit: BoxFit.fill),
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Container(
            color: AppColors.colorLightPink,
            height: 100, width: 100,
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
        }
    );
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.deliveryBoyImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.deliveryBoyImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }

}

class IdentityImageModule extends StatelessWidget {
  IdentityImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                screenController.identityImgFile == null
                    ? 'Identity Image'
                    : "${screenController.identityImgFile!.path}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15.5,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _showPicker(context),
              child: Container(
                child: Text('Select',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
        }
    );
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.identityImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.identityImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }

}

class AllZoneDropDownModule extends StatelessWidget {
  AllZoneDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade200,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade100,
                buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<GetZoneList>(

                  value: screenController.allZoneDropDownValue,

                  items: screenController.allZoneList
                      .map<DropdownMenuItem<GetZoneList>>((GetZoneList getZoneList) {
                    return DropdownMenuItem<GetZoneList>(
                      value: getZoneList,
                      child: Text(
                        "${getZoneList.areaName}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (getZoneList){
                    screenController.isLoading(true);
                    screenController.allZoneDropDownValue = getZoneList!;
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.addDeliveryBoyFormKey.currentState!.validate()) {
          if(screenController.deliveryBoyImgFile == null) {
            Fluttertoast.showToast(msg: "Please Select Driver Image!");
          } else if(screenController.identityImgFile == null) {
            Fluttertoast.showToast(msg: "Please Select Driver Identity Image!");
          } else if(screenController.allZoneDropDownValue.id == "0") {
            Fluttertoast.showToast(msg: "Please Select Zone!");
          } else {
            await screenController.addDeliveryBoyFunction();
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Submit',
            textScaleFactor: 1.2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}



