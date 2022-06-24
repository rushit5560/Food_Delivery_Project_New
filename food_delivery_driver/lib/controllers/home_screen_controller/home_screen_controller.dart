import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/api_url.dart';
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


  /*getStatusWiseAllOrdersList()async{
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
  }*/

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

}