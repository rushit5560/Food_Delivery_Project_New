import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/constants/order_status.dart';
import 'package:food_delivery_admin/common/store_details.dart';
import 'package:food_delivery_admin/models/status_wise_order_delivery_boy_model/status_wise_order_delivery_boy_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/get_restaurant_order_model/get_restaurant_order_model.dart';

class NewOrderScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  RxBool isTodayOrderSelected = true.obs;
  RxBool isNewOrderSelected = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt selectedTabIndex = 1.obs;
  late TabController tabController;

  // List<Order> pendingOrderList = [];
  // List<Order> allOrderList = [];
  // List<Order> onTheWayList = [];
  // List<Order> deliveredList = [];


  List<Order> newOrderList = [];
  List<Order> acceptedOrderList = [];
  List<Order> canceledList = [];
  List<Order> onTheWayList = [];
  List<Order> deliveredList = [];
  List<Order> preparingList = [];
  List<Order> preparedList = [];
  List<Order> allOrdersList = [];

  RxList<GetList> deliveryBoyLists = [GetList(firstName: "Select Name")].obs;
  GetList? deliveryBoyDropDownValue;

  @override
  void onInit() {
    getPendingOrderList();
    tabController = TabController(vsync: this, length: 7);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> getPendingOrderList() async {
    log("Store Id: ${StoreDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.RestaurantAllOrdersApi + "${StoreDetails.storeId}";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      GetRestaurantOrderModel getRestaurantOrderModel = GetRestaurantOrderModel .fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantOrderModel.status.obs;
      log("status : $isSuccessStatus");

      if(isSuccessStatus.value){

        /// Restaurant All Order Add in List
        allOrdersList.addAll(getRestaurantOrderModel.order);
        log("allOrderList : $allOrdersList");

        // New Orders List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.pendingId) {
            newOrderList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("newOrderList : ${newOrderList.length}");

        // Accepted Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.orderAcceptedId) {
            acceptedOrderList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pendingOrderList : ${preparingList.length}");

        // Preparing Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.preparingId) {
            preparingList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pendingOrderList : ${preparingList.length}");

        // Prepared Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.preparedId) {
            preparedList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pendingOrderList : ${preparedList.length}");

        // Canceled Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.cancelOrderId) {
            canceledList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pendingOrderList : ${canceledList.length}");

        // PickedUp Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.pickedUpId) {
            onTheWayList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pendingOrderList : ${onTheWayList.length}");


        // Delivered Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.deliveredId) {
            deliveredList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pendingOrderList : ${deliveredList.length}");



      } else {
        log('Get All Order Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
       //isLoading(false);
      getAllStatusWiseDeliveryBoyList();
    }
  }

  Future<void> updateOrderStatus({required String orderStatusId, required String orderId}) async {
    isLoading(true);
    String url = ApiUrl.UpdateOrderStatus + "$orderId";
    log("url : $url");

    try {
      Map<String, dynamic> data = {
        "OrderStatusId" : "$orderStatusId"
      };
      log("data : $data");



    } catch(e) {
      log("updateOrderStatus Error ::: $e");
    } finally {
      // isLoading(false);
      await getPendingOrderList();
    }

  }

  getAllStatusWiseDeliveryBoyList() async {
    isLoading(true);
    String url = ApiUrl.StatusWiseDeliveryBoyApi + "61fb6435f0a739b8f2dc65d6";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('Get All Status Wise Order Response : ${response.body}');

      StatusWiseOrderDeliveryBoyModel statusWiseOrderDeliveryBoyModel = StatusWiseOrderDeliveryBoyModel.fromJson(json.decode(response.body));
      print('statusWiseOrderDeliveryBoyModel : $statusWiseOrderDeliveryBoyModel');
      isSuccessStatus = statusWiseOrderDeliveryBoyModel.status!.obs;
      print('allStatusWiseOrder : $isSuccessStatus');

      if(isSuccessStatus.value){
        print("Success");
        for(int i =0; i < statusWiseOrderDeliveryBoyModel.getList!.length; i++){
          deliveryBoyLists.add(statusWiseOrderDeliveryBoyModel.getList![i]);

        }
        // deliveryBoyLists.add(statusWiseOrderDeliveryBoyModel.getList![i]);
         deliveryBoyDropDownValue = deliveryBoyLists[0];
        print('deliveryBoyLists : ${deliveryBoyLists.length}');
      } else {
        print('Get All Delivery Boy Else Else');
      }

    } catch(e) {
      print('Get All Delivery Boy False False');
    } finally {
      isLoading(false);
    }
  }


  loading() {
    isLoading(true);
    isLoading(false);
  }
}