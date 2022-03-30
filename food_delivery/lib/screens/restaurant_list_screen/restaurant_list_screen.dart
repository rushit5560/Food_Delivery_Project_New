import 'package:flutter/material.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';
import '../../controllers/restaurant_list_screen_controller/restaurant_list_screen_controller.dart';
import 'restaurant_list_screen_widgets.dart';

class RestaurantListScreen extends StatelessWidget {
  RestaurantListScreen({Key? key}) : super(key: key);
  final restaurantListScreenController = Get.put(RestaurantListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Restaurants'),
      body: Obx(
        ()=> restaurantListScreenController.isLoading.value
          ? Center(child: CircularProgressIndicator())
         : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RestaurantSearchFieldModule(),
              Expanded(
                child: RestaurantListModule().commonAllSidePadding(padding: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
