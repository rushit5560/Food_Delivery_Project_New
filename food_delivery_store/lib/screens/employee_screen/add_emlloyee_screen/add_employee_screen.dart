import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../controllers/employee_screen_controller/employee_screen_controller.dart';
import 'add_employee_screen_widgets.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmployeeScreen({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Add Employee"),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddEmployeeForm(),
            ],
          ),
        ),
      ),
    );
  }
}
