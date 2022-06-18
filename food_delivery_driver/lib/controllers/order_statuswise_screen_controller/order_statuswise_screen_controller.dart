import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusWiseScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  late TabController tabController;
  List pendingList = ["1", "2", "3"];
  List acceptedList = ["1", "2", "3"];
  List pickedUpList = ["1", "2", "3"];
  List doneList = ["1", "2", "3"];





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