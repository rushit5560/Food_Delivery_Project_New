import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';
import '../../models/employee_models/get_all_restaurant_employee_model.dart';
import '../../models/employee_role_models/get_all_employee_role_model.dart';

class EmployeeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Employee> employeeList = [];

  /// Add Employee Fields
  TextEditingController fNameFieldController = TextEditingController();
  TextEditingController lNameFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  File? employeeProfileImage;

  /// Get Employee Role DD List
  RxList<ListElementRole> getEmployeeRoleList = [ListElementRole(name: "Select Role", id: "0")].obs;
  ListElementRole employeeRoleDropDownValue = ListElementRole();


  getRestaurantAllEmployeeFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantEmployeeApi + "622b09a668395c49dcb4aa73";
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllRestaurantEmployeeModel getAllRestaurantEmployeeModel = GetAllRestaurantEmployeeModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllRestaurantEmployeeModel.status.obs;

      if(isSuccessStatus.value){
        employeeList.addAll(getAllRestaurantEmployeeModel.employee);
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
        getEmployeeRoleList.addAll(getEmployeeRoleModel.list);
        employeeRoleDropDownValue = getEmployeeRoleList[0];
        log("getEmployeeRoleList : ${getEmployeeRoleList.length}");
      } else {
        log("getAllEmployeeRoleFunction Else Else");
      }

    } catch(e) {
      log("getAllEmployeeRoleFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

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


        if(isSuccessStatus.value){

        } else {
          print('addRestaurantEmployeeFunction False False');
        }
      });

    } catch(e) {
      log("addRestaurantEmployeeFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getRestaurantAllEmployeeFunction();
    getAllEmployeeRoleFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }


}