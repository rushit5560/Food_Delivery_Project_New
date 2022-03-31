import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/screens/nextday_order_screen/nextday_order_screen.dart';
import 'package:food_delivery_driver/screens/today_order_screen/today_order_screen.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';

class CountingDetails extends StatelessWidget {
  const CountingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
          color: AppColors.colorLightPink
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Container(
                child: Text("Orders", style: TextStyle(
                    color: AppColors.colorDarkPink, fontSize: 18
                ),),
              ),
              SizedBox(width: 5,),
              Container(
                child: Text("500", style: TextStyle(
                    color: AppColors.colorDarkPink, fontSize: 18, fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),

          Row(
            children: [
              Container(
                child: Text("Earnings", style: TextStyle(
                    color: AppColors.colorDarkPink, fontSize: 18
                ),),
              ),
              SizedBox(width: 5,),
              Container(
                child: Text("\$2000.00", style: TextStyle(
                    color: AppColors.colorDarkPink, fontSize: 18, fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GoogleMapView extends StatelessWidget {
   GoogleMapView({Key? key}) : super(key: key);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: mapView(),
      ),
    );
  }

  mapView() {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: false,
      //markers: _markers,
      //onCameraMove: _onCameraMove,
      initialCameraPosition: _kGooglePlex,
      zoomGesturesEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }


}

class OrderButton extends StatelessWidget {
  //OrderButton({Key? key}) : super(key: key);
  HomeScreenController homeScreenController;
  OrderButton({required this.homeScreenController});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => TodayOrderScreen());
        homeScreenController.index.value = 0;

      },
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          height: 50, width: Get.width/2.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink),
              color: /*homeScreenController.index.value == 0 ? */AppColors.colorDarkPink/* : Colors.white*/
          ),
          child: Center(
            child: Text("All Orders",
              style: TextStyle(
                  color: homeScreenController.index.value == 0 ? Colors.white : AppColors.colorDarkPink,
                  fontSize: 18),),
          ),
        ),
      ),
    );
    // return Container(
    //   margin: EdgeInsets.only(top: 20, bottom: 20),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       Obx(()=>
    //          GestureDetector(
    //           onTap: (){
    //             Get.to(() => TodayOrderScreen());
    //             homeScreenController.index.value = 0;
    //
    //           },
    //           child: Container(
    //             height: 50, width: Get.width/2.5,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 border: Border.all(color: AppColors.colorDarkPink),
    //                 color: homeScreenController.index.value == 0 ? AppColors.colorDarkPink : Colors.white
    //             ),
    //             child: Center(
    //               child: Text("Today Order",
    //                 style: TextStyle(
    //                     color: homeScreenController.index.value == 0 ? Colors.white : AppColors.colorDarkPink,
    //                     fontSize: 18),),
    //             ),
    //           ),
    //         ),
    //       ),
    //
    //       Obx(()=>
    //           GestureDetector(
    //           onTap: (){
    //             Get.to(() => NextDayOrderScreen());
    //             homeScreenController.index.value = 1;
    //           },
    //           child: Container(
    //             height: 50, width: Get.width/2.5,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //                 border: Border.all(color: AppColors.colorDarkPink),
    //               color: homeScreenController.index.value == 1 ? AppColors.colorDarkPink : Colors.white
    //             ),
    //             child: Center(
    //               child: Text("Nextday Order",
    //                 style: TextStyle(
    //                     color: homeScreenController.index.value == 1 ? Colors.white : AppColors.colorDarkPink,
    //                     fontSize: 18),),
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

