import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../common/store_details.dart';
import '../../models/add_category_model/add_category_model.dart';
import '../../models/add_product_model/get_restaurants_category.dart';
import '../../models/update_category_model/update_category_model.dart';

class CategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  File? categoryImage;
  File? updateCategoryImage;
  GlobalKey<FormState> categoryFormKey = GlobalKey();
  GlobalKey<FormState> updateCategoryFormKey = GlobalKey();
  TextEditingController categoryFieldController = TextEditingController();
  TextEditingController updateCategoryFieldController = TextEditingController();
  List<RestaurantCategory> getRestaurantCategoryList = [];

  addNewCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.CreateRestaurantCategoryApi;
    log("URL : $url");

    try {
      var stream = http.ByteStream(categoryImage!.openRead());
      stream.cast();

      var length = await categoryImage!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", categoryImage!.path));

      request.fields['Name'] = "${categoryFieldController.text.trim()}";
      request.fields['Restaurant'] = "${StoreDetails.storeId}";

      var multiPart = http.MultipartFile('Image', stream, length);

      request.files.add(multiPart);

      var response = await request.send();


      response.stream.transform(utf8.decoder).listen((value) {
        AddCategoryModel addCategoryModel = AddCategoryModel.fromJson(json.decode(value));
        isSuccessStatus = addCategoryModel.status.obs;
        
        if(isSuccessStatus.value){
          categoryFieldController.clear();
          categoryImage!.delete();
          Fluttertoast.showToast(msg: "${addCategoryModel.message}");
        } else {
          log("addNewCategoryFunction : $addNewCategoryFunction");
        }
      });

    } catch(e) {
      log("addNewCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  /// Get Restaurant Category Function
  getRestaurantCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantCategoryApi + "622b09a668395c49dcb4aa73"/*StoreDetails.storeId*/;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GetRestaurantCategoryModel getRestaurantCategoryModel = GetRestaurantCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        getRestaurantCategoryList.addAll(getRestaurantCategoryModel.category);
        log("getRestaurantCategoryList Length : ${getRestaurantCategoryList.length}");
      }

    } catch(e) {
      log("getRestaurantCategoryFunction : $e");
    } finally {
      isLoading(false);
    }

  }

  updateRestaurantCategoryFunction({required String catId}) async {
    isLoading(true);
    String url = ApiUrl.UpdateRestaurantCategoryApi + catId;
    log("URL : $url");

    try {
      var stream = http.ByteStream(updateCategoryImage!.openRead());
      stream.cast();

      var length = await updateCategoryImage!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", updateCategoryImage!.path));
      request.fields['Name'] = "${updateCategoryFieldController.text.trim()}";

      var multiPart = http.MultipartFile('Image', stream, length);

      request.files.add(multiPart);

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        UpdateCategoryModel updateCategoryModel = UpdateCategoryModel.fromJson(json.decode(value));
        isSuccessStatus = updateCategoryModel.status.obs;

        if(isSuccessStatus.value){
          updateCategoryFieldController.clear();
          updateCategoryImage!.delete();
          Fluttertoast.showToast(msg: "${updateCategoryModel.message}");
        } else {
          log("updateRestaurantCategoryFunction False False");
        }
      });

    } catch(e) {
      log("updateRestaurantCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }


  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    getRestaurantCategoryFunction();
    super.onInit();
  }

}