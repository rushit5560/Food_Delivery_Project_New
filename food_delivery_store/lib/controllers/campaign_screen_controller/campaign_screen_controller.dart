import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../models/campaign_models/get_all_campaign_model.dart';

class CampaignScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<CampaignListElement> campaignList = [];



  getAllCampaignFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllCampaignApi;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Campaign Response : ${response.body}");

      GetAllCampaignModel getAllCampaignModel = GetAllCampaignModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllCampaignModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        campaignList.clear();

        for(int i = 0; i < getAllCampaignModel.list.length; i++) {
          if(getAllCampaignModel.list[i].isActive == true) {
            campaignList.add(getAllCampaignModel.list[i]);
          }
        }
        log("campaignList : $campaignList");

      } else {
        log("getAllCampaignFunction Else Else");
        Fluttertoast.showToast(msg: "Something went Wrong!");
      }
    } catch(e) {
      log("getAllCampaignFunction Error : $e");
      Fluttertoast.showToast(msg: "Something went Wrong!");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllCampaignFunction();
    super.onInit();
  }

}
