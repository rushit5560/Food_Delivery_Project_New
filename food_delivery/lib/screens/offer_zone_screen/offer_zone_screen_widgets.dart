import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../controllers/offer_zone_screen_controller/offer_zone_screen_controller.dart';
import '../../models/food_campaign_model/food_campaign_model.dart';

class OfferZoneListModule extends StatelessWidget {
  OfferZoneListModule({Key? key}) : super(key: key);
  final screenController = Get.find<OfferZoneScreenController>();

  @override
  Widget build(BuildContext context) {
    log('screenController.offerZoneList.length: ${screenController.offerZoneList.length}');
    return screenController.offerZoneList.length == 0 ?
        Center(child: Text("List is empty")):
      ListView.builder(
      itemCount: screenController.offerZoneList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        GetList singleCampaign = screenController.offerZoneList[index];
        return _offerZoneListTile(singleCampaign: singleCampaign);
      },
    );
  }

  Widget _offerZoneListTile({required GetList singleCampaign}) {
    String imgUrl = ApiUrl.ApiMainPath + "${singleCampaign.foodImage}";
    return Container(
      //height: Get.height * 0.20,
      width: Get.width,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   image: DecorationImage(
      //     image: NetworkImage(imgUrl),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50, width: 50,
                child: Image.network(imgUrl)),
            SizedBox(width: 30),
            Text(
              "${singleCampaign.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ).commonSymmetricPadding(horizontal: 15),
    );
  }

}
