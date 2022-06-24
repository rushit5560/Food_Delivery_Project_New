import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:food_delivery/controllers/order_details_screen_controller/order_details_screen_controller.dart';
import 'package:food_delivery/screens/Invoice_screen/invoice_screen.dart';
import 'package:get/get.dart';

class OrderTab extends StatelessWidget {
  final TabController tabController;
  OrderTab({required this.tabController});

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
              labelPadding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
              unselectedLabelColor: Colors.grey,
              controller:  tabController,

              tabs: [
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.colorDarkPink),
                    // color: tabController.index == 0 ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Tab(
                      text: 'Running',
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    tabController.index = 1;
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.colorDarkPink),
                      // color: tabController.index == 1 ? AppColors.colorDarkPink : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Tab(
                        text: "History",
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
                  RunningOrderTab(),
                  // TopSellingTab(),
                  HistoryOrderTab(),
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

class RunningOrderTab extends StatelessWidget {
  RunningOrderTab({Key? key}) : super(key: key);
  final screenController = Get.find<OrderDetailsScreenController>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Id"),
            Text("${screenController.orderId1}"),
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Date:"),
            Text("${screenController.orderDate}"),

          ],
        ),
        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Time:"),
            Text("${screenController.orderDate}"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorDarkPink),
              child: Center(
                child: Text(
                  "Pending",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorDarkPink),
              child: Center(
                child: Text(
                  "Track Order",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        )

      ],
    );
  }
}

class HistoryOrderTab extends StatelessWidget {
  HistoryOrderTab({Key? key}) : super(key: key);
  final screenController = Get.find<OrderDetailsScreenController>();
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Number: "),
            Text("${screenController.orderNumber}"),
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Date:"),
            Text("${screenController.orderDate}"),
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Type"),
            Text("${screenController.orderType}"),
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Amount"),
            Text("${screenController.orderAmount}"),

          ],
        ),

        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Payment Status"),
            Text("${screenController.paymentStatus}"),

          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                //cartScreenController.createOrderFunction();
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorDarkPink),
                child: Center(
                  child: Text(
                    "Re-Order",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: (){
                //cartScreenController.createOrderFunction();
                Get.to(()=> InvoiceScreen(), arguments: screenController.orderId);
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorDarkPink),
                child: Center(
                  child: Text(
                    "Invoice",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),


      ],
    );
  }
}
