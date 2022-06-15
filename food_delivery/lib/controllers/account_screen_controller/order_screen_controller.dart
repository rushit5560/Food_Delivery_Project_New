import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/user_cart_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/user_details.dart';
import '../../models/order_screen_model/customers_all_orders_model.dart';

class OrderScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Order> userOrderList = [];

  getUserAllOrderList() async {
    isLoading(true);
    String url = ApiUrl.UserAllOrderApi;
    String finalUrl = url + "${UserDetails.userId}";
    print('finalUrl : $finalUrl');

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : $response');

      CustomersAllOrdersModel customersAllOrdersModel = CustomersAllOrdersModel.fromJson(json.decode(response.body));
      isSuccessStatus = customersAllOrdersModel.status.obs;

      if(isSuccessStatus.value){
        userOrderList = customersAllOrdersModel.order;
        print('userOrderList : $userOrderList');
      } else {
        print('Get User All Address Else Else');
      }

    } catch(e) {
      print('User All Order Error $e');
    } finally {
      isLoading(false);
    }

  }

  createOrderFunction() async {
    isLoading(true);
    String url = ApiUrl.UserCreateOrderApi;
    String finalUrl = url;
    print('finalUrl : $finalUrl');

    Map<String, dynamic> body = {
      "StoreId" : UserCartDetails.userCartRestaurantId,
      "UserId" : UserDetails.userId,
      "Amount" : 200,
      "Cart" : UserCartDetails.userCartId,
      "Details" : "jdkhdks"
    };

    try{
      http.Response response = await http.post(Uri.parse(finalUrl), body: body);
      print('response : $response');

      CustomersAllOrdersModel customersAllOrdersModel = CustomersAllOrdersModel.fromJson(json.decode(response.body));
      isSuccessStatus = customersAllOrdersModel.status.obs;

      if(isSuccessStatus.value){

        print('userOrderList : $userOrderList');
      } else {
        print('Get User All Address Else Else');
      }

    } catch(e) {
      print('User All Order Error $e');
    } finally {
      isLoading(false);
    }

  }

  /*List<OrderModel> orderList = [
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
  ];*/

  @override
  void onInit() {
    getUserAllOrderList();
    super.onInit();
  }
}