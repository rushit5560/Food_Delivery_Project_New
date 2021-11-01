import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/models/order_screen_model/order_model.dart';
import 'package:get/get.dart';

class OrderScreenController extends GetxController {
  List<OrderModel> orderList = [
    OrderModel(
      itemImg: Images.ic_category2,
      itemName: 'Hot Dog',
      itemQty: 1,
      dateAndTime: '25 oct, 7.00AM',
      orderId: '5FJSH8HF',
      payMethod: 'Wallet',
      orderStatus: 'Pending',
      itemAmount: '150.00',
    ),
    OrderModel(
      itemImg: Images.ic_category3,
      itemName: 'Sandwich',
      itemQty: 2,
      dateAndTime: '25 oct, 7.00AM',
      orderId: '5FJSH8HF',
      payMethod: 'Wallet',
      orderStatus: 'Confirm',
      itemAmount: '150.00',
    ),
    OrderModel(
      itemImg: Images.ic_category2,
      itemName: 'Donuts',
      itemQty: 2,
      dateAndTime: '25 oct, 7.00AM',
      orderId: '5FJSH8HF',
      payMethod: 'Wallet',
      orderStatus: 'Re-order',
      itemAmount: '150.00',
    ),
  ];
}