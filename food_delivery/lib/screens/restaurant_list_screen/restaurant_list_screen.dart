import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';
import '../../controllers/restaurant_list_screen_controller/restaurant_list_screen_controller.dart';
import 'restaurant_list_screen_widgets.dart';

class RestaurantListScreen extends StatelessWidget {
  RestaurantListScreen({Key? key}) : super(key: key);
  final restaurantListScreenController =
      Get.put(RestaurantListScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        appBar: commonAppBarModule(title: 'Restaurants'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RestaurantSearchFieldModule(),
              Expanded(
                child: Obx(
                  () => restaurantListScreenController.isLoading.value
                      ? CustomCircularProgressIndicator()
                      : restaurantListScreenController.searchRestaurantList.isNotEmpty
                          ? SearchRestaurantListModule().commonAllSidePadding(padding: 8)
                          : AllRestaurantListModule().commonAllSidePadding(padding: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
