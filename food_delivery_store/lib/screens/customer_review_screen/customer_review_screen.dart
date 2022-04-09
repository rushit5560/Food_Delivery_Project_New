import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';
import '../../controllers/customer_review_screen_controller/customer_review_screen_controller.dart';
import 'customer_review_screen_widgets.dart';

class CustomerReviewScreen extends StatelessWidget {
  CustomerReviewScreen({Key? key}) : super(key: key);
  final customerReviewScreenController =
      Get.put(CustomerReviewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "Customer Reviews"),
      body: Obx(
        () => customerReviewScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : CustomerReviewListModule(),
      ),
    );
  }
}
