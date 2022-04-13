import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/api_url.dart';
import '../../common/store_details.dart';
import '../../models/category_models/get_restaurants_category.dart';
import '../../models/sub_category_models/add_sub_category_model.dart';
import '../../models/sub_category_models/delete_sub_category_model.dart';
import '../../models/sub_category_models/get_all_sub_category_model.dart';
import '../../models/sub_category_models/update_sub_category_model.dart';


class SubCategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  /// Restaurant Category DD
  RxList<RestaurantCategory> getRestaurantCategoryList = [RestaurantCategory(name: "Select Category", id: "0")].obs;
  RestaurantCategory categoryDropDownValue = RestaurantCategory();
  RestaurantCategory updateCategoryDropDownValue = RestaurantCategory();

  /// Add New Sub Category Field
  GlobalKey<FormState> subCategoryFormKey = GlobalKey();
  TextEditingController subCategoryFieldController = TextEditingController();
  File? subCategoryImage;

  /// Update Sub Category Field
  GlobalKey<FormState> updateSubCategoryFormKey = GlobalKey();
  TextEditingController updateSubCategoryFieldController = TextEditingController();
  File? updateSubCategoryImage;

  List<AllSubcategory> allSubCategoryList = [];


  /// Add Sub Category
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
      request.fields['Restaurant'] = "${StoreDetails.storeId}";

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
      // isLoading(false);
      await getRestaurantAllSubCategoryFunction();
    }

  }

  /// Get Sub Category Function
  getRestaurantAllSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllSubCategoryApi + StoreDetails.storeId;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("response : $response");

      GetAllSubCategoryModel getAllSubCategoryModel = GetAllSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllSubCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        allSubCategoryList.clear();

        for(int i = 0; i < getAllSubCategoryModel.subcategory.length; i++) {
          if(getAllSubCategoryModel.subcategory[i].isActive == true) {
            allSubCategoryList.add(getAllSubCategoryModel.subcategory[i]);
          }
        }
        log("allSubCategoryList : $allSubCategoryList");
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

  /// Delete Sub Category
  deleteRestaurantSubCategoryFunction({required String subCatId}) async {
    isLoading(true);
    String url = ApiUrl.DeleteSubCategoryApi + subCatId;
    log("URL : $url");

    try{
      http.Response response = await http.post(Uri.parse(url));
      log("response : $response");

      DeleteSubCategoryModel deleteSubCategoryModel = DeleteSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteSubCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${deleteSubCategoryModel.message}");
      } else {
       log("deleteRestaurantSubCategoryFunction Else Else");
      }

    } catch(e) {
      log("deleteRestaurantSubCategoryFunction Error : $e");
    } finally {
      // isLoading(false);
      await getRestaurantAllSubCategoryFunction();
    }
  }

  /// Update Sub Category
  updateSubCategoryFunction({required AllSubcategory subCategorySingleItem}) async {
    isLoading(true);
    String url = ApiUrl.UpdateSubCategoryApi + "${subCategorySingleItem.id}";
    log("URL : $url");

    try{

      if(updateSubCategoryImage != null) {

        var stream = http.ByteStream(updateSubCategoryImage!.openRead());
        stream.cast();

        var length = await updateSubCategoryImage!.length();

        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.files.add(await http.MultipartFile.fromPath("Image", updateSubCategoryImage!.path));
        request.fields['Name'] = "${updateSubCategoryFieldController.text.trim()}";
        request.fields['Restaurant'] = "${StoreDetails.storeId}";
        request.fields['Category'] = "${updateCategoryDropDownValue.id}";

        var multiPart = http.MultipartFile('Image', stream, length);

        request.files.add(multiPart);

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateSubCategoryModel updateSubCategoryModel = UpdateSubCategoryModel.fromJson(json.decode(value));
          isSuccessStatus = updateSubCategoryModel.status.obs;

          if(isSuccessStatus.value){
            updateSubCategoryFieldController.clear();
            updateSubCategoryImage!.delete();
            Get.back();
            Fluttertoast.showToast(msg: "${updateSubCategoryModel.message}");
          } else {
            log("updateRestaurantCategoryFunction False False");
          }
        });

      }
      else if(updateSubCategoryImage == null) {

        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.fields['Name'] = "${updateSubCategoryFieldController.text.trim()}";
        request.fields['Restaurant'] = "${StoreDetails.storeId}";
        request.fields['Category'] = "${updateCategoryDropDownValue.id}";

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateSubCategoryModel updateSubCategoryModel = UpdateSubCategoryModel.fromJson(json.decode(value));
          isSuccessStatus = updateSubCategoryModel.status.obs;

          if(isSuccessStatus.value){
            updateSubCategoryFieldController.clear();
            Get.back();
            Fluttertoast.showToast(msg: "${updateSubCategoryModel.message}");
          } else {
            log("updateRestaurantCategoryFunction False False");
          }
        });

      }

    } catch(e) {
      log("updateSubCategoryFunction Error : $e");
    } finally{
      // isLoading(false);
      await getRestaurantAllSubCategoryFunction();
    }

  }


  @override
  void onInit() {
    getRestaurantCategoryFunction();
    super.onInit();
  }

  /// Get Restaurant Category Function
  getRestaurantCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantCategoryApi + StoreDetails.storeId;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GetRestaurantCategoryModel getRestaurantCategoryModel = GetRestaurantCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        getRestaurantCategoryList.clear();

        for(int i = 0; i < getRestaurantCategoryModel.category.length; i++) {
          if(getRestaurantCategoryModel.category[i].isActive == true) {
            getRestaurantCategoryList.add(getRestaurantCategoryModel.category[i]);
          }
        }

        log("getRestaurantCategoryList : $getRestaurantCategoryList");
        categoryDropDownValue = getRestaurantCategoryList[0];
        log("getRestaurantCategoryList Length : ${getRestaurantCategoryList.length}");

      } else {
        log("getRestaurantCategoryFunction Else Else");
      }

    } catch(e) {
      log("getRestaurantCategoryFunction : $e");
    } finally {
      // isLoading(false);
      await getRestaurantAllSubCategoryFunction();
    }

  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}