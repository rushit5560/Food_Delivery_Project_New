import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/all_city_model/city_model.dart';
import '../../models/contact_us_model/create_contact_us_model.dart';

class ContactUsScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxList<GetList> cityLists = [GetList(cityName: 'Select City')].obs;
  GetList? cityDropDownValue;
  RxString addressType = 'Surat'.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();
  TextEditingController messageFieldController = TextEditingController();

  getAllCityList() async {
    isLoading(true);
    String url = ApiUrl.AllCityApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('Get All City Response : ${response.body}');

      AllCityModel allCityModel = AllCityModel.fromJson(json.decode(response.body));
      print('allCityModel : $allCityModel');
      isSuccessStatus = allCityModel.status!.obs;
      print('allCityStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        print("Success");
        cityLists.addAll(allCityModel.getList!);
        cityDropDownValue = cityLists[0];
        print('cityLists : ${cityLists.length}');
      } else {
        print('Get All City Else Else');
      }

    } catch(e) {
      print('Get All City False False');
    } finally {
      isLoading(false);
    }
  }

  fillContactUsFormFunction() async {
    isLoading(true);
    String url = ApiUrl.ContactUsApi;
    print('Url : $url');

    try{
      Map data = {
        "FullName" : "${fullNameFieldController.text.trim()}",
        "FeedBack" : "${messageFieldController.text.trim()}",
        "Phone" : "${phoneNoFieldController.text.trim()}",
        "City" : "${cityDropDownValue!.sId}",
        "Restaurant" : "61fa612f77c72b016b4af342",
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('response : ${response.body}');

      CreateContactUsModel createContactUsModel = CreateContactUsModel.fromJson(json.decode(response.body));
      isSuccessStatus = createContactUsModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: '${createContactUsModel.message}');
        Get.back();
      } else {
        print('fillContactUsFormFunction False False');
      }

    } catch(e) {
      print('fillContactUsFormFunction Error : $e');
    } finally {
      isLoading(false);
    }
  }

  loading() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    getAllCityList();
    super.onInit();
  }

  @override
  void dispose() {
    fullNameFieldController.clear();
    phoneNoFieldController.clear();
    messageFieldController.clear();
    super.dispose();
  }
}