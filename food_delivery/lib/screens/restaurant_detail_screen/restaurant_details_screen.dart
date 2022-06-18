import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/restaurant_details_screen_controller/restaurant_details_screen_controller.dart';
import 'package:food_delivery/screens/restaurant_detail_screen/restaurant_detail_screen_widgets.dart';
import 'package:get/get.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  RestaurantDetailsScreen({Key? key}) : super(key: key);
  final restaurantDetailsScreenController =
  Get.put(RestaurantDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBarModule(title: 'Restaurant Details'),
       // / bottomNavigationBar: AddButton(),

        body: Obx(()=>
          restaurantDetailsScreenController.isLoading.value ?
              CircularProgressIndicator() :
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                RestaurantImage(),
                RestaurantDetails()
              ],
            ),
          ),
        ),
    );
  }
}
