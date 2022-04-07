import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../models/delivery_man_models/add_delivery_man_model.dart';
import '../../models/delivery_man_models/get_all_delivery_man_model.dart';
import '../../models/delivery_man_models/get_all_area_model.dart';

class DeliveryManScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<GetList> allDeliveryManList = [];

  /// All Zone DropDown List
  RxList<GetZoneList> allZoneList = [GetZoneList(areaName: "Select Area", id: "0")].obs;
  GetZoneList allZoneDropDownValue = GetZoneList();

  /// Add Delivery Boy Fields Data
  GlobalKey<FormState> addDeliveryBoyFormKey = GlobalKey();
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController identityNumberFieldController = TextEditingController();
  File? deliveryBoyImgFile;
  File? identityImgFile;
  RxString identityTypeValue = 'Aadhaar Card'.obs;


  /// Get All DeliveryMan List Function
  getAllDeliveryManFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllDeliveryManApi + "622b09a668395c49dcb4aa73" /*StoreDetails.storeId*/;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllDeliveryManModel getAllDeliveryManModel = GetAllDeliveryManModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllDeliveryManModel.status.obs;

      if(isSuccessStatus.value) {
        allDeliveryManList.addAll(getAllDeliveryManModel.getList);
        log("allDeliveryManList : $allDeliveryManList");
      } else {
        log("getAllDeliveryManFunction Else Else");
      }

    } catch(e) {
      log("getAllDeliveryManFunction Error : $e");
    } finally {
      // isLoading(false);
      await getAllAreaFunction();
    }
  }


  /// Get All Zone List Function
  getAllAreaFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllZoneApi;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllAreaModel getAllAreaModel = GetAllAreaModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAreaModel.status.obs;

      if(isSuccessStatus.value) {

        if(getAllAreaModel.getList.length == 0) {
          allZoneList.add(GetZoneList(id: "0", areaName: "Select Area"));
        } else {
          allZoneList.addAll(getAllAreaModel.getList);
        }

        log("allZoneList : $allZoneList");
      } else {
        log("getAllAreaFunction Else Else");
      }

    } catch(e) {
      log("getAllAreaFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add New Delivery Boy Function
  addDeliveryBoyFunction() async {
    isLoading(true);
    String url = ApiUrl.AddDeliveryManApi;
    log("URL : $url");

    try {
      var stream = http.ByteStream(deliveryBoyImgFile!.openRead());
      stream.cast();
      var stream1 = http.ByteStream(identityImgFile!.openRead());
      stream1.cast();

      var length = await deliveryBoyImgFile!.length();
      var length1 = await identityImgFile!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath('Image', deliveryBoyImgFile!.path));
      request.files.add(await http.MultipartFile.fromPath('IdentityImage', identityImgFile!.path));

      request.fields["FirstName"] = "${firstNameFieldController.text.trim()}";
      request.fields["LastName"] = "${lastNameFieldController.text.trim()}";
      request.fields["Zone"] = "${allZoneDropDownValue.id}";
      request.fields["IdentityType"] = "$identityTypeValue";
      request.fields["IdentityNumber"] = "${identityNumberFieldController.text.trim()}";
      request.fields["Phone"] = "${phoneFieldController.text.trim()}";
      request.fields["Password"] = "${passwordFieldController.text.trim()}";
      request.fields["Email"] = "${emailFieldController.text.trim()}";
      request.fields["Address"] = "${addressFieldController.text.trim()}";
      request.fields["Restaurant"] = "622b09a668395c49dcb4aa73" /*"${StoreDetails.storeId}"*/;


      var multiPart = http.MultipartFile('Image', stream, length);
      var multiPart1 = http.MultipartFile('IdentityImage', stream1, length1);

      request.files.add(multiPart);
      request.files.add(multiPart1);

      print('request.fields: ${request.fields}');
      print('request.files: ${request.files}');

      var response = await request.send();
      print('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        AddDeliveryManModel addDeliveryManModel = AddDeliveryManModel.fromJson(json.decode(value));
        print('response1 ::::::${addDeliveryManModel.status}');
        isSuccessStatus = addDeliveryManModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value){
          Fluttertoast.showToast(msg: "${addDeliveryManModel.message}");
        } else {
          print('False False');
        }
      });

    } catch(e) {
      log("addDeliveryBoyFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getAllDeliveryManFunction();

    allZoneDropDownValue = allZoneList[0];
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}