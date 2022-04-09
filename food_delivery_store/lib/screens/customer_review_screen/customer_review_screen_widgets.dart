import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/customer_review_screen_controller/customer_review_screen_controller.dart';


class CustomerReviewListModule extends StatelessWidget {
  CustomerReviewListModule({Key? key}) : super(key: key);
  final customerReviewScreenController = Get.find<CustomerReviewScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container();
      },
    );
  }
}
