import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:food_delivery/screens/home_screen/best_in_review_tab/best_in_review_tab.dart';
import 'package:food_delivery/screens/home_screen/whats_new_tab/whats_new_tab.dart';
import 'package:food_delivery/screens/products_list_screen/products_list_screen.dart';
import 'package:food_delivery/screens/restaurant_list_screen/restaurant_list_screen.dart';
import 'package:food_delivery/screens/search_screen/search_screen.dart';
import 'package:get/get.dart';
import '../../common/constant/app_images.dart';
import '../../common/constant/enums.dart';
import '../../controllers/restaurant_list_screen_controller/restaurant_list_screen_controller.dart';
import '../category_screen/category_screen.dart';



class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> SearchScreen(), transition: Transition.zoom),
      child: Container(
        height: 50,
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
            Icon(Icons.search_outlined, color: Colors.grey.shade400, size: 27,),
            SizedBox(width: 30,),
            Text("Search", style: TextStyle(color: Colors.grey, fontSize: 20),)
          ],
        ),
      ),
    );
  }
}

class BannerList extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: homeScreenController.bannerList.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage("${ApiUrl.ApiMainPath}${homeScreenController.bannerList[index].campaignImage}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    homeScreenController.bannerList[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
          height: 150,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            homeScreenController.activeIndex.value = index;
          }),
    );
  }

}

class CarouselIndicator extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeScreenController.bannerList.length, (index) => Container(
          margin: EdgeInsets.all(4),
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            color: homeScreenController.activeIndex.value == index
                ? Colors.white
                : Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        ),
      ),
    );
  }
}


class RestaurantList extends StatelessWidget {
  final restaurantListScreenController = Get.find<RestaurantListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Restaurants",
                  style: TextStyle(color: Colors.black, fontSize: 20),),

              GestureDetector(
                onTap: () {
                  Get.to(()=> RestaurantListScreen());
                },
                child: Text("View All",
                  style: TextStyle(color: Colors.black, fontSize: 20),),
              )
            ],
          ),

          SizedBox(height: 10,),
          Container(
            height: Get.height * 0.2,
            child: ListView.builder(
              itemCount: restaurantListScreenController.allRestaurantList.length > 8
                  ? 7
                  : restaurantListScreenController.allRestaurantList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=> CategoryScreen(), arguments: restaurantListScreenController.allRestaurantList[index].id);
                    },
                    child: Container(
                      width: 125,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorGrey
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage("${ApiUrl.ApiMainPath}${restaurantListScreenController.allRestaurantList[index].image}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            flex: 2,
                              child: Text(restaurantListScreenController.allRestaurantList[index].storeName))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}


class ProductTab extends StatelessWidget {
  final TabController tabController;
  ProductTab({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.42,
      margin: EdgeInsets.only(left: 20, right: 20),
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              labelColor: AppColors.colorDarkPink,
              //labelPadding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
              unselectedLabelColor: Colors.grey,
              controller:  tabController,

              tabs: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.colorDarkPink),
                    // color: tabController.index == 0 ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Tab(
                      text: 'Best In Review',
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    tabController.index = 1;
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.colorDarkPink),
                      // color: tabController.index == 1 ? AppColors.colorDarkPink : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Tab(
                        text: "What's New",
                      ),
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: (){
                //     tabController.index = 2;
                //   },
                //   child: Container(
                //     height: 40,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(color: AppColors.colorDarkPink),
                //       // color: tabController.index == 2 ? AppColors.colorDarkPink : Colors.white,
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 5),
                //       child: Tab(
                //         text: 'Whats New',
                //       ),
                //     ),
                //   ),
                // ),
                //
                // GestureDetector(
                //   onTap: (){
                //     tabController.index = 3;
                //   },
                //   child: Container(
                //     height: 40,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(color: AppColors.colorDarkPink),
                //       // color: tabController.index == 3 ? AppColors.colorDarkPink : Colors.white,
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 5),
                //       child: Tab(
                //         text: 'Deal Product',
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              //height: Get.height * 0.35,
              child: TabBarView(
                controller: tabController,
                children: [
                  BestInReview(),
                  // TopSellingTab(),
                  WhatsNewTab(),
                  // DealProductsTab()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularProductButton extends StatelessWidget {
  const PopularProductButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> ProductsListScreen(), arguments: [ProductsEnum.AllProducts, '']);
      },
      child: Container(
        height: 40,
        width: Get.width/1.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink
        ),
        child: Center(
          child: Text("View All Popular Product",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
        ),
      ),
    );
  }
}

class FoodCampaignList extends StatelessWidget {
   FoodCampaignList({Key? key}) : super(key: key);
   final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      child: ListView.builder(
          itemCount: homeScreenController.foodCampaignList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                Get.to(() => RestaurantListScreen());
              },
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                      height: Get.height/2,
                      width: Get.width/2,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorGrey
                      ),
                      child: Image.asset(Images.ic_offer1)
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "${homeScreenController.foodCampaignList[index].title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                  )
                ],

              ),
            );
          }),
    );
  }
}
