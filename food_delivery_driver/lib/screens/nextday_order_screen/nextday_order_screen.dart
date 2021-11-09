import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/screens/nextday_order_screen/nextday_order_screen_widgets.dart';

class NextDayOrderScreen extends StatelessWidget {
  const NextDayOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Nextday Order'),

      body: NextDayOrderListModule(),
    );
  }
}
