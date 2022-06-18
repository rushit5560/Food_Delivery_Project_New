import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/common/constants/app_images.dart';
import 'package:food_delivery_admin/common/constants/order_status.dart';
import 'package:food_delivery_admin/models/get_restaurant_order_model/get_restaurant_order_model.dart';
import 'package:get/get.dart';
import '../../controllers/new_order_screen_controller/new_order_screen_controller.dart';

class TabsModule extends StatelessWidget {
  TabsModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: newOrderScreenController.tabController,
      indicatorColor: Colors.white,
      tabs: [
        /// New Order
        GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 0;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 0
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Center(
                child: Text(
                  'New Orders',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    color: newOrderScreenController.tabController.index == 0
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// Accepted
        GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 1;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 1
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Center(
                child: Text(
                  'Accepted Orders',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    color: newOrderScreenController.tabController.index == 1
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// Preparing
        GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 2;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 2
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Center(
                child: Text(
                  'Preparing Orders',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    color: newOrderScreenController.tabController.index == 2
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// Prepared
        GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 3;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 3
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Text(
                'Prepared Orders',
                textScaleFactor: 1.1,
                //maxLines: 1,
                style: TextStyle(
                  color: newOrderScreenController.tabController.index == 3
                      ? Colors.white
                      : AppColors.colorDarkPink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        /// On The Way
        GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 4;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 4
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Center(
                child: Text(
                  'On The Way Orders',
                  textScaleFactor: 1.1,
                  maxLines: 1,
                  style: TextStyle(
                    color: newOrderScreenController.tabController.index == 4
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// Delivered
        GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 5;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 5
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Center(
                child: Text(
                  'Delivered Orders',
                  textScaleFactor: 1.1,
                  maxLines: 1,
                  style: TextStyle(
                    color: newOrderScreenController.tabController.index == 5
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// Cancel
        GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 6;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 6
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Center(
                child: Text(
                  'Cancel Orders',
                  textScaleFactor: 1.1,
                  maxLines: 1,
                  style: TextStyle(
                    color: newOrderScreenController.tabController.index == 6
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// All
        /*GestureDetector(
          onTap: () {
            newOrderScreenController.isLoading(true);
            newOrderScreenController.tabController.index = 7;
            newOrderScreenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: newOrderScreenController.tabController.index == 7
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Center(
                child: Text(
                  'All Orders',
                  textScaleFactor: 1.1,
                  maxLines: 1,
                  style: TextStyle(
                    color: newOrderScreenController.tabController.index == 7
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}

/// New Order List
class NewOrderModule extends StatelessWidget {
  NewOrderModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.newOrderList.length == 0
        ? Center(
            child: Text(
              "No Orders Available",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: newOrderScreenController.newOrderList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Order singleOrder = newOrderScreenController.newOrderList[i];
              return _todayOrderListTile(singleOrder);
            },
          );
  }

  Widget _todayOrderListTile(Order singleOrder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(singleOrder)),
                      const SizedBox(width: 10),
                      _amountAndButton(singleOrder),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _acceptAndCancelButton(singleOrder),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 15),
          // _acceptAndCancelButton(),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName(Order singleOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleOrder.userId.userName /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + singleOrder.orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${singleOrder.orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${singleOrder.id}',
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

  Widget _amountAndButton(Order singleOrder) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + singleOrder.amount.toString(),
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

  Widget _acceptAndCancelButton(Order singleOrder) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        GestureDetector(
          onTap: () async {
            /// Accept Order Here
            log("Order Id : ${singleOrder.id}");
            log("Order Status : ${OrderStatus.orderAcceptedId}");
            // await newOrderScreenController.updateOrderStatus(
            //   orderId: singleOrder.id,
            //   orderStatusId: OrderStatus.orderAcceptedId,
            // );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.colorDarkPink,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Accept',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: () async {
            /// Cancel Order Here
            log("Order Id : ${singleOrder.id}");
            log("Order Status : ${OrderStatus.cancelOrderId}");
            // await newOrderScreenController.updateOrderStatus(
            //   orderId: singleOrder.id,
            //   orderStatusId: OrderStatus.cancelOrderId,
            // );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.colorDarkPink,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}

/// Accepted Order List
class AcceptedOrderModule extends StatelessWidget {
  AcceptedOrderModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.acceptedOrderList.length == 0
        ? Center(
            child: Text(
              "No Orders Available",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: newOrderScreenController.acceptedOrderList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Order singleOrder = newOrderScreenController.acceptedOrderList[i];
              return _todayOrderListTile(singleOrder);
            },
          );
  }

  Widget _todayOrderListTile(Order singleOrder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(singleOrder)),
                      const SizedBox(width: 10),
                      _amountAndButton(singleOrder),

                    ],
                  ),
                  const SizedBox(height: 15),
                  _preparingButton(singleOrder),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName(Order singleOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleOrder.userId.userName /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + singleOrder.orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${singleOrder.orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${singleOrder.id}',
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

  Widget _amountAndButton(Order singleOrder) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + singleOrder.amount.toString(),
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

  Widget _preparingButton(Order singleOrder) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        GestureDetector(
          onTap: () async {
            /// Preparing Order Here
            log("Order Id : ${singleOrder.id}");
            log("Order Status : ${OrderStatus.preparingId}");
            // await newOrderScreenController.updateOrderStatus(
            //   orderId: singleOrder.id,
            //   orderStatusId: OrderStatus.preparingId,
            // );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.colorDarkPink,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Accept',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}

/// Preparing Order List
class PreparingModule extends StatelessWidget {
  PreparingModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.preparingList.length == 0
        ? Center(
            child: Text(
              "No Orders Available",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: newOrderScreenController.preparingList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Order singleOrder = newOrderScreenController.preparingList[i];
              return _todayOrderListTile(singleOrder);
            },
          );
  }

  Widget _todayOrderListTile(Order singleOrder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(singleOrder)),
                      const SizedBox(width: 10),
                      _amountAndButton(singleOrder),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _preparedButton(singleOrder),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName(Order singleOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleOrder.userId.userName /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + singleOrder.orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${singleOrder.orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${singleOrder.id}',
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

  Widget _amountAndButton(Order singleOrder) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + singleOrder.amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {
        //     print('Confirm');
        //   },
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

  Widget _preparedButton(Order singleOrder) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        GestureDetector(
          onTap: () async {
            /// Preparing Order Here
            log("Order Id : ${singleOrder.id}");
            log("Order Status : ${OrderStatus.preparedId}");
            // await newOrderScreenController.updateOrderStatus(
            //   orderId: singleOrder.id,
            //   orderStatusId: OrderStatus.preparedId,
            // );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.colorDarkPink,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Accept',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }


}

/// Prepared Order List
class PreparedModule extends StatelessWidget {
  PreparedModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.preparedList.length == 0
        ? Center(
            child: Text(
              "No Orders Available",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: newOrderScreenController.preparedList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Order singleOrder = newOrderScreenController.preparedList[i];
              return _todayOrderListTile(singleOrder);
            },
          );
  }

  Widget _todayOrderListTile(Order singleOrder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(singleOrder)),
                      const SizedBox(width: 10),
                      _amountAndButton(singleOrder),
                    ],
                  ),

                  /// todo - DD
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName(Order singleOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleOrder.userId.userName /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + singleOrder.orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${singleOrder.orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${singleOrder.id}',
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

  Widget _amountAndButton(Order singleOrder) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + singleOrder.amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {
        //     print('Confirm');
        //   },
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

/// On the way Order List
class OnTheWayModule extends StatelessWidget {
  OnTheWayModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.onTheWayList.length == 0
        ? Center(
            child: Text(
              "No Orders Available",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: newOrderScreenController.onTheWayList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Order singleOrder = newOrderScreenController.onTheWayList[i];
              return _todayOrderListTile(singleOrder);
            },
          );
  }

  Widget _todayOrderListTile(Order singleOrder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(singleOrder)),
                      const SizedBox(width: 10),
                      _amountAndButton(singleOrder),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName(Order singleOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleOrder.userId.userName /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + singleOrder.orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${singleOrder.orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${singleOrder.id}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
      ],
    );
  }

  Widget _amountAndButton(Order singleOrder) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + singleOrder.amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {
        //     print('Confirm');
        //   },
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

/// Delivered Order List
class DeliveredModule extends StatelessWidget {
  DeliveredModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.deliveredList.length == 0
        ? Center(
            child: Text(
              "No Orders Available",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: newOrderScreenController.deliveredList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Order singleOrder = newOrderScreenController.deliveredList[i];
              return _todayOrderListTile(singleOrder);
            },
          );
  }

  Widget _todayOrderListTile(Order singleOrder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(singleOrder)),
                      const SizedBox(width: 10),
                      _amountAndButton(singleOrder),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName(Order singleOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleOrder.userId.userName /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + singleOrder.orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${singleOrder.orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${singleOrder.id}',
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

  Widget _amountAndButton(Order singleOrder) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + singleOrder.amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }

}

/// Cancel Order List
class CancelModule extends StatelessWidget {
  CancelModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.canceledList.length == 0
        ? Center(
            child: Text(
              "No Orders Available",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: newOrderScreenController.canceledList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              Order singleOrder = newOrderScreenController.canceledList[i];
              return _todayOrderListTile(singleOrder);
            },
          );
  }

  Widget _todayOrderListTile(Order singleOrder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(singleOrder)),
                      const SizedBox(width: 10),
                      _amountAndButton(singleOrder),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName(Order singleOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleOrder.userId.userName /* + " " + singleOrder.storeId.lastName*/,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + singleOrder.orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          singleOrder.details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${singleOrder.orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${singleOrder.id}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
      ],
    );
  }

  Widget _amountAndButton(Order singleOrder) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + singleOrder.amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 20),
        // GestureDetector(
        //   onTap: () {
        //     print('Confirm');
        //   },
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
