import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/campaign_screen_controller/campaign_screen_controller.dart';
import 'campaign_screen_widgets.dart';

class CampaignScreen extends StatelessWidget {
  CampaignScreen({Key? key}) : super(key: key);
  final campaignScreenController = Get.put(CampaignScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Campaign"),

      body: Obx(
        () => campaignScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  const SizedBox(height: 20),
                  CampaignTabModule(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: campaignScreenController.tabController,
                        children: [
                          AllCampaignListModule(),
                          JoinedCampaignListModule(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),

      // body: Obx(
      //   () => campaignScreenController.isLoading.value
      //       ? CustomCircularProgressIndicator()
      //       : Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: campaignScreenController.campaignList.isEmpty == true
      //               ? Center(child: Text("No Data Available"))
      //               : CampaignListModule(),
      //         ),
      // ),
    );
  }
}
