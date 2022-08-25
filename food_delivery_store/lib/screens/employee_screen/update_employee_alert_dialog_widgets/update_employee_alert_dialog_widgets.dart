import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/field_validation.dart';
import '../../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../../controllers/employee_screen_controller/employee_screen_controller.dart';
import '../../../models/employee_role_models/get_all_employee_role_model.dart';

class UpdateFNameFieldModule extends StatelessWidget {
  UpdateFNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.updateFNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "First Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class UpdateLNameFieldModule extends StatelessWidget {
  UpdateLNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.updateLNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Last Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class UpdatePhoneTextFieldModule extends StatelessWidget {
  UpdatePhoneTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: screenController.updatePhoneFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Phone No"),
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class UpdateEmailTextFieldModule extends StatelessWidget {
  UpdateEmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: screenController.updateEmailFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Email"),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class UpdateEmployeeRoleDropDownModule extends StatelessWidget {
  UpdateEmployeeRoleDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return employeeRoleDropDown(context);
  }

  employeeRoleDropDown(context) {
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

                  value: screenController.updateEmployeeRoleDropDownValue,

                  items: screenController.getEmployeeRoleList
                      .map<DropdownMenuItem<ListElementRole>>((ListElementRole listElementRole) {
                    return DropdownMenuItem<ListElementRole>(
                      value: listElementRole,
                      child: Text(
                        "${listElementRole.roleName}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (listElementRole){
                    screenController.isLoading(true);
                    screenController.updateEmployeeRoleDropDownValue = listElementRole!;
                    log("categoryDropDownValue : ${screenController.updateEmployeeRoleDropDownValue.roleName}");
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }


}


class UpdateSubmitButton extends StatelessWidget {
  final String employeeId;
  UpdateSubmitButton({Key? key, required this.employeeId}) : super(key: key);

  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.updateEmployeeFunction(employeeId: employeeId);
      },
      child: Container(
        // height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            "Update",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
