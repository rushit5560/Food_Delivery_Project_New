import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:food_delivery_admin/screens/about_us_screen/about_us_screen.dart';
import 'package:food_delivery_admin/screens/addon_screen/addon_screen.dart';
import 'package:food_delivery_admin/screens/bank_info_screen/bank_info_screen.dart';
import 'package:food_delivery_admin/screens/contact_us_screen/contact_us_screen.dart';
import 'package:food_delivery_admin/screens/customer_review_screen/customer_review_screen.dart';
import 'package:food_delivery_admin/screens/delivery_man_screen/delivery_man_screen.dart';
import 'package:food_delivery_admin/screens/earnings_screen/earnings_screen.dart';
import 'package:food_delivery_admin/screens/employee_screen/employee_screen.dart';
import 'package:food_delivery_admin/screens/insight_screen/insight_screen.dart';
import 'package:food_delivery_admin/screens/items_screen/items_screen.dart';
import 'package:food_delivery_admin/screens/language_screen/language_screen.dart';
import 'package:food_delivery_admin/screens/new_order_screen/new_order_screen.dart';
import 'package:food_delivery_admin/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery_admin/screens/store_profile_screen/store_profile_screen.dart';
import 'package:food_delivery_admin/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:get/get.dart';
import '../../screens/campaign_screen/campaign_screen.dart';
import '../../screens/category_screen/category_screen.dart';
import '../../screens/sub_category_screen/sub_category_screen.dart';
import '../constants/app_images.dart';


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
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           myOrders(),
          // insight(),
          myItems(),
          addonModule(),
          categoryModule(),
          subCategoryModule(),
          campaignModule(),
          employeeModule(),
          deliveryManModule(),
          bankInfoModule(),
          customerReviewModule(),
          myProfile(),
          aboutUs(),
          termsAndCondition(),
          helpCenter(),
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
        Get.to(()=> NewOrderScreen());
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
        Get.to(() => StoreProfileScreen());
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
        Get.to(() => AboutUsScreen());
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
      onTap: ()async {
        Get.back();
        await sharedPreferenceData.clearUserLoginDetailsFromPrefs();
        Get.offAll(() => SignInScreen());
        Get.snackbar('Store LogOut Successfully', '');
      },
      leading: Image.asset(Images.ic_logout, color: Colors.white,scale: 5.5),
      title: Text('Logout',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// New Routes
  Widget addonModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => AddonScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Addon',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget categoryModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CategoryScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Category',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget subCategoryModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => SubCategoryScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Sub Category',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget employeeModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => EmployeeScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Employee',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget deliveryManModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => DeliveryManScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Delivery Man',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget bankInfoModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => BankInfoScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Bank Information',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget customerReviewModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CustomerReviewScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Customer Review',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget campaignModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CampaignScreen());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      title: Text('Campaign',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

