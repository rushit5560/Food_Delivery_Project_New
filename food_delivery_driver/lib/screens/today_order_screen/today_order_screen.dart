import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/app_colors.dart';
import 'package:food_delivery_driver/common/app_images.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/screens/today_order_screen/today_order_screen_widgets.dart';

class TodayOrderScreen extends StatelessWidget {
  const TodayOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Today Order'),

      body: TodayOrderListModule(),
    );
  }
}



