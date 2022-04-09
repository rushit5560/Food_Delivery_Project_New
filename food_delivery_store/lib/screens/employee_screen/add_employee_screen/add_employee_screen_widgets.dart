import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/field_validation.dart';
import '../../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../../controllers/employee_screen_controller/employee_screen_controller.dart';
import '../../../models/employee_role_models/get_all_employee_role_model.dart';

class AddEmployeeForm extends StatelessWidget {
  AddEmployeeForm({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EmployeeProfileImageModule(),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(child: FNameTextFieldModule()),
              const SizedBox(width: 15),
              Expanded(child: LNameTextFieldModule()),
            ],
          ),
          const SizedBox(height: 10),

          PhoneTextFieldModule(),
          const SizedBox(height: 10),

          EmailTextFieldModule(),
          const SizedBox(height: 10),

          PasswordTextFieldModule(),
          const SizedBox(height: 10),

          EmployeeRoleDropDownModule(),
          const SizedBox(height: 20),

          SubmitButton(),

        ],
      ),
    );
  }
}


class EmployeeProfileImageModule extends StatelessWidget {
  EmployeeProfileImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        screenController.employeeProfileImage != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.file(screenController.employeeProfileImage!,
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
      screenController.employeeProfileImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.employeeProfileImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

}

class FNameTextFieldModule extends StatelessWidget {
  FNameTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.fNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "First Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class LNameTextFieldModule extends StatelessWidget {
  LNameTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.lNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Last Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class PhoneTextFieldModule extends StatelessWidget {
  PhoneTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: screenController.phoneFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Phone No"),
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

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

class PasswordTextFieldModule extends StatelessWidget {
  PasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

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

class EmployeeRoleDropDownModule extends StatelessWidget {
  EmployeeRoleDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return categoryDropDown(context);
  }

  categoryDropDown(context){
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
                child: DropdownButton<ListElementRole>(

                  value: screenController.employeeRoleDropDownValue,

                  items: screenController.getEmployeeRoleList
                      .map<DropdownMenuItem<ListElementRole>>((ListElementRole listElementRole) {
                    return DropdownMenuItem<ListElementRole>(
                      value: listElementRole,
                      child: Text(
                        "${listElementRole.name}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (listElementRole){
                    screenController.isLoading(true);
                    screenController.employeeRoleDropDownValue = listElementRole!;
                    log("categoryDropDownValue : ${screenController.employeeRoleDropDownValue.name}");
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }


}

class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.addRestaurantEmployeeFunction();
      },
      child: Container(
        // height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
