import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/employee_screen_controller/employee_screen_controller.dart';
import '../../models/employee_models/get_all_restaurant_employee_model.dart';
import 'add_employee_screen/add_employee_screen.dart';
import 'update_employee_alert_dialog_widgets/update_employee_alert_dialog_widgets.dart';

class EmployeeListModule extends StatelessWidget {
  EmployeeListModule({Key? key}) : super(key: key);
  final screenController = Get.find<EmployeeScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.employeeList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        RestaurantEmployee singleEmployee = screenController.employeeList[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 35,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage("${ApiUrl.ApiMainPath}""${singleEmployee.image}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 65,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${singleEmployee.firstName} ${singleEmployee.lastName}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${singleEmployee.employeeRole.name}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${singleEmployee.email}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${singleEmployee.phone}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            GestureDetector(
                              onTap: () {
                                screenController.isLoading(true);
                                screenController.updateFNameFieldController.text = singleEmployee.firstName;
                                screenController.updateLNameFieldController.text = singleEmployee.lastName;
                                screenController.updatePhoneFieldController.text = singleEmployee.phone;
                                screenController.updateEmailFieldController.text = singleEmployee.email;

                                for(int i = 0; i < screenController.getEmployeeRoleList.length; i++) {
                                  if(screenController.getEmployeeRoleList[i].id == singleEmployee.employeeRole.id) {
                                    screenController.updateEmployeeRoleDropDownValue = screenController.getEmployeeRoleList[i];
                                    log("updateEmployeeRoleDropDownValue : ${screenController.updateEmployeeRoleDropDownValue}");
                                  }
                                }

                                editEmployeeAlertDialog(context, singleEmployee);
                                screenController.isLoading(false);
                              },
                              child: Icon(
                                  Icons.edit_rounded,
                                color: Colors.grey,
                              ),
                            ),

                            GestureDetector(
                              onTap: () async {
                                await screenController.deleteEmployeeFunction(employeeId: "${singleEmployee.id}");
                              },
                              child: Icon(
                                Icons.delete_rounded,
                                color: Colors.red,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  editEmployeeAlertDialog(BuildContext context, RestaurantEmployee singleEmployee) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Obx(
                ()=> screenController.isLoading.value
                ? CustomCircularProgressIndicator()
                : StatefulBuilder(builder: (context, setState2) {
              return AlertDialog(
                content: Form(
                  key: screenController.updateAddEmployeeFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Update Employee",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            screenController.updateEmployeeProfileImage != null
                                ? ClipRRect(
                              borderRadius:
                              BorderRadius.circular(80.0),
                              child: Image.file(
                                  screenController
                                      .updateEmployeeProfileImage!,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill),
                            )
                                : ClipRRect(
                              borderRadius:
                              BorderRadius.circular(80.0),
                              child: Image.network(
                                  "${ApiUrl.ApiMainPath}${singleEmployee.image}",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill),
                            ),
                            GestureDetector(
                              onTap: () {
                                _showImagePicker(context);
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
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Expanded(child: UpdateFNameFieldModule()),
                            const SizedBox(width: 15),
                            Expanded(child: UpdateLNameFieldModule()),
                          ],
                        ),

                        // UpdateFNameFieldModule(),
                        const SizedBox(height: 8),

                        UpdatePhoneTextFieldModule(),
                        const SizedBox(height: 8),

                        UpdateEmailTextFieldModule(),
                        const SizedBox(height: 8),

                        // UpdatePasswordTextFieldModule(),
                        // const SizedBox(height: 8),

                        UpdateEmployeeRoleDropDownModule(),
                        const SizedBox(height: 16),

                        UpdateSubmitButton(employeeId: singleEmployee.id),
                        const SizedBox(height: 8),

                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }
    );
  }

  void _showImagePicker(context) {
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
      screenController.updateEmployeeProfileImage = File(image.path);
      screenController.loadUI();
    } else{}
  }
  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.updateEmployeeProfileImage = File(image.path);
      screenController.loadUI();
    } else{}
  }


}

class AddEmployeeButton extends StatelessWidget {
  const AddEmployeeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> AddEmployeeScreen(), transition: Transition.zoom),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_rounded, color: Colors.white),
              const SizedBox(width: 5),
              Text(
                "Add Employee",
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


