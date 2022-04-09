import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/employee_screen_controller/employee_screen_controller.dart';
import 'employee_screen_widgets.dart';

class EmployeeScreen extends StatelessWidget {
  EmployeeScreen({Key? key}) : super(key: key);
  final employeeScreenController = Get.put(EmployeeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Employee"),
      body: Obx(
        () => employeeScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EmployeeListModule(),
                      ),
                      AddEmployeeButton(),
                    ],
                  ),
              ),
            ),
      ),
    );
  }
}
