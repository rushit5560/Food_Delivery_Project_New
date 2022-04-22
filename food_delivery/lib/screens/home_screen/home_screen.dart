import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/common/custom_drawer/custom_drawer.dart';
import 'package:food_delivery/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:food_delivery/screens/home_screen/home_screen_widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final homeScreenController = Get.put(HomeScreenController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Import From custom_appbar File
      appBar: commonAppBarModule(title: 'Home', index: 1),

      // CustomDrawer Import From custom_drawer File
      drawer: CustomDrawer(),

      body: Obx(()=>
           homeScreenController.isLoading.value
               ? Center(child: CircularProgressIndicator()) :
         SingleChildScrollView(
          child: Column(
            children: [
              SearchContainer(),
              SizedBox(height: 15),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  BannerList(),
                  CarouselIndicator(),
                ],
              ),
              SizedBox(height: 15),
              RestaurantList(),
              SizedBox(height: 10),
              ProductTab(tabController: _tabController),
              SizedBox(height: 10),
              PopularProductButton(),
              SizedBox(height: 10),
              FoodCampaignList(),
            ],
          ),
        ),
      ),

    );
  }
}
