import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_images.dart';
import 'package:food_delivery_driver/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:food_delivery_driver/screens/about_us_screen/about_us_screen.dart';
import 'package:food_delivery_driver/screens/contact_us_screen/contact_us_screen.dart';
import 'package:food_delivery_driver/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:food_delivery_driver/screens/home_screen/home_screen.dart';
import 'package:food_delivery_driver/screens/insight_screen/insight_screen.dart';
import 'package:food_delivery_driver/screens/language_screen/language_screen.dart';
import 'package:food_delivery_driver/screens/send_to_bank_screen/send_to_bank_screen.dart';
import 'package:food_delivery_driver/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery_driver/screens/terms_and_condition_screen/terms_and_condition_screen.dart';

import 'package:get/get.dart';

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
          editProfile(),
          insight(),
          sendToBank(),
          aboutUs(),
          termsCondition(),
          helpCenter(),
          //language(),
          SizedBox(height: 20),
          logout()
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => HomeScreen());
      },
      leading: Image.asset(Images.ic_home, color: Colors.white,scale: 3,),
      title: Text('Home',
        textScaleFactor: 1,
         style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget editProfile() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => EditProfileScreen());
      },
      leading: Image.asset(Images.ic_profile, color: Colors.white,scale: 2.5,),
      title: Text('Edit Profile',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget insight() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => InsightScreen());
      },
      leading: Image.asset(Images.ic_insight, color: Colors.white,scale: 2.5,),
      title: Text('Insight',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget sendToBank(){
    return ListTile(
      onTap: () {
        Get.back();
         Get.to(() => SendToBankScreen());
      },
      leading: Image.asset(Images.ic_bank, color: Colors.white,scale: 2.5,),
      title: Text('Send To Bank',
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
        sharedPreferenceData.clearUserLoginDetailsFromPrefs();
        Get.offAll(() => SignInScreen());
      },
      leading: Image.asset(Images.ic_logout, color: Colors.white, scale: 5.5,),
      title: Text('Logout',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

