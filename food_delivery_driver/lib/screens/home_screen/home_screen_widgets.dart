import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/common/constant/app_images.dart';
import 'package:food_delivery_driver/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';



/// Selectable Tab Module
class StatusTabsModule extends StatelessWidget {
  StatusTabsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorColor: Colors.white,
      labelColor: AppColors.colorDarkPink,
      unselectedLabelColor: Colors.grey,
      controller: screenController.tabController,
      tabs: [
        /// Pending
        GestureDetector(
          onTap: () {
            screenController.tabController.index = 0;
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink),
              // color: tabController.index == 0 ? AppColors.colorDarkPink : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Tab(
                text: 'Pending',
              ),
            ),
          ),
        ),

        /// Accepted
        GestureDetector(
          onTap: () {
            screenController.tabController.index = 1;
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink),
              // color: tabController.index == 0 ? AppColors.colorDarkPink : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Tab(
                text: 'Accepted',
              ),
            ),
          ),
        ),

        /// Picked Up
        GestureDetector(
          onTap: () {
            screenController.tabController.index = 2;
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink),
              // color: tabController.index == 0 ? AppColors.colorDarkPink : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Tab(
                text: 'Picked Up',
              ),
            ),
          ),
        ),

        /// Done
        GestureDetector(
          onTap: () {
            screenController.tabController.index = 3;
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink),
              // color: tabController.index == 0 ? AppColors.colorDarkPink : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Tab(
                text: 'Delivered',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Tab Wise List
class StatusWiseListModule extends StatelessWidget {
  StatusWiseListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: TabBarView(
          controller: screenController.tabController,
          children: [
            PendingListModule(),
            AcceptedListModule(),
            PickedUpListModule(),
            DeliveredListModule(),

          ],
        ),
      ),
    );
  }
}


/// Pending List
class PendingListModule extends StatelessWidget {
  PendingListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.pendingList.isEmpty
        ? Center(child: Text("No Pending Orders"))
        : ListView.builder(
      itemCount: screenController.pendingList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _pendingListTile();
      },
    );
  }

  Widget _pendingListTile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //margin: EdgeInsets.only(bottom: 10),
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  _orderImage(),
                  const SizedBox(width: 10),
                  Expanded(child: _orderName()),
                  const SizedBox(width: 10),
                  _amountAndButton(),
                ],
              ),
              SizedBox(height: 10),
              /// Buttons Module
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      // width: Get.width / 2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorDarkPink),
                      child: Center(
                        child: Text(
                          "Accept",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ).commonSymmetricPadding(horizontal: 20),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      // width: Get.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.colorDarkPink),
                        // color: AppColors.colorDarkPink,
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ).commonSymmetricPadding(horizontal: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "hdsm" /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "123456",
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + "Pending",
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "details",
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${22-2-22}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID 123456',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }

  Widget _amountAndButton() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + "100",
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: AppColors.colorDarkPink,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        //       child: Text(
        //         'Confirm',
        //         textScaleFactor: 0.8,
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

/// Accepted List
class AcceptedListModule extends StatelessWidget {
  AcceptedListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.acceptedList.isEmpty
        ? Center(child: Text("No Accepted Orders"))
        : ListView.builder(
      itemCount: screenController.acceptedList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _acceptedListTile();
      },
    );
  }

  Widget _acceptedListTile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  _orderImage(),
                  const SizedBox(width: 10),
                  Expanded(child: _orderName()),
                  const SizedBox(width: 10),
                  _amountAndButton(),
                ],
              ),
              SizedBox(height: 10),
              /// Buttons Module
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      // width: Get.width / 2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorDarkPink),
                      child: Center(
                        child: Text(
                          "PickedUp",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ).commonSymmetricPadding(horizontal: 20),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "hdsm" /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "123456",
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + "Pending",
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "details",
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${22-2-22}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID 123456',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }

  Widget _amountAndButton() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + "100",
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: AppColors.colorDarkPink,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        //       child: Text(
        //         'Confirm',
        //         textScaleFactor: 0.8,
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

/// PickedUp List
class PickedUpListModule extends StatelessWidget {
  PickedUpListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.pickedUpList.isEmpty
        ? Center(child: Text("No Picked Up Orders"))
        : ListView.builder(
      itemCount: screenController.pickedUpList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _pickedUpListTile();
      },
    );
  }

  Widget _pickedUpListTile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  _orderImage(),
                  const SizedBox(width: 10),
                  Expanded(child: _orderName()),
                  const SizedBox(width: 10),
                  _amountAndButton(),

                ],
              ),
              SizedBox(height: 10),
              /// Buttons Module
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      // width: Get.width / 2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorDarkPink),
                      child: Center(
                        child: Text(
                          "Delivered",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ).commonSymmetricPadding(horizontal: 20),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "hdsm" /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "123456",
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + "Pending",
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "details",
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${22-2-22}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID 123456',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }

  Widget _amountAndButton() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + "100",
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: AppColors.colorDarkPink,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        //       child: Text(
        //         'Confirm',
        //         textScaleFactor: 0.8,
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

/// Delivered List
class DeliveredListModule extends StatelessWidget {
  DeliveredListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.doneList.isEmpty
        ? Center(child: Text("No Done Orders"))
        : ListView.builder(
      itemCount: screenController.doneList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _doneListTile();
      },
    );
  }

  Widget _doneListTile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
       // / margin: EdgeInsets.only(bottom: 10),
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _orderImage(),
              const SizedBox(width: 10),
              Expanded(child: _orderName()),
              const SizedBox(width: 10),
              _amountAndButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "hdsm" /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "123456",
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + "Pending",
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "details",
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${22-2-22}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID 123456',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }

  Widget _amountAndButton() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + "100",
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: AppColors.colorDarkPink,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        //       child: Text(
        //         'Confirm',
        //         textScaleFactor: 0.8,
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}


// class CountingDetails extends StatelessWidget {
//   const CountingDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 65,
//       padding: EdgeInsets.only(left: 20, right: 20),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(topRight: Radius.circular(20),
//               topLeft: Radius.circular(20)),
//           color: AppColors.colorLightPink
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//           Row(
//             children: [
//               Container(
//                 child: Text("Orders", style: TextStyle(
//                     color: AppColors.colorDarkPink, fontSize: 18
//                 ),),
//               ),
//               SizedBox(width: 5,),
//               Container(
//                 child: Text("500", style: TextStyle(
//                     color: AppColors.colorDarkPink, fontSize: 18, fontWeight: FontWeight.bold
//                 ),),
//               ),
//             ],
//           ),
//
//           Row(
//             children: [
//               Container(
//                 child: Text("Earnings", style: TextStyle(
//                     color: AppColors.colorDarkPink, fontSize: 18
//                 ),),
//               ),
//               SizedBox(width: 5,),
//               Container(
//                 child: Text("\$2000.00", style: TextStyle(
//                     color: AppColors.colorDarkPink, fontSize: 18, fontWeight: FontWeight.bold
//                 ),),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

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

/*class OrderButton extends StatelessWidget {
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
              color: *//*homeScreenController.index.value == 0 ? *//*AppColors.colorDarkPink*//* : Colors.white*//*
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
}*/

