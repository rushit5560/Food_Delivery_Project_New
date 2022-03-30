import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/models/banner_model/banner_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/food_campaign_model/food_campaign_model.dart';

class CategoryModel{
  CategoryModel({
    required this.image,
    required this.name,
  });

  String image;
  String name;

}

class HomeScreenController extends GetxController {
  var activeIndex = 0.obs;
  List<CategoryModel> category = [];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<GetList> bannerList = [];
  List<GetCampaignList> foodCampaignList = [];

  @override
  void onInit() {
    super.onInit();
    getCategoryList();
    getBannerList();
  }

  getBannerList() async {
    isLoading(true);
    String url =ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : ${response.body}');

      BannerModel bannerModel = BannerModel.fromJson(json.decode(response.body));
      isSuccessStatus = bannerModel.status.obs;
      print("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        bannerList = bannerModel.getList;
        print('allBanner : $bannerList');
      } else {
        print('Get All Banner Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
      await getCampaignList();
      // isLoading(false);
    }
  }

  getCategoryList() {
    category.add(
      CategoryModel(
        image: Images.ic_category2,
        name: 'Pizza',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category1,
        name: 'Burger',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category4,
        name: 'Sandwich',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category3,
        name: 'French Fries',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category5,
        name: 'HotDog',
      ),
    );

  }

  getCampaignList() async {
    isLoading(true);
    String url = ApiUrl.FoodCampaignApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('response ::::::::  ${response.body}');

      FoodCampaignModel foodCampaignModel = FoodCampaignModel.fromJson(json.decode(response.body));
      isSuccessStatus = foodCampaignModel.status.obs;
      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value) {
        foodCampaignList = foodCampaignModel.getList;
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

}