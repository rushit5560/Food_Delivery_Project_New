import 'dart:convert';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/common/constant/user_details.dart';
import 'package:food_delivery/models/account_screen_model/account_info_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/account_screen_model/user_account_model.dart';


class AccountScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  String userName = '';
  String userEmail = '';
  String userPhone = '';

  getUserAccount() async {
   isLoading(true);
   String url = ApiUrl.UserAccountApi;
   String finalUrl = url + "${UserDetails.userId}";
   print('finalUrl : $finalUrl');

   try{
     http.Response response = await http.get(Uri.parse(finalUrl));
     print('response : $response');

     UserAccountModel userAccountModel = UserAccountModel.fromJson(json.decode(response.body));
     isSuccessStatus = userAccountModel.status.obs;

     if(isSuccessStatus.value) {
       userName = userAccountModel.user.userName;
       userEmail = userAccountModel.user.email;
       userPhone = userAccountModel.user.phone;
     } else {
       print('Get User Account Else Else');
     }
   } catch(e) {
     print('Get User Account Details : $e');
   } finally {
     isLoading(false);
   }


  }

  List<AccountInfoModel> accountInfoList = [
    AccountInfoModel(
      image: '${Images.ic_account_info_1}',
      name: 'Manage Addresses',
    ),
    AccountInfoModel(
      image: '${Images.ic_account_info_2}',
      name: 'Your Orders',
    ),
    AccountInfoModel(
      image: '${Images.ic_account_info_3}',
      name: 'Favourite Items',
    ),
    AccountInfoModel(
      image: '${Images.ic_account_info_4}',
      name: 'Wallets',
    ),
    AccountInfoModel(
      image: '${Images.ic_account_info_5}',
      name: 'Offer Zone',
    ),
    /*AccountInfoModel(
      image: '${Images.ic_account_info_6}',
      name: 'App language',
    ),*/
    AccountInfoModel(
      image: '${Images.ic_account_info_7}',
      name: 'Notification',
    ),
  ];

  List<AccountInfoModel> otherList = [
    AccountInfoModel(
      image: Images.ic_other_1,
      name: 'Need Help?',
    ),
    AccountInfoModel(
      image: Images.ic_other_2,
      name: 'Share',
    ),
    AccountInfoModel(
      image: Images.ic_other_3,
      name: 'Terms & Conditions',
    ),
    AccountInfoModel(
      image: Images.ic_other_4,
      name: 'About Us',
    ),
    AccountInfoModel(
      image: Images.ic_other_5,
      name: 'Settings',
    ),
  ];

  @override
  void onInit() {
    getUserAccount();
    super.onInit();
  }
}