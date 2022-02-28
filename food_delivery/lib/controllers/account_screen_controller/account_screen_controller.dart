import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/models/account_screen_model/account_info_model.dart';
import 'package:get/get.dart';

class AccountScreenController extends GetxController {
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
}