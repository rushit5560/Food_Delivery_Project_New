import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../controllers/offer_zone_screen_controller/offer_zone_screen_controller.dart';
import 'offer_zone_screen_widgets.dart';

class OfferZoneScreen extends StatelessWidget {
  OfferZoneScreen({Key? key}) : super(key: key);
  final offerZoneScreenController = Get.put(OfferZoneScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Offer Zone"),

      body: Obx(
          () => offerZoneScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : OfferZoneListModule().commonAllSidePadding(padding: 10),
      ),
    );
  }
}
