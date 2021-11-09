import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/controllrs/home_screen_controller/home_screen_controller.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen_widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: "You're Offline", index: 1),

      bottomNavigationBar: CountingDetails(),

      body: Column(
        children: [
          Expanded(child: GoogleMapView()),

          OrderButton(homeScreenController: homeScreenController,)
        ],
      ),
    );
  }
}
