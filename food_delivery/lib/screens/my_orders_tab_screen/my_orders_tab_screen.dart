import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:food_delivery/controllers/order_details_screen_controller/order_details_screen_controller.dart';
import 'package:food_delivery/screens/my_orders_tab_screen/my_order_tab_screen_widgets.dart';
import 'package:get/get.dart';

class MyOrdersTabScreen extends StatefulWidget {
  const MyOrdersTabScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersTabScreen> createState() => _MyOrdersTabScreenState();
}


class _MyOrdersTabScreenState extends State<MyOrdersTabScreen>  with SingleTickerProviderStateMixin{
  late TabController _tabController;
  OrderDetailsScreenController orderDetailsScreenController = Get.put(OrderDetailsScreenController());
  final cartScreenController = Get.put(CartScreenController());
  //final homeScreenController = Get.put(HomeScreenController());

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
      appBar: commonAppBarModule(title: 'Order'),

      body: Column(
        children: [
          SizedBox(height: 20),
          OrderTab(tabController: _tabController),
        ],
      ),
    );

}
}