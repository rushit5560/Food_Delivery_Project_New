import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/models/banner_model/banner_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/food_campaign_model/food_campaign_model.dart';


class HomeScreenController extends GetxController {
  var activeIndex = 0.obs;
  // List<CategoryModel> category = [];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<GetList> bannerList = [];
  List<GetCampaignList> foodCampaignList = [];


  getBannerList() async {
    isLoading(true);
    String url =ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BannerModel bannerModel = BannerModel.fromJson(json.decode(response.body));
      isSuccessStatus = bannerModel.status.obs;

      if(isSuccessStatus.value){
        bannerList = bannerModel.getList;
      } else {
        print('Get All Banner Else Else');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      // isLoading(false);
      await getCampaignList();
    }
  }

  getCampaignList() async {
    isLoading(true);
    String url = ApiUrl.FoodCampaignApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('response ::::::::  ${response.body}');

      GetFoodCampaignModel getFoodCampaignModel = GetFoodCampaignModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFoodCampaignModel.status.obs;
      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value) {
        foodCampaignList = getFoodCampaignModel.getList;
        print('foodCampaignList : $foodCampaignList');
      } else {
        print('Get Campaign Else Else');
      }

    } catch(e) {
      print('Campaign Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getBannerList();
  }

}