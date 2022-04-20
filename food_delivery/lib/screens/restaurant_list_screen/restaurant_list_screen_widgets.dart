import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:food_delivery/screens/category_screen/category_screen.dart';
import 'package:get/get.dart';
import '../../controllers/restaurant_list_screen_controller/restaurant_list_screen_controller.dart';

class RestaurantSearchFieldModule extends StatelessWidget {
  final screenController = Get.find<RestaurantListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: screenController.restaurantSearchFieldController,
        decoration: _inputDecoration(),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(15),
      filled: true,
      fillColor: Colors.grey.shade200,
      hintText: 'Search',
      suffixIcon: GestureDetector(
        onTap: () {
          log('Restaurant Name : ${screenController.restaurantSearchFieldController.text}');
          if(screenController.restaurantSearchFieldController.text.trim().isEmpty) {
            screenController.searchRestaurantList.clear();
            screenController.loadUI();
          } else {
            screenController.searchRestaurantListFunction();
          }
          hideKeyboard();
        },
        child: Icon(
          Icons.search_rounded,
          color: AppColors.colorDarkPink,
          size: 25,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
    );
  }
}

class AllRestaurantListModule extends StatelessWidget {
  AllRestaurantListModule({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.allRestaurantList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, i){
        return GestureDetector(
          onTap: () {
            // log("Id : ${screenController.allRestaurantList[i].id}");
            Get.to(()=> CategoryScreen(), arguments: screenController.allRestaurantList[i].id);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 65,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${ApiUrl.ApiMainPath}${screenController.allRestaurantList[i].image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${screenController.allRestaurantList[i].storeName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${screenController.allRestaurantList[i].zone.name}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                              Icons.star,
                            color: Colors.amber,
                            size: 12,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${screenController.allRestaurantList[i].rating}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).commonAllSidePadding(padding: 5),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchRestaurantListModule extends StatelessWidget {
  SearchRestaurantListModule({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.searchRestaurantList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, i){
        return GestureDetector(
          onTap: () {
            // log("Id : ${screenController.allRestaurantList[i].id}");
            Get.to(()=> CategoryScreen(), arguments: screenController.searchRestaurantList[i].id);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 65,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${ApiUrl.ApiMainPath}${screenController.searchRestaurantList[i].image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${screenController.searchRestaurantList[i].storeName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${screenController.searchRestaurantList[i].zone}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 12,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${screenController.searchRestaurantList[i].rating}',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ).commonAllSidePadding(padding: 5),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
