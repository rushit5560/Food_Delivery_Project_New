import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:food_delivery/models/all_area_model/all_area_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/all_city_model/city_model.dart';
import '../../models/update_user_profile_model/update_user_profile_model.dart';


class EditProfileScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxList<GetList> cityLists = [GetList(cityName: 'Select City')].obs;
  RxList<GetAreaList> areaList = [GetAreaList(areaName: 'Select Area')].obs;
  GetList? cityDropDownValue;
  GetAreaList? areaDropDownValue;
  File? file;

  final fullNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneNoTextController = TextEditingController();


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

  getAreaUsingCityId({required String cityId}) async {
    isLoading(true);

    String url = ApiUrl.AllAreaUsingCityIdApi;
    String finalUrl = url + "$cityId";
    print('finalUrl : $finalUrl');

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : ${response.body}');

      CityWiseAreaModel cityWiseAreaModel = CityWiseAreaModel.fromJson(json.decode(response.body));
      isSuccessStatus = cityWiseAreaModel.status!.obs;

      if(isSuccessStatus.value) {
        areaList.addAll(cityWiseAreaModel.getList!);
        areaDropDownValue = areaList[0];
        print('Area List : ${areaList.length}');
      } else {
        print('getAreaUsingCityId false false');
      }
    } catch(e) {
      print('getAreaUsingCityId Error : $e');
    } finally{
      isLoading(false);
    }
  }

  updateUserProfile() async {
    isLoading(true);

    String url = ApiUrl.UpdateUserProfile;
    String finalUrl = url + "${UserDetails.userId}";
    print('finalUrl : $finalUrl');

    try{
      var stream = http.ByteStream(file!.openRead());
      stream.cast();
      var length = await file!.length();
      var request = http.MultipartRequest('POST', Uri.parse(finalUrl));

      request.files.add(await http.MultipartFile.fromPath("Photo", file!.path));

      request.fields['UserName'] = "${fullNameTextController.text.trim()}";
      request.fields['CityId'] = "61f8f6a51467b5c3867ba67d";
      request.fields['AreaId'] = "61f8f7381467b5c3867ba68f";

      var multiPart = http.MultipartFile(
        'Photo',
        stream,
        length,
      );
      request.files.add(multiPart);

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        UpdateUserModel response1 = UpdateUserModel.fromJson(json.decode(value));
        print('response1 ::::::${response1.status}');
        isSuccessStatus = response1.status.obs;

        if(isSuccessStatus.value){
          Fluttertoast.showToast(msg: "${response1.message}");
          // clearSignUpFieldsFunction();
          Get.back();

        } else {
          // Fluttertoast.showToast(msg: "${response1.message}");
          print('False False');
        }
      });

    } catch(e) {
      print('Update User Profile : $e');
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



}