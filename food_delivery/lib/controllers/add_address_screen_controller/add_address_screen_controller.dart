import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:food_delivery/models/add_address_model/add_address_model.dart';
import 'package:food_delivery/models/get_all_address_model/get_all_address_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddAddressScreenController extends GetxController{
  RxString addressType = 'Surat'.obs;
  RxString cityType = 'Surat'.obs;
  RxString areaType = 'Surat'.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController address1FieldController = TextEditingController();
  TextEditingController address2FieldController = TextEditingController();
  TextEditingController landmarkFieldController = TextEditingController();
  TextEditingController pincodeFieldController = TextEditingController();



  addAddressFunction() async {
    isLoading(true);
    String url = ApiUrl.addAddressAPI;
    log("Add Address API URL : $url");

    try {
      Map<String, dynamic> data =
      {
        "Address1" : "${address1FieldController.text.trim()}",
        "Address2" : "${address2FieldController.text.trim()}",
        "Country" : "61f8f5731467b5c3867ba63d",
        "State" : "62458e8d9664db907f4a1b5b",
        "City" : "62708a900ae0bb08965b487a",
        "LandMark" : "${landmarkFieldController.text.trim()}",
        "Pincode" : "${pincodeFieldController.text.trim()}",
        "UserId" : "${UserDetails.userId}"
      };
      log("Data :: $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("Add Address Response : ${response.body}");

      AddAddressModel addAddressModel = AddAddressModel.fromJson(json.decode(response.body));
      isSuccessStatus = addAddressModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: addAddressModel.message);
        clearAddressData();
      } else {
        log("Add Address Function Else Else");
      }

    } catch(e) {
      log("Add Address Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  clearAddressData(){
    address1FieldController.clear();
    address2FieldController.clear();
    landmarkFieldController.clear();
    pincodeFieldController.clear();
  }


}