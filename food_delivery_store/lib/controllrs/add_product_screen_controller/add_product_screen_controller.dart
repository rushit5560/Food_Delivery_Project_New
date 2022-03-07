import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/api_url.dart';
import 'package:food_delivery_admin/models/add_product_model/add_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddProductScreenController extends GetxController{
  RxString itemCategory = 'Surat'.obs;
  RxString addressType = 'Surat'.obs;
  File? file;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final productTitleEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();
  final priceTextEditingController = TextEditingController();
  final mrpTextEditingController = TextEditingController();
  final qtyTextEditingController = TextEditingController();

  Future addProduct() async {
    isLoading(true);
    String url = ApiUrl.AddProductApi;
    print('url : $url');
    /*Map<String , String>*/var attribute = [{
      "value": "6204efcef08020bb6802f063",
      "label": "Cheese"
    }];
    /*Map<String , String>*/var addon = [{
      "value": "61fb726933f06cc75ed9b710",
      "label": "Cheese"
    }];
    Map<String , dynamic> productType = {
      "value": "Veg",
      "label": "Veg"
    };
    Map<String , dynamic> discountType = {
      "value": "Amount",
      "label": "Amount"
    };

    try {
      var stream = http.ByteStream(file!.openRead());
      stream.cast();

      var length = await file!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.files.add(await http.MultipartFile.fromPath("Image", file!.path));

      // request.fields['UserName'] = "${userNameTextFieldController.text.trim()}";
      // request.fields['FullName'] = "${fullNameTextFieldController.text.trim()}";
      // request.fields['Phone'] = "${phoneNoTextFieldController.text.trim()}";
      // request.fields['Password'] = "${passwordTextFieldController.text.trim()}";
      // request.fields['Address'] = "${addressTextFieldController.text.trim()}";
      // request.fields['Gender'] = "$selectedGenderValue";
      // request.fields['CityId'] = "61f8f6a51467b5c3867ba67d";
      // request.fields['AreaId'] = "61f8f7381467b5c3867ba68f";
      // request.fields['Email'] = "${emailTextFieldController.text.trim().toLowerCase()}";
      // request.fields['RoleId'] = "6179367e616b99f3c785a68e";

      request.fields['ProductName'] = "${productTitleEditingController.text.trim()}";
      request.fields['Quantity'] = "${qtyTextEditingController.text.trim()}";
      request.fields['MRP'] = "${mrpTextEditingController.text.trim()}";
      request.fields['Price'] = "${priceTextEditingController.text.trim()}";
      request.fields['Attribute'] = "$attribute";
      request.fields['Addon'] = "$addon";
      request.fields['Store'] = "61fa612f77c72b016b4af342";
      request.fields['Category'] = "621f0c4eef06bb814930799d";
      request.fields['SubCategory'] = "621f1e6029c482fb2f2c27f3";
      request.fields['Description'] = "${descriptionTextEditingController.text.trim()}";
      request.fields['Discount'] = "0.00";
      request.fields['ProductType'] = "$productType";
      request.fields['DiscountType'] = "$discountType";

      print('request.fields: ${request.fields}');
      print('request.files: ${request.files}');

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

  clearSignUpFieldsFunction() {
    productTitleEditingController.clear();
    descriptionTextEditingController.clear();
    priceTextEditingController.clear();
    mrpTextEditingController.clear();
    qtyTextEditingController.clear();
  }

}