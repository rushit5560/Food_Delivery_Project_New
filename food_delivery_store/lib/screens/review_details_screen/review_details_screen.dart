import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/review_details_screen_controller/review_details_screen_controller.dart';
import 'review_details_screen_widgets.dart';

class ReviewDetailsScreen extends StatelessWidget {
  ReviewDetailsScreen({Key? key}) : super(key: key);
  final reviewDetailsScreenController =
      Get.put(ReviewDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Food Review"),
      body: Obx(
        () => reviewDetailsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
              child: Column(
                  children: [
                    FoodDetailsModule(),
                    const Divider(thickness: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FoodReviewListModule(),
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}
