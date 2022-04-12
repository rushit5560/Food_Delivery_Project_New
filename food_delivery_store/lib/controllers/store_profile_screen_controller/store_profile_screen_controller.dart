import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../models/store_profile_model/store_profile_model.dart';
import '../../models/store_profile_model/update_store_model.dart';


class StoreProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  // User storeDetail = User();


  GlobalKey<FormState> storeFormKey = GlobalKey();
  TextEditingController storeNameFieldController = TextEditingController();
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  File? storeProfilePic;
  String storeProfile = "";

  RxString genderTypeValue = 'Male'.obs;

  getStoreDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.GetStoreDetailsApi + /*StoreDetails.storeId*/ "622b09a668395c49dcb4aa73";
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("Response : $response");

      GetStoreProfileModel getStoreProfileModel = GetStoreProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getStoreProfileModel.status.obs;

      if(isSuccessStatus.value) {

        storeProfile = ApiUrl.ApiMainPath + "${getStoreProfileModel.user.image}";
        storeNameFieldController.text = getStoreProfileModel.user.storeName;
        firstNameFieldController.text = getStoreProfileModel.user.firstName;
        lastNameFieldController.text = getStoreProfileModel.user.lastName;
        addressFieldController.text = getStoreProfileModel.user.address;
        phoneFieldController.text = getStoreProfileModel.user.phone.toString();

      } else {
        log("getStoreDetailsByIdFunction Else Else");
      }


    } catch(e) {
      log("getStoreDetailsByIdFunction Error :: $e");
    } finally {
      isLoading(false);
    }


  }

  updateStoreProfileByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.UpdateStoreDetailsApi + "622b09a668395c49dcb4aa73"/*StoreDetails.storeId*/;
    log("URL : $url");

    try{

      if(storeProfilePic != null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(storeProfilePic!.openRead());
        stream.cast();
        var length = await storeProfilePic!.length();
        request.files.add(await http.MultipartFile.fromPath("Image", storeProfilePic!.path));

        request.fields['StoreName'] = storeNameFieldController.text.trim();
        request.fields['FirstName'] = firstNameFieldController.text.trim();
        request.fields['LastName'] = lastNameFieldController.text.trim();
        request.fields['Address'] = addressFieldController.text.trim();
        request.fields['Phone'] = phoneFieldController.text.trim();

        var multiPart = http.MultipartFile('Image', stream, length);
        request.files.add(multiPart);

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateStoreModel updateStoreModel = UpdateStoreModel.fromJson(json.decode(value));
          isSuccessStatus = updateStoreModel.status.obs;
          print('status : $isSuccessStatus');

          if(isSuccessStatus.value){
            Fluttertoast.showToast(msg: "${updateStoreModel.message}");

          } else {
            print('False False');
          }
        });


      }
      else if(storeProfilePic == null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.fields['StoreName'] = storeNameFieldController.text.trim();
        request.fields['FirstName'] = firstNameFieldController.text.trim();
        request.fields['LastName'] = lastNameFieldController.text.trim();
        request.fields['Address'] = addressFieldController.text.trim();
        request.fields['Phone'] = phoneFieldController.text.trim();

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateStoreModel updateStoreModel = UpdateStoreModel.fromJson(json.decode(value));
          isSuccessStatus = updateStoreModel.status.obs;
          print('status : $isSuccessStatus');

          if(isSuccessStatus.value){
            Fluttertoast.showToast(msg: "${updateStoreModel.message}");

          } else {
            print('False False');
          }
        });

      }

    } catch(e) {
      log("updateStoreProfileByIdFunction Error :: $e");
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
    getStoreDetailsByIdFunction();
    super.onInit();
  }
}