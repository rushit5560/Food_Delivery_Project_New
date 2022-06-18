import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/store_details.dart';
import 'package:food_delivery_admin/models/campaign_models/joined_campaign_model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../models/campaign_models/get_all_campaign_model.dart';

class CampaignScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  late TabController tabController;

  List<CampaignListElement> campaignList = [];
  List<JoinedCampaignElement> joinedCampaignList = [];

  /// All Campaign
  Future<void> getAllCampaignFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllCampaignApi;
    log("URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Campaign Response : ${response.body}");

      GetAllCampaignModel getAllCampaignModel =
          GetAllCampaignModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllCampaignModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if (isSuccessStatus.value) {
        campaignList.clear();

        for (int i = 0; i < getAllCampaignModel.list.length; i++) {
          if (getAllCampaignModel.list[i].isActive == true) {
            campaignList.add(getAllCampaignModel.list[i]);
          }
        }
        log("campaignList : $campaignList");
      } else {
        log("getAllCampaignFunction Else Else");
        Fluttertoast.showToast(msg: "Something went Wrong!");
      }
    } catch (e) {
      log("getAllCampaignFunction Error : $e");
      Fluttertoast.showToast(msg: "Something went Wrong!");
    } finally {
      // isLoading(false);
      await getJoinedCampaignFunction();
    }
  }

  /// Joined Campaign
  Future<void> getJoinedCampaignFunction() async {
    isLoading(true);
    String url = ApiUrl.JoinedCampaignApi + StoreDetails.storeId;
    log("Joined Campaign Api Url : $url");

    try {
       http.Response response = await http.get(Uri.parse(url));
       log("Joined Campaign Response : ${response.body}");


       JoinedCampaignModel joinedCampaignModel = JoinedCampaignModel.fromJson(json.decode(response.body));
       isSuccessStatus = joinedCampaignModel.status.obs;

       if(isSuccessStatus.value) {
         joinedCampaignList.clear();
         joinedCampaignList = joinedCampaignModel.list;
         log("joinedCampaignList : ${joinedCampaignList.length}");
       } else {
         log("Joined Campaign Function Else Else");
       }

    } catch(e) {
      log("Joined Campaign Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  /// Join Campaign
  Future<void> joinCampaignFunction({required String campaignId}) async {
    isLoading(true);
    String url = ApiUrl.CampaignJoinApi;
    log("Campaign Join Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "Restaurant" : "${StoreDetails.storeId}",
        "CampaignID" : "$campaignId",
        "IsActive" : true
      };
      log("Data = $data");
      http.Response response = await http.post(Uri.parse(url), body: data);

      // JoinedCampaignModel joinedCampaignModel = JoinedCampaignModel.fromJson(json.decode(response.body));
      // isSuccessStatus = joinedCampaignModel.status.obs;
      //
      // if(isSuccessStatus.value) {
      //
      // } else {
      //   log("Joined Campaign Function Else Else");
      // }


    } catch(e) {
      log("joinCampaignFunction Error ::: $e");
    } finally {
      await getAllCampaignFunction();
    }
  }

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    getAllCampaignFunction();
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
