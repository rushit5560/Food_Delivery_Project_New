import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/terms_condition_screen_controller/terms_condition_screen_controller.dart';
import 'package:get/get.dart';

import 'constant/app_images.dart';


class LogoImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.22,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${Images.ic_food_logo}'),
        ),
      ),
    );
  }
}

class HeaderAndContentModule extends StatelessWidget {
  String header;
  String content;
  int index;
  HeaderAndContentModule({required this.header, required this.content, this.index = 0});

  TermsAndConditionScreenController termsAndConditionScreenController = Get.find<TermsAndConditionScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$header',
            textAlign: index == 1 ? TextAlign.center : TextAlign.start,
            textScaleFactor: 1.6,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '$content',
              textAlign: index == 1 ? TextAlign.center : TextAlign.start,
              textScaleFactor: 0.85,
            ),
          ),
        ],
      ),
    );
  }
}


class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
