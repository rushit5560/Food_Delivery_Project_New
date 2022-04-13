import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';
import '../../common/store_details.dart';
import '../../models/category_models/delete_category_model.dart';
import '../../models/category_models/get_restaurants_category.dart';
import '../../models/category_models/add_category_model.dart';
import '../../models/category_models/update_category_model.dart';

class CategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  /// Add Category Fields
  GlobalKey<FormState> categoryFormKey = GlobalKey();
  TextEditingController categoryFieldController = TextEditingController();
  File? categoryImage;

  /// Update Category Fields
  GlobalKey<FormState> updateCategoryFormKey = GlobalKey();
  TextEditingController updateCategoryFieldController = TextEditingController();
  File? updateCategoryImage;

  List<RestaurantCategory> getRestaurantCategoryList = [];

  /// Add New Category
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

  /// Get Restaurant Category
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

        log("getRestaurantCategoryList Length : ${getRestaurantCategoryList.length}");
      }

    } catch(e) {
      log("getRestaurantCategoryFunction : $e");
    } finally {
      isLoading(false);
    }

  }

  /// Update Restaurant Category
  updateRestaurantCategoryFunction({required RestaurantCategory category, String? oldImageFilePath}) async {
    isLoading(true);
    String url = ApiUrl.UpdateRestaurantCategoryApi + "${category.id}";
    log("URL : $url");

    try {

      if(updateCategoryImage != null) {
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
            Get.back();
            Fluttertoast.showToast(msg: "${updateCategoryModel.message}");
          } else {
            log("updateRestaurantCategoryFunction False False");
          }
        });

      }

      else if(updateCategoryImage == null) {

        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.fields['Name'] = "${updateCategoryFieldController.text.trim()}";

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateCategoryModel updateCategoryModel = UpdateCategoryModel.fromJson(json.decode(value));
          isSuccessStatus = updateCategoryModel.status.obs;

          if(isSuccessStatus.value){
            updateCategoryFieldController.clear();
            Get.back();
            Fluttertoast.showToast(msg: "${updateCategoryModel.message}");
          } else {
            log("updateRestaurantCategoryFunction False False");
          }
        });

      }


    } catch(e) {
      log("updateRestaurantCategoryFunction Error : $e");
    } finally {
      // isLoading(false);
      await getRestaurantCategoryFunction();
    }
  }

  /// Delete Restaurant Category
  deleteRestaurantCategoryFunction({required String catId}) async {
    isLoading(true);
    String url = ApiUrl.DeleteRestaurantCategoryApi + catId;
    log("URL : $url");

    try{
      http.Response response = await http.post(Uri.parse(url));
      log("response : $response");

      DeleteCategoryModel deleteCategoryModel = DeleteCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${deleteCategoryModel.message}");
      } else {
        log("deleteRestaurantCategoryFunction Else Else");
      }

    } catch(e) {
      log("deleteRestaurantCategoryFunction Error :: $e");
    } finally {
      // isLoading(false);
      await getRestaurantCategoryFunction();
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