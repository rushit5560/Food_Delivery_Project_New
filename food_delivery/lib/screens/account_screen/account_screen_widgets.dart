import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:food_delivery/controllers/account_screen_controller/account_screen_controller.dart';
import 'package:food_delivery/screens/about_us_screen/about_us_screen.dart';
import 'package:food_delivery/screens/auth_screen/auth_screen.dart';
import 'package:food_delivery/screens/change_password_screen/change_password_screen.dart';
import 'package:food_delivery/screens/contact_us_screen/contact_us_screen.dart';
import 'package:food_delivery/screens/invite_and_earn_screen/invite_and_earn_screen.dart';
import 'package:food_delivery/screens/notification_screen/notification_screen.dart';
import 'package:food_delivery/screens/offer_zone_screen/offer_zone_screen.dart';
import 'package:food_delivery/screens/order_screen/order_screen.dart';
import 'package:food_delivery/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:food_delivery/screens/wallet_screen/wallet_screen.dart';
import 'package:food_delivery/screens/wishlist_screen/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../edit_profile_screen/edit_profile_screen.dart';

/// Account Details
class AccountDetailsModule extends StatelessWidget {
  AccountDetailsModule({Key? key}) : super(key: key);
  final accountScreenController = Get.find<AccountScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                // flex: 65,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${accountScreenController.userName}',
                        maxLines: 1,
                        textScaleFactor: 1.35,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${accountScreenController.userEmail}',
                        maxLines: 1,
                      ),
                      SizedBox(height: 3),
                      Text('${accountScreenController.userPhone}', maxLines: 1),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    height: 78,
                    width: 78,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("${accountScreenController.userProfilePic}"),
                        fit: BoxFit.cover,
                      ),
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

/// Edit Profile Button
class EditProfileButtonModule extends StatelessWidget {
  EditProfileButtonModule({Key? key}) : super(key: key);
  final accountScreenController = Get.find<AccountScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () => Get.to(()=> EditProfileScreen())!.then((value) async {
          await accountScreenController.getUserAccount();
        }),
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

/// Change Password Text
class ChangePassTextModule extends StatelessWidget {
  ChangePassTextModule({Key? key}) : super(key: key);
  final accountScreenController = Get.find<AccountScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => Get.to(
          () => ChangePasswordScreen(),
          transition: Transition.rightToLeft,
          arguments: "${accountScreenController.userEmail}",
        ),
        child: Text(
          "Change Password?",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.colorDarkPink,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}


/// Header Text Module
class HeaderTextModule extends StatelessWidget {
  final String text;
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

/// Account Info
class AccountInfoListModule extends StatelessWidget {
  final accountScreenController = Get.find<AccountScreenController>();

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
      /*case 0:
        Get.to(()=> AddressesScreen());
        break;*/
      case 0:
        Get.to(()=> OrderScreen());
        break;
      case 1:
        Get.to(()=> WishListScreen());
        break;
      case 2:
        Get.to(()=> WalletScreen());
        break;
      case 3:
        Get.to(()=> OfferZoneScreen());
        break;
      /*case 5:
        Get.to(()=> LanguageScreen());
        break;*/
      case 4:
        Get.to(()=> NotificationScreen());
        break;
    }
  }

}

/// Other Info
class OtherInfoListModule extends StatelessWidget {
  final accountScreenController = Get.find<AccountScreenController>();
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
        Get.to(() => InviteAndEarnScreen());
        //clickedOnShareButton();
        break;
      case 2:
        Get.to(()=> TermsAndConditionScreen());
        break;
      case 3:
        Get.to(()=> AboutUsScreen());
        break;
      /*case 4:
        Get.to(()=> SettingsScreen());
        break;*/
    }
  }

  clickedOnShareButton() {
    Share.share('OmTec Web Food Delivery Project');
  }
}

/// Logout Button
class LogoutButtonModule extends StatelessWidget {
  LogoutButtonModule({Key? key}) : super(key: key);
  final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

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

  void clickedOnLogout() async {
    /// Clear All UserLoggedIn Data
    await sharedPreferenceData.clearUserLoginDetailsFromPrefs();
    Get.offAll(()=> AuthScreen());
    Get.snackbar('User LogOut Successfully', '');
  }
}
