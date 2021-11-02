import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/controllers/account_screen_controller/account_screen_controller.dart';
import 'package:food_delivery/screens/about_us_screen/about_us_screen.dart';
import 'package:food_delivery/screens/addresses_screen/addresses_screen.dart';
import 'package:food_delivery/screens/contact_us_screen/contact_us_screen.dart';
import 'package:food_delivery/screens/index_screen/index_screen.dart';
import 'package:food_delivery/screens/language_screen/language_screen.dart';
import 'package:food_delivery/screens/my_profile_screen/my_profile_screen.dart';
import 'package:food_delivery/screens/my_settings_screen/my_settings_screen.dart';
import 'package:food_delivery/screens/notification_screen/notification_screen.dart';
import 'package:food_delivery/screens/order_screen/order_screen.dart';
import 'package:food_delivery/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:food_delivery/screens/wallet_screen/wallet_screen.dart';
import 'package:food_delivery/screens/wishlist_screen/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class AccountDetailsModule extends StatelessWidget {
  const AccountDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 65,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        textScaleFactor: 1.35,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'demo@gmail.com'
                      ),
                      SizedBox(height: 3),
                      Text('1234567890'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 35,
                child: Container(
                  child: Image.asset(
                      '${Images.ic_food_logo2}',
                    scale: 2.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileButtonModule extends StatelessWidget {
  const EditProfileButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () => Get.to(()=> MyProfileScreen()),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorDarkPink,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Text(
              'Edit Profile',
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class HeaderTextModule extends StatelessWidget {
  String text;
  HeaderTextModule({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.black, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Text(
              '$text',
              textScaleFactor: 1.5,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: Colors.black, thickness: 1),
        ],
      ),
    );
  }
}

class AccountInfoListModule extends StatelessWidget {
  AccountScreenController accountScreenController = Get.find<AccountScreenController>();

  // AccountInfoListModule({required this.accountScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: accountScreenController.accountInfoList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                clickedOnSingleItem(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                                '${accountScreenController.accountInfoList[index].image}',
                                scale: 2),
                            SizedBox(width: 20),
                            Text(
                              '${accountScreenController.accountInfoList[index].name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void clickedOnSingleItem(int index) {
    switch (index) {
      case 0:
        Get.to(()=> AddressesScreen());
        break;
      case 1:
        Get.to(()=> OrderScreen());
        break;
      case 2:
        Get.to(()=> WishListScreen());
        break;
      case 3:
        Get.to(()=> WalletScreen());
        break;
      case 4:
        // Get.to(()=> );
        print('Offer Zone');
        break;
      case 5:
        Get.to(()=> LanguageScreen());
        break;
      case 6:
        Get.to(()=> NotificationScreen());
        break;
    }
  }

}

class OtherInfoListModule extends StatelessWidget {
  AccountScreenController accountScreenController = Get.find<AccountScreenController>();
  // OtherInfoListModule({required this.accountScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: accountScreenController.otherList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                clickedOnSingleItem(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                                '${accountScreenController.otherList[index].image}',
                                scale: 2),
                            SizedBox(width: 20),
                            Text(
                              '${accountScreenController.otherList[index].name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void clickedOnSingleItem(int index) {
    switch (index) {
      case 0:
        Get.to(()=> ContactUsScreen());
        break;
      case 1:
        clickedOnShareButton();
        break;
      case 2:
        Get.to(()=> TermsAndConditionScreen());
        break;
      case 3:
        Get.to(()=> AboutUsScreen());
        break;
      case 4:
        Get.to(()=> SettingsScreen());
        break;
    }
  }

  clickedOnShareButton() {
    Share.share('Food Delivery User');
  }
}

class LogoutButtonModule extends StatelessWidget {
  const LogoutButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black, thickness: 1),
        GestureDetector(
          onTap: () => clickedOnLogout(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Row(
              children: [
                Image.asset(Images.ic_sign_out, scale: 1.9),
                SizedBox(width: 20),
                Text(
                  'LOGOUT',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.black, thickness: 1),
      ],
    );
  }

  void clickedOnLogout() {
    print('Log Out');
    Get.offAll(()=> IndexScreen());
    Get.snackbar('User LogOut Successfully', '');
  }
}
