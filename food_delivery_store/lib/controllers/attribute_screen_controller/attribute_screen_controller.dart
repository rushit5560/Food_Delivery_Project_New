import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/attribute_models/add_attribute_model.dart';
import '../../models/attribute_models/get_all_attribute_model.dart';

class AttributeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> attributeFormKey = GlobalKey();
  TextEditingController attributeNameFieldController = TextEditingController();
  List<ListElementAll> attributeList = [];

  addNewAttributeFunction() async {
    isLoading(true);
    String url = ApiUrl.CreateAttributeApi;
    log("URL : $url");

    try {
      Map<String, dynamic> data = {
        "Name" : "${attributeNameFieldController.text.trim()}"
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      AddAttributeModel addAttributeModel = AddAttributeModel.fromJson(json.decode(response.body));
      isSuccessStatus = addAttributeModel.status.obs;

      if(isSuccessStatus.value) {
        attributeNameFieldController.clear();
        Fluttertoast.showToast(msg: "${addAttributeModel.message}");
      } else {
        log("addNewAttributeFunction Else Else");
      }

    } catch(e) {
      log("addNewAttributeFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  getAllAttributeFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllAttributeApi;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response : ${response.body}");

      GetAllAttributeModel getAllAttributeModel = GetAllAttributeModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAttributeModel.status.obs;

      if(isSuccessStatus.value) {
        attributeList.addAll(getAllAttributeModel.list);
        log("attributeList : $attributeList");
      } else {
        log("getAllAttributeFunction Else Else");
      }

    } catch(e) {
      log("getAllAttributeFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getAllAttributeFunction();
    super.onInit();
  }

}