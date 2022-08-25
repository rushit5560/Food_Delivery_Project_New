import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../common/store_details.dart';
import '../../models/delivery_man_models/add_delivery_man_model.dart';
import '../../models/delivery_man_models/delete_delivery_man_model.dart';
import '../../models/delivery_man_models/get_all_delivery_man_model.dart';
import '../../models/delivery_man_models/get_all_area_model.dart';
import '../../models/delivery_man_models/update_delivery_man_model.dart';

class DeliveryManScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<DeliveryManGetList> allDeliveryManList = [];

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

  /// Update Delivery Boy Fields Data
  GlobalKey<FormState> updateDeliveryBoyFormKey = GlobalKey();
  TextEditingController updateFNameFieldController = TextEditingController();
  TextEditingController updateLNameFieldController = TextEditingController();
  TextEditingController updatePhoneFieldController = TextEditingController();
  TextEditingController updateAddressFieldController = TextEditingController();
  TextEditingController updateIdentityNumberFieldController =
      TextEditingController();
  TextEditingController updateEmailFieldController = TextEditingController();
  File? updateDeliveryBoyImgFile;
  File? updateIdentityImgFile;
  RxString deliveryManType = 'Freelancer'.obs;
  RxString deliveryManGender = 'Male'.obs;
  RxString deliveryManIdentity = 'passport'.obs;
  GetZoneList updateZoneDropDownValue = GetZoneList();

  /// Get All DeliveryMan List Function
  getAllDeliveryManFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllDeliveryManApi + StoreDetails.storeId;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllDeliveryManModel getAllDeliveryManModel = GetAllDeliveryManModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllDeliveryManModel.status.obs;

      if (isSuccessStatus.value) {
        allDeliveryManList.clear();

        for (int i = 0; i < getAllDeliveryManModel.getList.length; i++) {
          if (getAllDeliveryManModel.getList[i].isActive == true) {
            allDeliveryManList.add(getAllDeliveryManModel.getList[i]);
          }
        }

        log("allDeliveryManList : $allDeliveryManList");
      } else {
        log("getAllDeliveryManFunction Else Else");
      }
    } catch (e) {
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

      GetAllAreaModel getAllAreaModel =
          GetAllAreaModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAreaModel.status.obs;

      if (isSuccessStatus.value) {
        if (getAllAreaModel.getList.length == 0) {
          allZoneList.add(GetZoneList(id: "0", areaName: "Select Area"));
        } else {
          allZoneList.addAll(getAllAreaModel.getList);
        }

        log("allZoneList : $allZoneList");
      } else {
        log("getAllAreaFunction Else Else");
      }
    } catch (e) {
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

      request.files.add(
          await http.MultipartFile.fromPath('Image', deliveryBoyImgFile!.path));
      request.files.add(await http.MultipartFile.fromPath(
          'IdentityImage', identityImgFile!.path));

      request.fields["FirstName"] = "${firstNameFieldController.text.trim()}";
      request.fields["LastName"] = "${lastNameFieldController.text.trim()}";
      request.fields["Zone"] = "${allZoneDropDownValue.id}";
      request.fields["IdentityType"] = "$identityTypeValue";
      request.fields["IdentityNumber"] =
          "${identityNumberFieldController.text.trim()}";
      request.fields["Phone"] = "${phoneFieldController.text.trim()}";
      request.fields["Password"] = "${passwordFieldController.text.trim()}";
      request.fields["Email"] = "${emailFieldController.text.trim()}";
      request.fields["Address"] = "${addressFieldController.text.trim()}";
      request.fields["Restaurant"] = "${StoreDetails.storeId}";

      var multiPart = http.MultipartFile('Image', stream, length);
      var multiPart1 = http.MultipartFile('IdentityImage', stream1, length1);

      request.files.add(multiPart);
      request.files.add(multiPart1);

      print('request.fields: ${request.fields}');
      print('request.files: ${request.files}');

      var response = await request.send();
      print('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        log('value1: $value');
        AddDeliveryManModel addDeliveryManModel =
            AddDeliveryManModel.fromJson(json.decode(value));
        print('response1 ::::::${addDeliveryManModel.status}');
        isSuccessStatus = addDeliveryManModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "${addDeliveryManModel.message}");
        } else {
          print('False False');
        }
      });
    } catch (e) {
      log("addDeliveryBoyFunction Error : $e");
    } finally {
      isLoading(false);
      await getAllDeliveryManFunction();
    }
  }

  /// Delete Delivery Boy
  deleteDeliveryBoyByIdFunction({required String deliveryBoyId}) async {
    isLoading(true);
    String url = ApiUrl.DeleteDeliveryManApi + deliveryBoyId;
    log("URL : $url");

    try {
      http.Response response = await http.post(Uri.parse(url));
      log("Response : $response");

      DeleteDeliveryManModel deleteDeliveryManModel =
          DeleteDeliveryManModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteDeliveryManModel.status.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${deleteDeliveryManModel.message}");
      } else {
        log("deleteDeliveryBoyByIdFunction Else Else");
      }
    } catch (e) {
      log("deleteDeliveryBoyByIdFunction Error :: $e");
    } finally {
      // isLoading(false);
      await getAllDeliveryManFunction();
    }
  }

  /// Update Delivery Boy
  updateDeliveryBoyByIdFunction({required String deliveryBoyId}) async {
    isLoading(true);
    String url = ApiUrl.UpdateDeliveryManApi + deliveryBoyId;
    log("URL : $url");

    try {

      if (updateDeliveryBoyImgFile == null && updateIdentityImgFile == null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.fields['FirstName'] = "${updateFNameFieldController.text.trim()}";
        request.fields['LastName'] = "${updateLNameFieldController.text.trim()}";
        request.fields['Phone'] = "${updatePhoneFieldController.text.trim()}";
        request.fields['Gender'] = "$deliveryManGender";
        request.fields['Zone'] = "${updateZoneDropDownValue.id}";
        request.fields['Restaurant'] = "${StoreDetails.storeId}";
        request.fields['Address'] = "${updateAddressFieldController.text.trim()}";
        request.fields['IdentityType'] = "$deliveryManIdentity";
        request.fields['Email'] = "${updateEmailFieldController.text.trim()}";

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateDeliveryManModel updateDeliveryManModel =
              UpdateDeliveryManModel.fromJson(json.decode(value));
          isSuccessStatus = updateDeliveryManModel.status.obs;
          log("isSuccessStatus : $isSuccessStatus");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: "${updateDeliveryManModel.message}");
            Get.back();
          } else {
            print('False False');
          }
        });
      }
      else if (updateDeliveryBoyImgFile == null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream1 = http.ByteStream(updateIdentityImgFile!.openRead());
        var length1 = await updateIdentityImgFile!.length();

        request.files.add(await http.MultipartFile.fromPath("IdentityImage", updateIdentityImgFile!.path));

        request.fields['FirstName'] = "${updateFNameFieldController.text.trim()}";
        request.fields['LastName'] = "${updateLNameFieldController.text.trim()}";
        request.fields['Phone'] = "${updatePhoneFieldController.text.trim()}";
        request.fields['Gender'] = "$deliveryManGender";
        request.fields['Zone'] = "${updateZoneDropDownValue.id}";
        request.fields['Restaurant'] = "${StoreDetails.storeId}";
        request.fields['Address'] = "${updateAddressFieldController.text.trim()}";
        request.fields['IdentityType'] = "$deliveryManIdentity";
        request.fields['Email'] = "${updateEmailFieldController.text.trim()}";

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        var multiPart1 = http.MultipartFile('IdentityImage', stream1, length1);
        request.files.add(multiPart1);

        var response = await request.send();
        print('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateDeliveryManModel updateDeliveryManModel =
              UpdateDeliveryManModel.fromJson(json.decode(value));
          isSuccessStatus = updateDeliveryManModel.status.obs;
          log("isSuccessStatus : $isSuccessStatus");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: "${updateDeliveryManModel.message}");
            Get.back();
          } else {
            print('False False');
          }
        });
      }
      else if (updateIdentityImgFile == null) {
        var stream = http.ByteStream(updateDeliveryBoyImgFile!.openRead());
        stream.cast();
        var length = await updateDeliveryBoyImgFile!.length();
        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.files.add(await http.MultipartFile.fromPath("Image", updateDeliveryBoyImgFile!.path));

        request.fields['FirstName'] = "${updateFNameFieldController.text.trim()}";
        request.fields['LastName'] = "${updateLNameFieldController.text.trim()}";
        request.fields['Phone'] = "${updatePhoneFieldController.text.trim()}";
        request.fields['Gender'] = "$deliveryManGender";
        request.fields['Zone'] = "${updateZoneDropDownValue.id}";
        request.fields['Restaurant'] = "${StoreDetails.storeId}";
        request.fields['Address'] = "${updateAddressFieldController.text.trim()}";
        request.fields['IdentityType'] = "$deliveryManIdentity";
        request.fields['Email'] = "${updateEmailFieldController.text.trim()}";

        var multiPart = http.MultipartFile('Image', stream, length);
        request.files.add(multiPart);

        var response = await request.send();
        print('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateDeliveryManModel updateDeliveryManModel =
              UpdateDeliveryManModel.fromJson(json.decode(value));
          isSuccessStatus = updateDeliveryManModel.status.obs;
          log("isSuccessStatus : $isSuccessStatus");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: "${updateDeliveryManModel.message}");
            Get.back();
          } else {
            print('False False');
          }
        });
      }
      else {
        var stream = http.ByteStream(updateDeliveryBoyImgFile!.openRead());
        stream.cast();
        var length = await updateDeliveryBoyImgFile!.length();
        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.files.add(await http.MultipartFile.fromPath(
            "Image", updateDeliveryBoyImgFile!.path));

        var stream1 = http.ByteStream(updateIdentityImgFile!.openRead());
        stream.cast();
        var length1 = await updateIdentityImgFile!.length();

        request.files.add(await http.MultipartFile.fromPath(
            "IdentityImage", updateIdentityImgFile!.path));

        request.fields['FirstName'] = "${updateFNameFieldController.text.trim()}";
        request.fields['LastName'] = "${updateLNameFieldController.text.trim()}";
        request.fields['Phone'] = "${updatePhoneFieldController.text.trim()}";
        request.fields['Gender'] = "$deliveryManGender";
        request.fields['Zone'] = "${updateZoneDropDownValue.id}";
        request.fields['Restaurant'] = "${StoreDetails.storeId}";
        request.fields['Address'] = "${updateAddressFieldController.text.trim()}";
        request.fields['IdentityType'] = "$deliveryManIdentity";
        request.fields['Email'] = "${updateEmailFieldController.text.trim()}";

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        var multiPart = http.MultipartFile('Image', stream, length);
        request.files.add(multiPart);
        var multiPart1 = http.MultipartFile('IdentityImage', stream1, length1);
        request.files.add(multiPart1);

        var response = await request.send();
        print('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateDeliveryManModel updateDeliveryManModel =
              UpdateDeliveryManModel.fromJson(json.decode(value));
          isSuccessStatus = updateDeliveryManModel.status.obs;
          log("isSuccessStatus : $isSuccessStatus");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: "${updateDeliveryManModel.message}");
            Get.back();
          } else {
            print('False False');
          }
        });
      }

    } catch (e) {
      log("updateDeliveryBoyByIdFunction Error :: $e");
    } finally {
      // isLoading(false);
      await getAllDeliveryManFunction();
    }
  }

  @override
  void onInit() {
    getAllDeliveryManFunction();

    allZoneDropDownValue = allZoneList[0];
    updateZoneDropDownValue = allZoneList[0];
    log('updateZoneDropDownValue: ${updateZoneDropDownValue.areaName}');
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
