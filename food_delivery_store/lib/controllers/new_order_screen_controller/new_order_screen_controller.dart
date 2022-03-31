import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/user_details.dart';
import 'package:food_delivery_admin/models/today_order_model/today_order_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewOrderScreenController extends GetxController {
  RxBool isTodayOrderSelected = true.obs;
  RxBool isNewOrderSelected = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Order> todayOrderList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTodayOrderList();
  }

  getTodayOrderList() async {
    print("Store Id: ${UserDetails.storeId}");
    isLoading(true);
    String url = ApiUrl.TodayOrderApi + "${UserDetails.storeId}";
   // String url = ApiUrl.TodayOrderApi + "61fa81fc1b790c4fcf4d28a0";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : ${response.body}');

      GetTodayOrderModel todayOrderModel = GetTodayOrderModel .fromJson(json.decode(response.body));
      isSuccessStatus = todayOrderModel.status.obs;
      print("status : $isSuccessStatus");

      if(isSuccessStatus.value){
        todayOrderList = todayOrderModel.order;
        print('allTodayOrder : $todayOrderList');
      } else {
        print('Get All Order Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
       isLoading(false);
    }
  }
}