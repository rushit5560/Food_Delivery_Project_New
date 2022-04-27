import 'dart:convert';
import 'dart:developer';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/food_campaign_model/basic_campaign_model.dart';
import '../../models/food_campaign_model/food_campaign_model.dart';
import '../../models/home_screen_models/get_products_filter_wise_model.dart';



class HomeScreenController extends GetxController {
  var activeIndex = 0.obs;
  // List<CategoryModel> category = [];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<BasicCampaignListElement> bannerList = [];
  List<GetCampaignList> foodCampaignList = [];
  List<BestReviewListElement> whatsNewList = [];
  List<BestReviewListElement> bestReviewList = [];


  getBannerList() async {
    isLoading(true);
    String url =ApiUrl.BasicCampaignApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BasicCampaignModel basicCampaignModel = BasicCampaignModel.fromJson(json.decode(response.body));
      isSuccessStatus = basicCampaignModel.status.obs;

      if(isSuccessStatus.value){
        bannerList = basicCampaignModel.list;
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
      // isLoading(false);
      await getFilterWiseProductListFunction();
    }
  }

  getFilterWiseProductListFunction() async {
    isLoading(true);
    String url = ApiUrl.AllProductsApi;
    log("Filter Wise Product List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Filter Wise Product List Response : $response");

      GetProductsFilterWiseModel getProductsFilterWiseModel = GetProductsFilterWiseModel.fromJson(json.decode(response.body));
      isSuccessStatus = getProductsFilterWiseModel.status.obs;

      log("isSuccessStatus :: $isSuccessStatus");

      if(isSuccessStatus.value) {
        whatsNewList.clear();
        bestReviewList.clear();

        whatsNewList = getProductsFilterWiseModel.list;
        bestReviewList = getProductsFilterWiseModel.bestReviewList;

        log("whatsNewList :: ${whatsNewList.length}");
        log("bestReviewList :: ${bestReviewList.length}");
      } else {
        log("getFilterWiseProductListFunction Else Else");
      }

    } catch(e) {
      log("getFilterWiseProductListFunction Error :: $e");
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