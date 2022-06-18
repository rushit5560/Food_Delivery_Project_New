import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/common/custom_drawer/custom_drawer.dart';
import 'package:food_delivery_driver/common/extension_methods/extension_methods.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen_widgets.dart';
import 'package:get/get.dart';
import '../../common/common_widgets.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: commonAppBarModule(title: "Orders", index: 1),
      drawer: CustomDrawer(),
      body: Obx(
            () => homeScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
          children: [
            StatusTabsModule().commonAllSidePadding(padding: 10),
            const SizedBox(height: 15),
            StatusWiseListModule(),
          ],
        ),
      ),
    );

    /*return Scaffold(
      appBar: commonAppBarModule(title: "You're Offline", index: 1),

      // bottomNavigationBar: CountingDetails(),

      drawer: CustomDrawer(),

      body: Column(
        children: [
          Expanded(child: GoogleMapView()),

          // OrderButton(homeScreenController: homeScreenController)
        ],
      ),
    );*/
  }
}
