import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';
import '../../models/employee_models/add_restaurant_employee_model.dart';
import '../../models/employee_models/delete_restaurant_employee_model.dart';
import '../../models/employee_models/get_all_restaurant_employee_model.dart';
import '../../models/employee_models/update_restaurant_employee_model.dart';
import '../../models/employee_role_models/get_all_employee_role_model.dart';

class EmployeeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<RestaurantEmployee> employeeList = [];

  /// Add Employee Fields
  GlobalKey<FormState> addEmployeeFormKey = GlobalKey();
  File? employeeProfileImage;
  TextEditingController fNameFieldController = TextEditingController();
  TextEditingController lNameFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();


  /// Get Employee Role DD List
  RxList<ListElementRole> getEmployeeRoleList = [ListElementRole(name: "Select Role", id: "0")].obs;
  ListElementRole employeeRoleDropDownValue = ListElementRole();
  ListElementRole updateEmployeeRoleDropDownValue = ListElementRole();

  /// Update EmployeeFields
  GlobalKey<FormState> updateAddEmployeeFormKey = GlobalKey();
  File? updateEmployeeProfileImage;
  TextEditingController updateFNameFieldController = TextEditingController();
  TextEditingController updateLNameFieldController = TextEditingController();
  TextEditingController updatePhoneFieldController = TextEditingController();
  TextEditingController updateEmailFieldController = TextEditingController();


  /// Get All Employee
  getRestaurantAllEmployeeFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantEmployeeApi + "622b09a668395c49dcb4aa73";
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllRestaurantEmployeeModel getAllRestaurantEmployeeModel = GetAllRestaurantEmployeeModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllRestaurantEmployeeModel.status.obs;

      if(isSuccessStatus.value) {
        employeeList.clear();

        for(int i = 0; i < getAllRestaurantEmployeeModel.employee.length; i++) {
          if(getAllRestaurantEmployeeModel.employee[i].isActive == true){
            employeeList.add(getAllRestaurantEmployeeModel.employee[i]);
          }
        }

        log("employeeList : $employeeList");
      } else {
        log("getRestaurantAllEmployeeFunction Else Else");
      }

    } catch(e) {
      log("getRestaurantAllEmployeeFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  /// Get Restaurant All Role
  getAllEmployeeRoleFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllEmployeeRoleAPI;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetEmployeeRoleModel getEmployeeRoleModel = GetEmployeeRoleModel.fromJson(json.decode(response.body));
      isSuccessStatus = getEmployeeRoleModel.status.obs;

      if(isSuccessStatus.value) {
        getEmployeeRoleList.clear();

        for(int i = 0; i < getEmployeeRoleModel.list.length; i++) {
          if(getEmployeeRoleModel.list[i].isActive == true) {
            getEmployeeRoleList.add(getEmployeeRoleModel.list[i]);
          }
        }

        employeeRoleDropDownValue = getEmployeeRoleList[0];
        log("getEmployeeRoleList : ${getEmployeeRoleList.length}");
      } else {
        log("getAllEmployeeRoleFunction Else Else");
      }

    } catch(e) {
      log("getAllEmployeeRoleFunction Error : $e");
    } finally {
      // isLoading(false);
      await getRestaurantAllEmployeeFunction();
    }
  }

  /// Add Employee
  addRestaurantEmployeeFunction() async {
    isLoading(true);
    String url = ApiUrl.AddRestaurantEmployeeApi;
    log("URL : $url");

    try{

      var stream = http.ByteStream(employeeProfileImage!.openRead());
      stream.cast();

      var length = await employeeProfileImage!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", employeeProfileImage!.path));

      request.fields['FirstName'] = "${fNameFieldController.text.trim()}";
      request.fields['LastName'] = "${lNameFieldController.text.trim()}";
      request.fields['Phone'] = "${phoneFieldController.text.trim()}";
      request.fields['Email'] = "${emailFieldController.text.trim()}";
      request.fields['Password'] = "${passwordFieldController.text.trim()}";
      request.fields['EmployeeRole'] = "${employeeRoleDropDownValue.id}";
      request.fields['Restaurant'] = "622b09a668395c49dcb4aa73" /*"${StoreDetails.storeId}"*/;

      var multiPart = http.MultipartFile('Image', stream, length);

      request.files.add(multiPart);
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        AddRestaurantEmployeeModel addRestaurantEmployeeModel = AddRestaurantEmployeeModel.fromJson(json.decode(value));
        isSuccessStatus = addRestaurantEmployeeModel.status.obs;

        if(isSuccessStatus.value){
          Fluttertoast.showToast(msg: "${addRestaurantEmployeeModel.message}");
          Get.back();
        } else {
          print('addRestaurantEmployeeFunction False False');
        }
      });

    } catch(e) {
      log("addRestaurantEmployeeFunction Error : $e");
    } finally {
      // isLoading(false);
      await getRestaurantAllEmployeeFunction();
    }
  }

  /// Delete Employee
  deleteEmployeeFunction({required String employeeId}) async {
    isLoading(true);
    String url = ApiUrl.DeleteRestaurantEmployeeApi + employeeId;
    log("URL : $url");

    try{
      http.Response response = await http.post(Uri.parse(url));
      log("response : ${response.body}");

      DeleteEmployeeModel deleteEmployeeModel = DeleteEmployeeModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteEmployeeModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${deleteEmployeeModel.message}");
      } else {
        log("deleteEmployeeFunction Else Else");
      }

    } catch(e) {
      log("deleteEmployeeFunction Error : $e");
    } finally{
      // isLoading(false);
      await getRestaurantAllEmployeeFunction();
    }

  }

  /// Update Employee
  updateEmployeeFunction({required String employeeId}) async {
    isLoading(true);
    String url = ApiUrl.UpdateRestaurantEmployeeApi + employeeId;
    log("URL : $url");

    try {

      if(updateEmployeeProfileImage != null) {

        var stream = http.ByteStream(updateEmployeeProfileImage!.openRead());
        stream.cast();
        var length = await updateEmployeeProfileImage!.length();
        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.files.add(await http.MultipartFile.fromPath("Image", updateEmployeeProfileImage!.path));
        request.fields['FirstName'] = "${updateFNameFieldController.text.trim()}";
        request.fields['LastName'] = "${updateLNameFieldController.text.trim()}";
        request.fields['Phone'] = "${updatePhoneFieldController.text.trim()}";
        request.fields['Email'] = "${updateEmailFieldController.text.trim()}";
        request.fields['EmployeeRole'] = "${updateEmployeeRoleDropDownValue.id}";

        var multiPart = http.MultipartFile('Image', stream, length);

        request.files.add(multiPart);
        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateEmployeeModel updateEmployeeModel = UpdateEmployeeModel.fromJson(json.decode(value));
          isSuccessStatus = updateEmployeeModel.status.obs;
          log("isSuccessStatus : $isSuccessStatus");

          if(isSuccessStatus.value){
            Fluttertoast.showToast(msg: "${updateEmployeeModel.message}");
            Get.back();
          } else {
            print('updateEmployeeFunction False False');
          }
        });


      } else if(updateEmployeeProfileImage == null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.fields['FirstName'] = "${updateFNameFieldController.text.trim()}";
        request.fields['LastName'] = "${updateLNameFieldController.text.trim()}";
        request.fields['Phone'] = "${updatePhoneFieldController.text.trim()}";
        request.fields['Email'] = "${updateEmailFieldController.text.trim()}";
        request.fields['EmployeeRole'] = "${updateEmployeeRoleDropDownValue.id}";

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateEmployeeModel updateEmployeeModel = UpdateEmployeeModel.fromJson(json.decode(value));
          isSuccessStatus = updateEmployeeModel.status.obs;
          log("isSuccessStatus : $isSuccessStatus");

          if(isSuccessStatus.value){
            Fluttertoast.showToast(msg: "${updateEmployeeModel.message}");
            Get.back();
          } else {
            print('updateEmployeeFunction False False');
          }
        });

      }

    } catch(e) {
      log("updateEmployeeFunction Error : $e");
    } finally {
      // isLoading(false);
      await getRestaurantAllEmployeeFunction();
    }

  }

  @override
  void onInit() {
    // getRestaurantAllEmployeeFunction();
    getAllEmployeeRoleFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }


}