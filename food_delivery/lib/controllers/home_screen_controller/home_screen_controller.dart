import 'dart:convert';
import 'dart:developer';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/models/category_screen_model/all_category_model.dart';
import 'package:food_delivery/models/get_food_review_model/get_food_review_model.dart';
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
  List<GetList> foodCampaignList = [];
  List<BestReviewListElement> whatsNewList = [];
  List<BestReviewListElement> bestReviewList = [];
  List<AllCategory> categoryList = [];
  List<List1> reviewList = [];

  String image= "";

  getBannerList() async {
    isLoading(true);
    String url =ApiUrl.BasicCampaignApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BasicCampaignModel basicCampaignModel = BasicCampaignModel.fromJson(json.decode(response.body));
      isSuccessStatus = basicCampaignModel.status.obs;
      log('Banner isSuccessStatus: $isSuccessStatus');
      if(isSuccessStatus.value){
        bannerList = basicCampaignModel.list;
        log('bannerList: $bannerList');
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
      //isLoading(false);
      getAllCategoryList();
    }

  }

  getAllCategoryList() async {
    isLoading(true);
    String url = ApiUrl.AllCategoryApi;
    log("Category List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Category List Response : $response");

      AllCategoryModel allCategoryModel = AllCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = allCategoryModel.status!.obs;

      log("isSuccessStatus :: $isSuccessStatus");

      if(isSuccessStatus.value) {

        categoryList = allCategoryModel.allCategory!;

        log("categoryList :: ${categoryList.length}");
      } else {
        log("categoryList Else Else");
      }

    } catch(e) {
      log("categoryList Error :: $e");
    } finally {
      //isLoading(false);
      getClientReviewList();
    }
  }

  getClientReviewList()async{
    isLoading(true);
    String url = ApiUrl.GetFoodReviewAPI;
    log("Food Review List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Food Review List Response : ${response.body}");


      GetFoodReviewModel getFoodReviewModel = GetFoodReviewModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFoodReviewModel.status!.obs;

      log("isSuccessStatus :: $isSuccessStatus");

      if(isSuccessStatus.value) {

        reviewList = getFoodReviewModel.list!;
        //image= reviewList[18].customer!.photo!;

        log("reviewList :: ${reviewList.length}");
      } else {
        log("reviewList Else Else");
      }

    } catch(e) {
      log("reviewList Error :: $e");
    } finally {
      isLoading(false);
      //getClientReviewList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getBannerList();
  }

}