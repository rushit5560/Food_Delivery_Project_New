import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:food_delivery/controllers/account_screen_controller/account_screen_controller.dart';
import 'package:food_delivery/models/all_area_model/all_area_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/all_city_model/city_model.dart';
import '../../models/update_user_profile_model/update_user_profile_model.dart';
import '../../models/user_profile_model/user_profile_model.dart';


class EditProfileScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final accountScreenController = Get.find<AccountScreenController>();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxList<GetList> cityLists = [GetList(cityName: 'Select City')].obs;
  RxList<GetAreaList> areaList = [GetAreaList(areaName: 'Select Area')].obs;
  GetList? cityDropDownValue;
  GetAreaList? areaDropDownValue;
  File? userProfile;
  String userProfilePicLink = "";
  String userCityId = "";
  String userAreaId = "";

  final fullNameTextController = TextEditingController();


  /// Get User Profile Details
  getUserProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.GetUserProfileApi + "${UserDetails.userId}";
    log("Get User Profile API URL : $url");


    try{
      http.Response response = await http.get(Uri.parse(url));
      log("User Profile API response : ${response.body}");

      GetUserProfileModel getUserProfileModel = GetUserProfileModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserProfileModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        userProfilePicLink = "${ApiUrl.ApiMainPath}${getUserProfileModel.user.photo}";
        fullNameTextController.text = getUserProfileModel.user.userName;
        userCityId = getUserProfileModel.user.cityId.id;
        userAreaId = getUserProfileModel.user.areaId.id;
      } else {
        log("getUserProfileModel Else Else");
      }


    } catch(e) {
      log("getUserProfileFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getAllCityList();
    }

  }

  /// Get All City
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
        cityLists.clear();
        cityLists.addAll(allCityModel.getList!);
        for(int i = 0; i < cityLists.length; i++) {
          if(userCityId == cityLists[i].sId) {
            cityDropDownValue = cityLists[i];
          }
        }
        // cityDropDownValue = cityLists[0];
        print('cityLists : ${cityLists.length}');
      } else {
        print('Get All City Else Else');
      }

    } catch(e) {
      print('Get All City False False');
    } finally {
      // isLoading(false);
      log("userCityId :$userCityId");
      await getAreaUsingCityId(cityId: "$userCityId");
    }
  }

  /// Get Area Using City Id
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
        areaList.clear();
        areaList.addAll(cityWiseAreaModel.getList!);
        for(int i = 0; i <areaList.length; i++) {
          if(userAreaId == areaList[i].id) {
            areaDropDownValue = areaList[i];
          }
        }

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

  /// Update User Profile
  updateUserProfile() async {
    isLoading(true);

    String url = ApiUrl.UpdateUserProfile;
    String finalUrl = url + "${UserDetails.userId}";
    print('finalUrl : $finalUrl');

    try{

      if(userProfile != null) {
        var request = http.MultipartRequest('POST', Uri.parse(finalUrl));

        var stream = http.ByteStream(userProfile!.openRead());
        stream.cast();
        var length = await userProfile!.length();

        request.files.add(await http.MultipartFile.fromPath("Photo", userProfile!.path));
        request.fields['UserName'] = "${fullNameTextController.text.trim()}";
        request.fields['CityId'] = "${cityDropDownValue!.sId}";
        request.fields['AreaId'] = "${areaDropDownValue!.id}";

        var multiPart = http.MultipartFile('Photo', stream, length);
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
            print('False False');
          }
        });

      } else if(userProfile == null) {
        var request = http.MultipartRequest('POST', Uri.parse(finalUrl));

        // var stream = http.ByteStream(userProfile!.openRead());
        // stream.cast();
        // var length = await userProfile!.length();

        // request.files.add(await http.MultipartFile.fromPath("Photo", userProfile!.path));
        request.fields['UserName'] = "${fullNameTextController.text.trim()}";
        request.fields['CityId'] = "${cityDropDownValue!.sId}";
        request.fields['AreaId'] = "${areaDropDownValue!.id}";

        // var multiPart = http.MultipartFile('Photo', stream, length);
        // request.files.add(multiPart);

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
            print('False False');
          }
        });
      }
      /*var stream = http.ByteStream(userProfile!.openRead());
      stream.cast();
      var length = await userProfile!.length();
      var request = http.MultipartRequest('POST', Uri.parse(finalUrl));

      request.files.add(await http.MultipartFile.fromPath("Photo", userProfile!.path));

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
      });*/

    } catch(e) {
      print('Update User Profile : $e');
    } finally {
      isLoading(false);
    }
  }



  @override
  void onInit() {
    // getAllCityList();
    getUserProfileFunction();
    super.onInit();
  }

  loading() {
    isLoading(true);
    isLoading(false);
  }

}