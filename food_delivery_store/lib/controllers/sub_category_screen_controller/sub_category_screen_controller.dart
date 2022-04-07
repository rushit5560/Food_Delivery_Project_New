import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../models/add_product_model/get_restaurants_category.dart';
import '../../models/sub_category_models/add_sub_category_model.dart';
import '../../models/sub_category_models/get_all_sub_category_model.dart';

class SubCategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  /// Restaurant Category DD
  RxList<RestaurantCategory> getRestaurantCategoryList = [RestaurantCategory(name: "Select Category", id: "0")].obs;
  RestaurantCategory categoryDropDownValue = RestaurantCategory();

  GlobalKey<FormState> subCategoryFormKey = GlobalKey();
  TextEditingController subCategoryFieldController = TextEditingController();
  File? subCategoryImage;

  List<AllSubcategory> allSubCategoryList = [];


  /// Get Restaurant Category Function
  getRestaurantCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantCategoryApi + "622b09a668395c49dcb4aa73" /*StoreDetails.storeId*/;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GetRestaurantCategoryModel getRestaurantCategoryModel = GetRestaurantCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        getRestaurantCategoryList.addAll(getRestaurantCategoryModel.category);
        log("getRestaurantCategoryList : $getRestaurantCategoryList");
        categoryDropDownValue = getRestaurantCategoryList[0];
        log("getRestaurantCategoryList Length : ${getRestaurantCategoryList.length}");
      }

    } catch(e) {
      log("getRestaurantCategoryFunction : $e");
    } finally {
      // isLoading(false);
      await getRestaurantAllSubCategoryFunction();
    }

  }

  addSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.CreateSubCategoryApi;
    log("URL : $url");

    try {

      var stream = http.ByteStream(subCategoryImage!.openRead());
      stream.cast();

      var length = await subCategoryImage!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", subCategoryImage!.path));
      request.fields['Name'] = "${subCategoryFieldController.text.trim()}";
      request.fields['Category'] = "${categoryDropDownValue.id}";
      request.fields['Restaurant'] = "622b09a668395c49dcb4aa73" /*"${StoreDetails.storeId}"*/;

      var multiPart = http.MultipartFile('Image', stream, length);

      request.files.add(multiPart);

      var response = await request.send();

      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');

      response.stream.transform(utf8.decoder).listen((value) {
        AddSubCategoryModel addSubCategoryModel = AddSubCategoryModel.fromJson(json.decode(value));
        isSuccessStatus = addSubCategoryModel.status.obs;

        if(isSuccessStatus.value){
          subCategoryFieldController.clear();
          subCategoryImage!.delete();
          Fluttertoast.showToast(msg: "${addSubCategoryModel.message}");
        } else {
          log("addSubCategoryFunction False False");
        }
      });

    } catch(e){
      log("addSubCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }


  }

  /// Get Restaurant Sub Category Function
  getRestaurantAllSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllSubCategoryApi;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllSubCategoryModel getAllSubCategoryModel = GetAllSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllSubCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        allSubCategoryList.addAll(getAllSubCategoryModel.allSubcategory);
        log("allSubCategoryList : ${allSubCategoryList.length}");
      } else {
        log("getRestaurantAllSubCategoryFunction Else Else");
      }

    } catch(e){
      log("getRestaurantAllSubCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getRestaurantCategoryFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}