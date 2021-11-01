import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_images.dart';
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
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          homeButton(),
          myProfile(),
          wishList(),
          aboutUs(),
          termsCondition(),
          helpCenter(),
          inviteEarn(),
          language(),
          SizedBox(height: 10,),
          logout()
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_home, color: Colors.white,scale: 3,),
      //leading: Icon(Icons.home_outlined,color: Colors.white,),
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
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_profile, color: Colors.white,scale: 2.5,),
      //leading: Icon(Icons.person, color: Colors.white,),
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
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_wishlist, color: Colors.white,scale: 2.5,),
      //leading: Icon(Icons.person, color: Colors.white,),
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
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_about_us, color: Colors.white,scale: 2.5,),
      //leading: Icon(Icons.person, color: Colors.white,),
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
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_terms_condition, color: Colors.white,scale: 2.5,),
      //leading: Icon(Icons.person, color: Colors.white,),
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
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_help, color: Colors.white,scale: 2.5,),
      //leading: Icon(Icons.person, color: Colors.white,),
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
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_invite, color: Colors.white,scale: 2.5,),
      //leading: Icon(Icons.person, color: Colors.white,),
      title: Text('Invite n Earn',
        textScaleFactor: 1,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget language(){
    return ListTile(
      onTap: () {
        Get.back();
        //Get.to(() => IndexPage());
      },
      leading: Image.asset(Images.ic_language, color: Colors.white,scale: 2.5,),
      //leading: Icon(Icons.person, color: Colors.white,),
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
        // Get.to(() => SignInPage());
        //CommonFunctions().clearUserDetailsFromPrefs();
        Get.snackbar('User LogOut Successfully', '');
      },
      //leading: Icon(Icons.login_outlined,/*color: Colors.black,*/),
      title: Text('Logout',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

