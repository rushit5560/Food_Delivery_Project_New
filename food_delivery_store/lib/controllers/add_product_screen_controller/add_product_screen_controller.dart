import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/user_details.dart';
import 'package:food_delivery_admin/models/add_product_model/add_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/add_product_model/all_attributes_model.dart';
import '../../models/add_product_model/get_restaurants_category.dart';
import '../../models/add_product_model/get_restaurant_sub_category_model.dart';
import '../../models/add_product_model/restaurants_all_addons_model.dart';

class AddProductScreenController extends GetxController{
  RxString itemCategory = 'Surat'.obs;
  RxString addressType = 'Surat'.obs;
  RxString discountTypeValue = 'Amount'.obs;
  RxString foodTypeValue = 'Veg'.obs;
  File? productImage;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> productFormKey = GlobalKey();

  final productTitleEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();
  final priceTextEditingController = TextEditingController();
  final mrpTextEditingController = TextEditingController();
  final qtyTextEditingController = TextEditingController();
  final discountTextEditingController = TextEditingController();


  /// Restaurant Category
  RxList<RestaurantCategory> getRestaurantCategoryList = [RestaurantCategory(name: "Select Category", id: "0")].obs;
  RestaurantCategory categoryDropDownValue = RestaurantCategory();

  /// Restaurant Sub Category
  RxList<SubCategory1> getSubCategoryList = [SubCategory1(name: "Select Sub Category", id: "0")].obs;
  SubCategory1? subCategoryDropDownValue;

  /// Attributes List
  RxList<ListElement> allAttributesList = [ListElement()].obs;
  /// Addons List
  RxList<Addon1> allAddonsList = [Addon1()].obs;

  /// Add Product Function
  Future addProductFunction() async {
    isLoading(true);
    String url = ApiUrl.AddProductApi;
    print('url : $url');

    Map<String , dynamic> attribute = {"value":"6204efcef08020bb6802f063","label":"Cheese"};
    Map<String , dynamic> addon = {"value": "61fb726933f06cc75ed9b710","label": "Cheese"};
    Map<String , dynamic> productType = {"value": "Veg","label": "${foodTypeValue.value}"};
    Map<String , dynamic> discountType = {"value": "Amount","label": "${discountTypeValue.value}"};

    try {
      var stream = http.ByteStream(productImage!.openRead());
      stream.cast();

      var length = await productImage!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", productImage!.path));

      request.fields['ProductName'] = "${productTitleEditingController.text.trim()}";
      request.fields['Quantity'] = "${qtyTextEditingController.text.trim()}";
      request.fields['MRP'] = "${mrpTextEditingController.text.trim()}";
      request.fields['Price'] = "${priceTextEditingController.text.trim()}";
      request.fields['Attribute'] = jsonEncode([attribute]);
      request.fields['Addon'] = jsonEncode([addon]);
      request.fields['Store'] = "${UserDetails.storeId}";
      request.fields['Category'] = "${categoryDropDownValue.id}";
      request.fields['SubCategory'] = "${subCategoryDropDownValue!.id}";
      request.fields['Description'] = "${descriptionTextEditingController.text.trim()}";
      request.fields['Discount'] = "${discountTextEditingController.text.trim()}";
      request.fields['ProductType'] = jsonEncode(productType);
      request.fields['DiscountType'] = jsonEncode(discountType);


      var multiPart = http.MultipartFile(
        'Image',
        stream,
        length,
      );

      request.files.add(multiPart);

      var response = await request.send();
      print('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        AddProductModel response1 = AddProductModel.fromJson(json.decode(value));
        print('response1 ::::::${response1.status}');
        isSuccessStatus = response1.status.obs;
        print('status : $isSuccessStatus');

        if(isSuccessStatus.value){
          Fluttertoast.showToast(msg: "${response1.message}");
          clearSignUpFieldsFunction();

        } else {
          // Fluttertoast.showToast(msg: "${response1.message}");
          print('False False');
        }
      });

    } catch (e) {
      print('User SignUp Error : $e');
    } finally {
      isLoading(false);
    }
  }

  /// Get Restaurant Category Function
  getRestaurantCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantCategoryApi + UserDetails.storeId;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GetRestaurantCategoryModel getRestaurantCategoryModel = GetRestaurantCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantCategoryModel.status.obs;

      if(isSuccessStatus.value) {
        getRestaurantCategoryList.addAll(getRestaurantCategoryModel.category);
        categoryDropDownValue = getRestaurantCategoryList[0];
        log("getRestaurantCategoryList Length : ${getRestaurantCategoryList.length}");
      }

    } catch(e) {
      log("getRestaurantCategoryFunction : $e");
    } finally {
      // isLoading(false);
      await getAllAttributesFunction();
    }

  }

  /// Get Restaurant Sub Category Function
  getRestaurantSubCategoryFunction({required String catId}) async {
    isLoading(true);
    String url = ApiUrl.GetSubCategoryApi + catId;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Response : ${response.body}");

      GetSubCategoryModel getSubCategoryModel = GetSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getSubCategoryModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        getSubCategoryList.clear();
        getSubCategoryList.add(SubCategory1(name: "Select Sub Category", id: "0"));
        getSubCategoryList.addAll(getSubCategoryModel.subcategory);
        subCategoryDropDownValue = getSubCategoryList[0];
        log("getSubCategoryList : ${getSubCategoryList.length}");
      } else {
        log("getRestaurantSubCategoryFunction Else Else");
      }

    } catch(e) {
      log("getRestaurantSubCategoryFunction Error : $e");
    } finally {
      isLoading(false);
    }
  }

  /// Get All Attributes Function
  getAllAttributesFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllAttributesApi;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("Response : $response");

      AllAttributesModule allAttributesModule = AllAttributesModule.fromJson(json.decode(response.body));
      isSuccessStatus = allAttributesModule.status.obs;

      if(isSuccessStatus.value) {
        allAttributesList.addAll(allAttributesModule.list);
        log("allAttributesList : $allAttributesList");
      } else {
        log("getAllAttributesFunction Else Else");
      }


    } catch(e) {
      log("getAllAttributesFunction Error : $e");
    } finally {
      // isLoading(false);
      await getRestaurantAddonsFunction();
    }

  }

  /// Get Restaurant Addons Function
  getRestaurantAddonsFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRestaurantAddonsApi + "${UserDetails.storeId}";
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      RestaurantsAllAddonsModule restaurantsAllAddonsModule = RestaurantsAllAddonsModule.fromJson(json.decode(response.body));
      isSuccessStatus = restaurantsAllAddonsModule.status.obs;

      if(isSuccessStatus.value) {
        allAddonsList.addAll(restaurantsAllAddonsModule.addon);
      } else {
        log("getRestaurantAddonsFunction Else Else");
      }
    } catch(e) {
      log("getRestaurantAddonsFunction Error : $e");
    } finally{
      isLoading(false);
    }
  }

  /// Clear All Fields Data After Add Product
  clearSignUpFieldsFunction() {
    productTitleEditingController.clear();
    descriptionTextEditingController.clear();
    priceTextEditingController.clear();
    mrpTextEditingController.clear();
    qtyTextEditingController.clear();
  }


  @override
  void onInit() {
    getRestaurantCategoryFunction();
    super.onInit();
  }
}