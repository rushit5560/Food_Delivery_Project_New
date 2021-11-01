import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:food_delivery/screens/category_screen/category_screen.dart';
import 'package:food_delivery/screens/home_screen/deal_products_tab/deal_products_tab.dart';
import 'package:food_delivery/screens/home_screen/recent_selling_tab/recent_selling_tab.dart';
import 'package:food_delivery/screens/home_screen/top_selling_tab/top_selling_tab.dart';
import 'package:food_delivery/screens/home_screen/whats_new_tab/whats_new_tab.dart';
import 'package:get/get.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class BannerList extends StatelessWidget {
  HomeScreenController homeScreenController;
  BannerList({required this.homeScreenController});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
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
                    image: AssetImage(Images.ic_banner),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "UP TO 40% OFF",
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
  HomeScreenController homeScreenController;
  CarouselIndicator({required this.homeScreenController});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4, (index) => Container(
          margin: EdgeInsets.all(4),
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            color: homeScreenController.activeIndex.value == index
                ? Colors.white
                : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        ),
      ),
    );
  }
}


class CategoryList extends StatelessWidget {
   CategoryList({required this.homeScreenController});

  HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories",
                  style: TextStyle(color: Colors.black, fontSize: 20),),

              GestureDetector(
                onTap: () {
                  Get.to(()=> CategoryScreen());
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
              itemCount: homeScreenController.category.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorGrey
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Image.asset(homeScreenController.category[index].image,),
                        ),

                        Expanded(
                          flex: 2,
                            child: Text(homeScreenController.category[index].name))
                      ],
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
  TabController tabController;
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
            //padding: EdgeInsets.only(left: 5, right: 5),
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              //indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.colorDarkPink,
              labelPadding: EdgeInsets.only(top: 10.0, bottom: 10),
              unselectedLabelColor: Colors.grey,
              controller:  tabController,
              labelStyle: TextStyle(fontSize: 18),
              tabs: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  //width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.colorDarkPink),
                    //color: tabController = 0 ? AppColors.colorDarkPink ? Colors.white
                  ),
                  child: Tab(
                    text: "Recent Selling",

                  ),
                ),

                Container(
                 // width: Get.width * 0.2,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.colorDarkPink)
                  ),
                  child: Tab(
                    text: "Top Selling",
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  //width: Get.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.colorDarkPink)
                  ),
                  child: Tab(
                    text: "Whats New",

                  ),
                ),

                Container(
                  //width: Get.width * 0.2,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.colorDarkPink)
                  ),
                  child: Tab(
                    text: "Deal Products",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              //height: Get.height * 0.35,
              child: TabBarView(
                controller: tabController,
                children: [
                  RecentSelling(),
                  TopSellingTab(),
                  WhatsNewTab(),
                  DealProductsTab()
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
    return Container(
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
    );
  }
}

class OfferList extends StatelessWidget {
   OfferList({Key? key}) : super(key: key);

  List<String> offer= [
    Images.ic_offer1,
    Images.ic_offer2,
    Images.ic_offer3,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      child: ListView.builder(
          itemCount: offer.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Stack(
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
                    child: Image.asset(offer[index])
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("10% OFF",
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

            );
          }),
    );
  }
}


