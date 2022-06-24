import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/order_details_screen_model/order_details_screen_model.dart';

class OrderDetailsScreenController extends GetxController{
  String orderId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String orderImage = "";
  String orderDetail = "";
  String orderId1 = "";
  String orderDate = "";
  String orderNumber = "";
  String orderType = "";
  int orderAmount = 0;
  String paymentStatus = "";

  /// Shipping Address
  String storeAddress= "";
  String storeMobile= "";
  String storeEmail= "";

  /// Billing Address
  String billingName= "";
  String billingAddress= "";
  String billingMobile= "";
  String billingEmail= "";

  String date = "";
  String time = "";

  List<Orderitem> productList = [];

  /// Order details
  getOrdersByOrderId() async {
    isLoading(true);
    String url = ApiUrl.GetOrdersByIdAPI;
    String finalUrl = url + "$orderId";
    print('finalUrl : $finalUrl');

    try {
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('order detail response : $response');

      OrderDetailsScreenModel orderDetailsScreenModel =
      OrderDetailsScreenModel.fromJson(json.decode(response.body));
      isSuccessStatus = orderDetailsScreenModel.status.obs;
      log('isSuccessStatus: $isSuccessStatus');

      if (isSuccessStatus.value) {
        for(int i=0; i< orderDetailsScreenModel.orderitem.length; i++){
          orderImage = "${ApiUrl.ApiMainPath}" + orderDetailsScreenModel.orderitem[i].productId.image;
          orderDetail = orderDetailsScreenModel.order.details;
          orderId1 = orderDetailsScreenModel.order.id;
          orderDate = orderDetailsScreenModel.order.orderDate;
          orderNumber= orderDetailsScreenModel.orderitem[i].orderNumber;
          orderType= orderDetailsScreenModel.order.orderType;
          orderAmount= orderDetailsScreenModel.order.amount;
          paymentStatus = orderDetailsScreenModel.order.paymentStatus;

          //date = orderDate.substring(0, orderDate.length - 14);
          //time = orderDate.substring(12, orderDate.length - 19);
          log('orderImage: $orderImage');
          log('orderDetail: $orderDetail');
          log('orderId1: $orderId1');
         // log('orderDate: $date');
          //log('orderTime: $time');

        }

        /// Shipping Address
        storeAddress = orderDetailsScreenModel.order.restaurantId.address;
        storeMobile = orderDetailsScreenModel.order.restaurantId.phone.toString();
        storeEmail = orderDetailsScreenModel.order.restaurantId.email;

        /// Billing Address
        billingName = orderDetailsScreenModel.order.userId.fullName;
        billingAddress = orderDetailsScreenModel.order.userId.address;
        billingMobile = orderDetailsScreenModel.order.userId.phone.toString();
        billingEmail = orderDetailsScreenModel.order.userId.email;

        productList = orderDetailsScreenModel.orderitem;
        log('productList: $productList');

      } else {
        print('Get Product By Id Else Else');
      }
    } catch (e) {
      print('Error : $e');
    } finally {
      isLoading(false);
      //getAllProductListOfRestaurant();
    }
  }

  @override
  void onInit() {
    getOrdersByOrderId();
    super.onInit();
  }
}