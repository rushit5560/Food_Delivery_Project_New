import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/all_orders_model/all_orders_model.dart';

class TodayOrderScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxList<ListElement> allOrderList = RxList();


  getAllOrdersFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllOrdersApi;
    print('url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('response : ${response.body}');

      AllOrdersModel allOrdersModel = AllOrdersModel.fromJson(json.decode(response.body));
      isSuccessStatus = allOrdersModel.status.obs;
      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value) {
        allOrderList = allOrdersModel.list.obs;
        print('allOrderList : $allOrderList');
      } else {
        print('getAllOrdersFunction False False');
      }

    } catch(e) {
      print('getAllOrdersFunction Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllOrdersFunction();
    super.onInit();
  }
}