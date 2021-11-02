import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreenController extends GetxController with SingleGetTickerProviderMixin {

  /*getOnBoardingValue() {
    Get.offAll(()=> AuthView());
  }*/
  late TabController tabController;

  @override
  void onInit() {
    print('-----------Controller Init Method Called.-----------');
    //Timer(Duration(seconds: 5), () => getOnBoardingValue());
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }





}