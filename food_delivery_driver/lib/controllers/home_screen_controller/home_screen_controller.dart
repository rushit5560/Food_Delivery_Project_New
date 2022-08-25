import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/api_url.dart';
import 'package:food_delivery_driver/common/constant/order_status.dart';
import 'package:food_delivery_driver/models/get_restaurant_order_model/get_restaurant_order_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  late TabController tabController;
  List pendingList = ["1", "2", "3"];
  List acceptedList = ["1", "2", "3"];
  List pickedUpList = ["1", "2", "3"];
  List doneList = ["1", "2", "3"];

  List<Order> pendingOrderList = [];
  List<Order> preparingOrderList = [];
  List<Order> pickedUpOrderList = [];
  List<Order> deliveredOrderList = [];

  List<Order> allOrdersList = [];


  getStatusWiseAllOrdersList()async{
    //log("Store Id: ${StoreDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.RestaurantAllOrdersApi + "622b09a668395c49dcb4aa73";
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

        // Pending Orders List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.pendingId) {
            pendingOrderList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pendingOrderList : ${pendingOrderList.length}");

        // Accepted Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.preparingId) {
            preparingOrderList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("preparingOrderList : ${preparingOrderList.length}");

        // Picked up Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.pickedUpId) {
            pickedUpOrderList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("pickedUpOrderList : ${pickedUpOrderList.length}");

        // Delivered Order List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.id == OrderStatus.deliveredId) {
            deliveredOrderList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("deliveredOrderList : ${deliveredOrderList.length}");


      } else {
        log('Get All Order Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
      //getAllStatusWiseDeliveryBoyList();
    }
  }

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    getStatusWiseAllOrdersList();
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

}