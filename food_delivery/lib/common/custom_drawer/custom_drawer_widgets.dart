import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/screens/Invoice_screen/invoice_screen.dart';
import 'package:food_delivery/screens/about_us_screen/about_us_screen.dart';
import 'package:food_delivery/screens/account_screen/account_screen.dart';
import 'package:food_delivery/screens/addresses_screen/addresses_screen.dart';
import 'package:food_delivery/screens/auth_screen/auth_screen.dart';
import 'package:food_delivery/screens/contact_us_screen/contact_us_screen.dart';
import 'package:food_delivery/screens/invite_and_earn_screen/invite_and_earn_screen.dart';
import 'package:food_delivery/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:food_delivery/screens/profile_screen/profile_screen.dart';
import 'package:food_delivery/screens/reward_point/reward_point.dart';
import 'package:food_delivery/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:food_delivery/screens/wishlist_screen/wishlist_screen.dart';
import 'package:get/get.dart';
import '../sharedpreference_data/sharedpreference_data.dart';


class ProfilePicAndName extends StatelessWidget {
  const ProfilePicAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 40, width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            child: Center(
              child: Image.asset(Images.ic_profile, color: Colors.black, height: 20, width: 20,),
            ),
          ),
          SizedBox(width: 20,),

          Container(
            child: Text("Hey John Doe",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
          )
        ],
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  DrawerList({Key? key}) : super(key: key);
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          homeButton(),
          myProfile(),
          wishList(),
          aboutUs(),
          //invoice(),
          termsCondition(),
          privacyPolicy(),
          helpCenter(),
          inviteEarn(),
          addAddress(),
          rewardPoint(),
          SizedBox(height: 10),
          logout()
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: Image.asset(Images.ic_home, color: Colors.white,scale: 3,),
      title: Text('Home',
        textScaleFactor: 1,
         style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget myProfile() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ProfileScreen());
      },
      leading: Image.asset(Images.ic_profile, color: Colors.white,scale: 2.5,),
      title: Text('My Profile',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget wishList() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => WishListScreen());
      },
      leading: Image.asset(Images.ic_wishlist, color: Colors.white,scale: 2.5,),
      title: Text('My Wishlist',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget aboutUs() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => AboutUsScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('About Us',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // Widget invoice() {
  //   return ListTile(
  //     onTap: () {
  //       Get.back();
  //       Get.to(() => InvoiceScreen());
  //     },
  //     leading: Image.asset(Images.ic_terms_condition, color: Colors.white,scale: 2.5,),
  //     title: Text('Invoice',
  //       textScaleFactor: 1,
  //       style: TextStyle(color: Colors.white),
  //     ),
  //   );
  // }

  Widget termsCondition() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => TermsAndConditionScreen());
      },
      leading: Image.asset(Images.ic_terms_condition, color: Colors.white,scale: 2.5,),
      title: Text('Terms & Condition',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget privacyPolicy() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => PrivacyPolicyScreen());
      },
      leading: Image.asset(Images.ic_terms_condition, color: Colors.white,scale: 2.5,),
      title: Text('Privacy Policy',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget helpCenter() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ContactUsScreen());
      },
      leading: Image.asset(Images.ic_help, color: Colors.white,scale: 2.5,),
      title: Text('Help Center',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget inviteEarn(){
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => InviteAndEarnScreen());
      },
      leading: Image.asset(Images.ic_invite, color: Colors.white,scale: 2.5,),
      title: Text('Invite n Earn',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget addAddress(){
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => AddressesScreen());
      },
      leading: Image.asset(Images.ic_language, color: Colors.white,scale: 2.5,),
      title: Text('Add Address',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget account(){
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => AccountScreen());
      },
      leading: Image.asset(Images.ic_profile, color: Colors.white,scale: 2.5,),
      title: Text('Account',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget rewardPoint(){
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => RewardPointScreen());
      },
      leading: Image.asset(Images.ic_profile, color: Colors.white,scale: 2.5,),
      title: Text('Reward Point',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget logout(){
    return ListTile(
      onTap: () async {
        Get.back();
        /// Clear All UserLoggedIn Data
        await sharedPreferenceData.clearUserLoginDetailsFromPrefs();
        Get.offAll(() => AuthScreen());
      },
      leading: Image.asset(Images.ic_logout, color: Colors.white,scale: 5.5),
      title: Text('Logout',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

