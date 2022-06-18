import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:food_delivery/controllers/restaurant_wise_category_screen_controller/restaurant_wise_category_screen_controller.dart';
import 'package:food_delivery/screens/restaurant_wise_category_screen/restaurant_wise_category_screen_widgets.dart';
import 'package:get/get.dart';

class RestaurantWiseCategoryScreen extends StatelessWidget {
  RestaurantWiseCategoryScreen({Key? key}) : super(key: key);
  final restaurantWiseCategoryScreenController = Get.put(RestaurantWiseCategoryScreenController());


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
              //RestaurantSearchFieldModule(),
              Expanded(
                child: Obx(
                      () => restaurantWiseCategoryScreenController.isLoading.value
                      ? CustomCircularProgressIndicator()
                      : RestaurantWiseCategoryListModule().commonAllSidePadding(padding: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
