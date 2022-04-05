import 'dart:developer';

import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/get_restaurant_order_model/get_restaurant_order_model.dart';

class NewOrderScreenController extends GetxController {
  RxBool isTodayOrderSelected = true.obs;
  RxBool isNewOrderSelected = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Order> pendingOrderList = [];
  List<Order> allOrderList = [];

  @override
  void onInit() {
    getPendingOrderList();
    super.onInit();
  }

  getPendingOrderList() async {
    log("Store Id: ${UserDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.RestaurantAllOrdersApi + "${UserDetails.storeId}";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      GetRestaurantOrderModel getRestaurantOrderModel = GetRestaurantOrderModel .fromJson(json.decode(response.body));
      isSuccessStatus = getRestaurantOrderModel.status.obs;
      log("status : $isSuccessStatus");

      if(isSuccessStatus.value){

        /// Restaurant All Order Add in List
        allOrderList.addAll(getRestaurantOrderModel.order);

        /// Restaurant Only Pending Orders Add in List
        for(int i = 0; i < getRestaurantOrderModel.order.length; i++) {
          if(getRestaurantOrderModel.order[i].orderStatusId.status == "PENDING") {
            pendingOrderList.add(getRestaurantOrderModel.order[i]);
          }
        }
        log("todayOrderList : $pendingOrderList");

      } else {
        log('Get All Order Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
       isLoading(false);
    }
  }
}