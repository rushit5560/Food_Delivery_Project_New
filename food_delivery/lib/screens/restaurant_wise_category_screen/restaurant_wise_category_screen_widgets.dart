import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/extension_methods/extension_methods.dart';
import 'package:food_delivery/controllers/restaurant_wise_category_screen_controller/restaurant_wise_category_screen_controller.dart';
import 'package:food_delivery/screens/restaurant_detail_screen/restaurant_details_screen.dart';
import 'package:get/get.dart';

class RestaurantWiseCategoryListModule extends StatelessWidget {
  RestaurantWiseCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantWiseCategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.restaurantWiseCategoryList.length,
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
            Get.to(()=> RestaurantDetailsScreen(), arguments: screenController.restaurantWiseCategoryList[i].value.id);
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
                        image: NetworkImage("${ApiUrl.ApiMainPath}${screenController.restaurantWiseCategoryList[i].value.image}"),
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
                        '${screenController.restaurantWiseCategoryList[i].value.storeName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${screenController.restaurantWiseCategoryList[i].value.address}',
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
                          // Text(
                          //   '${screenController.restaurantWiseCategoryList[i].value.rating}',
                          //   style: TextStyle(
                          //     fontSize: 11,
                          //     color: Colors.grey,
                          //   ),
                          // ),
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