import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/screens/earnings_screen/earnings_screen.dart';
import 'package:food_delivery_admin/screens/insight_screen/insight_screen.dart';
import 'package:food_delivery_admin/screens/items_screen/items_screen.dart';
import 'package:food_delivery_admin/screens/language_screen/language_screen.dart';
import 'package:food_delivery_admin/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

import '../app_images.dart';

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
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          myOrders(),
          insight(),
          myItems(),
          myEarnings(),
          myProfile(),
          aboutUs(),
          termsAndCondition(),
          helpCenter(),
          language(),
          SizedBox(height: 10),
          logout()
        ],
      ),
    );
  }

  Widget myOrders() {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: Image.asset(Images.ic_my_orders, color: Colors.white, scale: 3),
      title: Text(
        'My Orders',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget insight() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> InsightScreen());
      },
      leading: Image.asset(Images.ic_insight, color: Colors.white, scale: 3),
      title: Text(
        'Insight',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget myItems() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> ItemsScreen());
      },
      leading: Image.asset(Images.ic_my_items, color: Colors.white, scale: 3),
      title: Text(
        'My Items',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget myEarnings() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> EarningsScreen());
      },
      leading: Image.asset(Images.ic_earnings, color: Colors.white, scale: 3),
      title: Text(
        'My Earnings',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget myProfile() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => ProfileScreen());
      },
      leading: Image.asset(Images.ic_profile, color: Colors.white,scale: 2.5,),
      title: Text('My Profile',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget aboutUs() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => ProfileScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('About Us',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget termsAndCondition() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => ProfileScreen());
      },
      leading: Image.asset(Images.ic_terms_condition, color: Colors.white,scale: 2.5,),
      title: Text('Terms & Condition',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget helpCenter() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => ProfileScreen());
      },
      leading: Image.asset(Images.ic_help, color: Colors.white,scale: 2.5,),
      title: Text('Help Center',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget language(){
      return ListTile(
        onTap: () {
          Get.back();
          Get.to(() => LanguageScreen());
        },
        leading: Image.asset(Images.ic_language, color: Colors.white,scale: 2.5,),
        title: Text('Language',
          textScaleFactor: 1,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

  Widget logout(){
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => SignInScreen());
      },
      leading: Image.asset(Images.ic_logout, color: Colors.white,scale: 5.5),
      title: Text('Logout',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

