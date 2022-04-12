import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/store_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/add_product_model/all_attributes_model.dart';
import '../../models/add_product_model/restaurants_all_addons_model.dart';
import '../../models/category_models/get_restaurants_category.dart';
import '../../models/items_screen_models/delete_store_product_model.dart';
import '../../models/items_screen_models/get_all_admin_products_model.dart';
import '../../models/items_screen_models/get_restaurant_all_product_model.dart';
import '../../models/items_screen_models/update_product_model.dart';
import '../../models/sub_category_models/get_all_sub_category_model.dart';


class ItemScreenController extends GetxController {
  RxBool isStoreProductsSelected = true.obs;
  RxBool isAdminProductsSelected = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<StoreFood> storeProductList = [];
  List<ListElement> adminProductsList = [];


  /// Update Item Fields
  GlobalKey<FormState> updateItemFormKey = GlobalKey();
  TextEditingController updateFoodNameFieldController = TextEditingController();
  TextEditingController updateFoodDescriptionFieldController = TextEditingController();
  TextEditingController updateFoodPriceFieldController = TextEditingController();
  TextEditingController updateFoodDiscountFieldController = TextEditingController();
  TextEditingController updateFoodQtyFieldController = TextEditingController();
  TextEditingController updateFoodMrpFieldController = TextEditingController();
  String updatePhotoUrl = "";
  File? updateFoodImage;
  TimeOfDay startTime = TimeOfDay.now();
  RxString updateStartTimeString = "".obs;
  TimeOfDay endTime = TimeOfDay.now();
  RxString updateEndTimeString = "".obs;
  RxString updateFoodTypeValue = 'Veg'.obs;
  RxString updateDiscountTypeValue = 'Amount'.obs;
  String productId = "";


  /// Restaurant Category DD
  RxList<RestaurantCategory> getRestaurantCategoryList = [RestaurantCategory(name: "Select Category", id: "0")].obs;
  RestaurantCategory updateCategoryDropDownValue = RestaurantCategory();

  /// Restaurant Sub Category DD
  RxList<AllSubcategory> getSubCategoryList = [AllSubcategory(name: "Select Sub Category", id: "0")].obs;
  AllSubcategory? updateSubCategoryDropDownValue;

  /// Attributes List DD
  RxList<ListElement1> allAttributesList = [ListElement1(name: "Select Attributes", id: "0")].obs;
  ListElement1? updateAttributesDropDownValue;

  /// Addons List DD
  RxList<Addon1> allAddonsList = [Addon1(name: "Select Addons", id: "0")].obs;
  Addon1? updateAddonsDropDownValue;

  /// Selected Attributes List For Add Product
  RxList<Map<String, String>> updateSelectedAttributesList = [{"value": "", "label": ""}].obs;

  /// Selected Addons List For Add Product
  RxList<Map<String, String>> updateSelectedAddonList = [{"value": "", "label": ""}].obs;


  /// Get Admin All Products List
  getAdminProductsListFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAdminProductsApi;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));

      GetAllAdminProductsModule getAllAdminProductsModule = GetAllAdminProductsModule.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAdminProductsModule.status.obs;

      if(isSuccessStatus.value) {
        adminProductsList.addAll(getAllAdminProductsModule.list);
      } else {
        log("getAdminProductsListFunction Else Else");
      }
    } catch(e) {
      log("getAdminProductsListFunction Error : $e");
    } finally {
      // isLoading(false);
      getStoreProductList();
    }
  }


  /// Get Store Products List
  getStoreProductList() async {
    print("Store Id: ${StoreDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.GetRestaurantProductsApi + /*"${StoreDetails.storeId}"*/"622b09a668395c49dcb4aa73";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : ${response.body}');

      GetRestaurantAllProductModel getRestaurantAllProductModel = GetRestaurantAllProductModel.fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantAllProductModel.status.obs;
      print("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        storeProductList.clear();

        for(int i = 0; i < getRestaurantAllProductModel.food.length; i++) {
          if(getRestaurantAllProductModel.food[i].isActive == true) {
            storeProductList.add(getRestaurantAllProductModel.food[i]);
          }
        }
        print('getStoreProductList : $storeProductList');
      } else {
        print('Get All Store Products Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }


  /// Delete Product
  deleteStoreProductByIdFunction({required String productId}) async {
    isLoading(true);
    String url = ApiUrl.DeleteProductApi + productId;
    log("URL  :$url");

    try{
      http.Response response = await http.post(Uri.parse(url));
      log("response : $response");

      DeleteStoreProductModel deleteStoreProductModel = DeleteStoreProductModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteStoreProductModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${deleteStoreProductModel.message}");
      } else {
        log("deleteStoreProductByIdFunction Else Else");
      }

    } catch(e) {
      log("deleteStoreProductByIdFunction Error :: $e");
    } finally {
      // isLoading(false);
      await getStoreProductList();
    }
  }

  /// Update Product
  updateProductByIdFunction({required String productId}) async {
    isLoading(true);
    String url = ApiUrl.UpdateProductApi + productId;
    log("URL : $url");

    try {

      if(updateFoodImage != null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(updateFoodImage!.openRead());
        stream.cast();
        var length = await updateFoodImage!.length();
        request.files.add(await http.MultipartFile.fromPath("Image", updateFoodImage!.path));

        Map<String , dynamic> productType = {"value": "Veg","label": "${updateFoodTypeValue.value}"};
        Map<String , dynamic> discountType = {"value": "Amount","label": "${updateDiscountTypeValue.value}"};

        request.fields['ProductName'] = "${updateFoodNameFieldController.text.trim()}";
        request.fields['Quantity'] = "${updateFoodQtyFieldController.text.trim()}";
        request.fields['MRP'] = "${updateFoodMrpFieldController.text.trim()}";
        request.fields['Price'] = "${updateFoodPriceFieldController.text.trim()}";
        request.fields['Attribute'] = jsonEncode(updateSelectedAttributesList);
        request.fields['Addon'] = jsonEncode(updateSelectedAddonList);
        request.fields['Store'] = "622b09a668395c49dcb4aa73";
        request.fields['Category'] = "${updateCategoryDropDownValue.id}";
        request.fields['SubCategory'] = "${updateSubCategoryDropDownValue!.id}";
        request.fields['Description'] = "${updateFoodDescriptionFieldController.text.trim()}";
        request.fields['Discount'] = "${updateFoodDiscountFieldController.text.trim()}";
        request.fields['ProductType'] = jsonEncode(productType);
        request.fields['DiscountType'] = jsonEncode(discountType);
        request.fields['StartTime'] = "$updateStartTimeString";
        request.fields['EndTime'] = "$updateEndTimeString";
        request.fields['IsFeatured'] = "false";

        var multiPart = http.MultipartFile('Image', stream, length);
        request.files.add(multiPart);
        var response = await request.send();
        print('response: ${response.request}');


        response.stream.transform(utf8.decoder).listen((value) {
          UpdateProductModel updateProductModel = UpdateProductModel.fromJson(json.decode(value));
          isSuccessStatus = updateProductModel.status.obs;
          print('status : $isSuccessStatus');

          if(isSuccessStatus.value){
            Fluttertoast.showToast(msg: "${updateProductModel.message}");
            clearAllUpdateProductFields();
            Get.back();
          } else {
            print('False False');
          }
        });

      }
      else if(updateFoodImage == null){

        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(updateFoodImage!.openRead());
        // stream.cast();
        // var length = await updateFoodImage!.length();
        // request.files.add(await http.MultipartFile.fromPath("Image", updateFoodImage!.path));

        Map<String , dynamic> productType = {"value": "Veg","label": "${updateFoodTypeValue.value}"};
        Map<String , dynamic> discountType = {"value": "Amount","label": "${updateDiscountTypeValue.value}"};

        request.fields['ProductName'] = "${updateFoodNameFieldController.text.trim()}";
        request.fields['Quantity'] = "${updateFoodQtyFieldController.text.trim()}";
        request.fields['MRP'] = "${updateFoodMrpFieldController.text.trim()}";
        request.fields['Price'] = "${updateFoodPriceFieldController.text.trim()}";
        request.fields['Attribute'] = jsonEncode(updateSelectedAttributesList);
        request.fields['Addon'] = jsonEncode(updateSelectedAddonList);
        request.fields['Store'] = "622b09a668395c49dcb4aa73";
        request.fields['Category'] = "${updateCategoryDropDownValue.id}";
        request.fields['SubCategory'] = "${updateSubCategoryDropDownValue!.id}";
        request.fields['Description'] = "${updateFoodDescriptionFieldController.text.trim()}";
        request.fields['Discount'] = "${updateFoodDiscountFieldController.text.trim()}";
        request.fields['ProductType'] = jsonEncode(productType);
        request.fields['DiscountType'] = jsonEncode(discountType);
        request.fields['StartTime'] = "$updateStartTimeString";
        request.fields['EndTime'] = "$updateEndTimeString";

        // var multiPart = http.MultipartFile('Image', stream, length);
        // request.files.add(multiPart);
        var response = await request.send();
        print('response: ${response.request}');

        log("request.fields : ${request.fields}");


        response.stream.transform(utf8.decoder).listen((value) {
          UpdateProductModel updateProductModel = UpdateProductModel.fromJson(json.decode(value));
          isSuccessStatus = updateProductModel.status.obs;
          print('status : $isSuccessStatus');

          if(isSuccessStatus.value){
            Fluttertoast.showToast(msg: "${updateProductModel.message}");
            clearAllUpdateProductFields();
            Get.back();
          } else {
            print('False False');
          }
        });

      }

    } catch(e) {
      log("updateProductByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
      // await getStoreProductList();
    }

  }

  @override
  void onInit() {
    super.onInit();
    getRestaurantCategoryFunction();
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
        getRestaurantCategoryList.clear();
        getRestaurantCategoryList.addAll(getRestaurantCategoryModel.category);
        updateCategoryDropDownValue = getRestaurantCategoryList[0];
        log("getRestaurantCategoryList Length : ${getRestaurantCategoryList.length}");
      }

    } catch(e) {
      log("getRestaurantCategoryFunction : $e");
    } finally {
      // isLoading(false);
      await getRestaurantSubCategoryFunction();
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
      // isLoading(false);
      await getStoreProductList();
    }
  }

  /// Get Restaurant Sub Category Function
  getRestaurantSubCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllSubCategoryApi + "622b09a668395c49dcb4aa73";
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      // log("Response : ${response.body}");

      GetAllSubCategoryModel getAllSubCategoryModel = GetAllSubCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllSubCategoryModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        getSubCategoryList.clear();
        getSubCategoryList.add(AllSubcategory(name: "Select Sub Category", id: "0"));
        getSubCategoryList.addAll(getAllSubCategoryModel.subcategory);
        updateSubCategoryDropDownValue = getSubCategoryList[0];
        log("updateSubCategoryDropDownValue : $updateSubCategoryDropDownValue");
        log("getSubCategoryList : ${getSubCategoryList.length}");
      } else {
        log("getRestaurantSubCategoryFunction Else Else");
      }

    } catch(e) {
      log("getRestaurantSubCategoryFunction Error : $e");
    } finally {
      // isLoading(false);
      await getAllAttributesFunction();
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  /// Select Start Time Function
  selectStartTime(BuildContext context) async {
    TimeOfDay? startTimePicked = await showTimePicker(context: context, initialTime: startTime);

    if(startTimePicked != null) {
      startTime = startTimePicked;
      updateStartTimeString = "${startTimePicked.hour} : ${startTimePicked.minute}".obs;
      log("startTimeString : $startTime");
    }

  }

  /// Select End Time Function
  selectEndTime(BuildContext context) async {
    TimeOfDay? endTimePicked = await showTimePicker(context: context, initialTime: endTime);

    if(endTimePicked != null) {
      endTime = endTimePicked;
      updateEndTimeString = "${endTimePicked.hour} : ${endTimePicked.minute}".obs;
    }
  }

  /// Clear Update Food Fields
  clearAllUpdateProductFields() {
    updateFoodNameFieldController.clear();
    updateFoodQtyFieldController.clear();
    updateFoodMrpFieldController.clear();
    updateFoodPriceFieldController.clear();
    updateFoodDiscountFieldController.clear();
    updateFoodQtyFieldController.clear();
    updateFoodMrpFieldController.clear();
    // if(updateFoodImage != null) {
    //   updateFoodImage!.delete();
    // }
    updatePhotoUrl = "";
    updateFoodTypeValue.value = "Veg";
    updateDiscountTypeValue.value = "Amount";
  }

}