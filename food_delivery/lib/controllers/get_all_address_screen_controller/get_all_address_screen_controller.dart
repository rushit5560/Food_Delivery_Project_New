import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/models/get_all_address_model/get_all_address_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetAllAddressScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<AddressList> allAddressList = [];


  getAllAddressFunction()async{
    isLoading(true);
    String url = ApiUrl.getAllAddressAPI;
    log("Get Address API URL : $url");

    try {

      http.Response response = await http.get(Uri.parse(url));
      log("Get Address Response : ${response.body}");

      GetAllAddressModel getAllAddressModel = GetAllAddressModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAddressModel.status.obs;

      if(isSuccessStatus.value) {
        allAddressList = getAllAddressModel.addressList;
        log("allAddressList Length : ${allAddressList.length}");
      } else {
        log("Get Address Function Else Else");
      }

    } catch(e) {
      log("Get Address Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllAddressFunction();
  }

}