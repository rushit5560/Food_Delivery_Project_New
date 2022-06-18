import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import '../../controllers/order_statuswise_screen_controller/order_statuswise_screen_controller.dart';

/// Selectable Tab Module
class StatusTabsModule extends StatelessWidget {
  StatusTabsModule({Key? key}) : super(key: key);
  final screenController = Get.find<OrderStatusWiseScreenController>();

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
  final screenController = Get.find<OrderStatusWiseScreenController>();

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
  final screenController = Get.find<OrderStatusWiseScreenController>();

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
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
      child: Column(
        children: [
          Row(
            children: [],
          ),

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
    );
  }
}

/// Accepted List
class AcceptedListModule extends StatelessWidget {
  AcceptedListModule({Key? key}) : super(key: key);
  final screenController = Get.find<OrderStatusWiseScreenController>();

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
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
      child: Column(
        children: [
          Row(
            children: [],
          ),

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
    );
  }
}

/// PickedUp List
class PickedUpListModule extends StatelessWidget {
  PickedUpListModule({Key? key}) : super(key: key);
  final screenController = Get.find<OrderStatusWiseScreenController>();

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
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
      child: Column(
        children: [
          Row(
            children: [],
          ),

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
    );
  }
}

/// Delivered List
class DeliveredListModule extends StatelessWidget {
  DeliveredListModule({Key? key}) : super(key: key);
  final screenController = Get.find<OrderStatusWiseScreenController>();

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
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
      child: Row(
        children: [],
      ),
    );
  }
}

