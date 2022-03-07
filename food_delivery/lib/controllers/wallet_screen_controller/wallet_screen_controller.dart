import 'dart:convert';

import 'package:food_delivery/common/constant/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/api_url.dart';
import '../../models/get_user_wallet_model/get_user_wallet_model.dart';

class WalletScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt walletAmount = 0.obs;

  getUserWalletFunction() async {
    isLoading(true);
    String url = ApiUrl.GetUserWalletApi;
    String finalUrl = url + "${UserDetails.userId}";
    print('finalUrl : $finalUrl');

    try{
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : ${response.body}');

      GetUserWalletModel getUserWalletModel = GetUserWalletModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserWalletModel.status.obs;
      print('isSuccessStatus : ${isSuccessStatus.value}');

      if(isSuccessStatus.value) {
        walletAmount = getUserWalletModel.wallet.amount.obs;
        print('walletAmount : $walletAmount');
      } else {
        print('getUserWalletFunction Else Else');
      }

    } catch(e) {
      print('getUserWalletFunction Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getUserWalletFunction();
    super.onInit();
  }

}