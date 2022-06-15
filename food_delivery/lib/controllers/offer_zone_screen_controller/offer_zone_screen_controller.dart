import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/food_campaign_model/food_campaign_model.dart';

class OfferZoneScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<GetList> offerZoneList = [];

  getCampaignFunction() async {
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
        offerZoneList = getFoodCampaignModel.getList;
        print('foodCampaignList : ${offerZoneList.length}');
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
    getCampaignFunction();
    super.onInit();
  }

}