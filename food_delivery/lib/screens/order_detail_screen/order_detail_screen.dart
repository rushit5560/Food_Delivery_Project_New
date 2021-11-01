import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/screens/order_detail_screen/order_detail_screen_widgets.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Order Details'),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Column(
            children: [
                OrderDetails(),
                SizedBox(height: 10,),
                OrderTimeLine(),
                SizedBox(height: 10,),
                OrderAddress(),
                SizedBox(height: 10,),
                DeliveryAddress(),
                SizedBox(height: 10,),
                paymentMethod()
            ],
          ),
        ),
      ),
    );
  }
}
