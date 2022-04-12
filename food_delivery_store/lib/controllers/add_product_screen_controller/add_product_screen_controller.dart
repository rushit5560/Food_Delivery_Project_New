import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/models/add_product_model/add_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/add_product_model/all_attributes_model.dart';
import '../../models/category_models/get_restaurants_category.dart';
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

  TimeOfDay startTime = TimeOfDay.now();
  RxString startTimeString = "".obs;
  TimeOfDay endTime = TimeOfDay.now();
  RxString endTimeString = "".obs;



  /// Restaurant Category DD
  RxList<RestaurantCategory> getRestaurantCategoryList = [RestaurantCategory(name: "Select Category", id: "0")].obs;
  RestaurantCategory categoryDropDownValue = RestaurantCategory();

  /// Restaurant Sub Category DD
  RxList<SubCategory1> getSubCategoryList = [SubCategory1(name: "Select Sub Category", id: "0")].obs;
  SubCategory1? subCategoryDropDownValue;

  /// Attributes List DD
  RxList<ListElement1> allAttributesList = [ListElement1(name: "Select Attributes", id: "0")].obs;
  ListElement1? attributesDropDownValue;

  /// Addons List DD
  RxList<Addon1> allAddonsList = [Addon1(name: "Select Addons", id: "0")].obs;
  Addon1? addonsDropDownValue;

  /// Selected Attributes List For Add Product
  RxList<Map<String, String>> selectedAttributesList = [{"value": "", "label": ""}].obs;

  /// Selected Addons List For Add Product
  RxList<Map<String, String>> selectedAddonList = [{"value": "", "label": ""}].obs;

  /// Add Product Function
  Future addProductFunction() async {
    isLoading(true);
    String url = ApiUrl.AddProductApi;
    print('url : $url');


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
      request.fields['Attribute'] = jsonEncode(selectedAttributesList);
      request.fields['Addon'] = jsonEncode(selectedAddonList);
      request.fields['Store'] = "622b09a668395c49dcb4aa73";
      request.fields['Category'] = "${categoryDropDownValue.id}";
      request.fields['SubCategory'] = "${subCategoryDropDownValue!.id}";
      request.fields['Description'] = "${descriptionTextEditingController.text.trim()}";
      request.fields['Discount'] = "${discountTextEditingController.text.trim()}";
      request.fields['ProductType'] = jsonEncode(productType);
      request.fields['DiscountType'] = jsonEncode(discountType);
      request.fields['StartTime'] = "$startTimeString";
      request.fields['EndTime'] = "$endTimeString";


      var multiPart = http.MultipartFile('Image', stream, length);

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
          clearAddProductFieldsFunction();
          Get.back();

        } else {
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
    String url = ApiUrl.GetRestaurantCategoryApi + "622b09a668395c49dcb4aa73"/*StoreDetails.storeId*/;
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
    String url = ApiUrl.GetRestaurantAddonsApi + "622b09a668395c49dcb4aa73"/*StoreDetails.storeId*/;
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
  clearAddProductFieldsFunction() {
    productTitleEditingController.clear();
    descriptionTextEditingController.clear();
    priceTextEditingController.clear();
    mrpTextEditingController.clear();
    qtyTextEditingController.clear();
  }


  /// Add Attributes From DD in Local List
  addAttributesInSelectedList(ListElement1 listElement1) {

    Map<String, String> singleData = {
      "value" : "${listElement1.id}",
      "label" : "${listElement1.name}"
    };
    log("singleData ::::: $singleData");

    for(int i = 0; i < selectedAttributesList.length; i++) {

      if(selectedAttributesList[i]["value"] == listElement1.id) {
        Fluttertoast.showToast(msg: "Attributes Already Added in List!");
        log("selectedAttributesList 11 : $selectedAttributesList");
      } else {

        if(selectedAttributesList[0]["value"] == "") {
          selectedAttributesList.add(singleData);
          Fluttertoast.showToast(msg: "Attributes Added!");
          selectedAttributesList.removeAt(0);
          log("selectedAttributesList 22 : $selectedAttributesList");
        } else {
          selectedAttributesList.add(singleData);
          Fluttertoast.showToast(msg: "Attributes Added!");
          log("selectedAttributesList 33 : $selectedAttributesList");
        }

      }

    }

  }

  /// Add Addons From DD in Local List
  addAddonsInSelectedList(Addon1 addon1) {
    Map<String, String> singleData = {
      "value" : "${addon1.id}",
      "label" : "${addon1.name}"
    };
    log("singleData ::::: $singleData");

    for(int i = 0; i < selectedAddonList.length; i++) {

      if(selectedAddonList[i]["value"] == addon1.id) {
        Fluttertoast.showToast(msg: "Addon Already Added in List!");
        log("selectedAddonList 11 : $selectedAddonList");
      } else {

        if(selectedAddonList[0]["value"] == "") {
          selectedAddonList.add(singleData);
          Fluttertoast.showToast(msg: "Addon Added!");
          selectedAddonList.removeAt(0);
          log("selectedAddonList 22 : $selectedAddonList");
        } else {
          selectedAddonList.add(singleData);
          Fluttertoast.showToast(msg: "Addon Added!");
          log("selectedAddonList 33 : $selectedAddonList");
        }
      }
    }

  }


  /// Select Start Time Function
  selectStartTime(BuildContext context) async {
    TimeOfDay? startTimePicked = await showTimePicker(context: context, initialTime: startTime);

    if(startTimePicked != null) {
      startTime = startTimePicked;
      startTimeString = "${startTimePicked.hour} : ${startTimePicked.minute}".obs;
      log("startTimeString : $startTime");
    }

  }

  /// Select End Time Function
  selectEndTime(BuildContext context) async {
    TimeOfDay? endTimePicked = await showTimePicker(context: context, initialTime: endTime);

    if(endTimePicked != null) {
      endTime = endTimePicked;
      endTimeString = "${endTimePicked.hour} : ${endTimePicked.minute}".obs;
    }
  }


  @override
  void onInit() {
    getRestaurantCategoryFunction();

    /// Give Initial Value of DropDown
    subCategoryDropDownValue = getSubCategoryList[0];
    attributesDropDownValue = allAttributesList[0];
    addonsDropDownValue = allAddonsList[0];

    startTimeString = "${startTime.hour}:${startTime.minute}".obs;
    endTimeString = "${endTime.hour}:${endTime.minute}".obs;


    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}