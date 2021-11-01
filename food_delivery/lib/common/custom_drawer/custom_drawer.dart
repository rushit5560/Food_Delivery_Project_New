import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/common/custom_drawer/custom_drawer_widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only( left: 10, right: 10),
                color: AppColors.colorDarkPink,
                child: Column(
                  children: [
                    SizedBox(height: 140,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.asset(Images.ic_shopping_bag, scale: 2,),
                    ),

                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.asset(Images.ic_shopping_bag, scale: 2,),
                    ),

                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.asset(Images.ic_shopping_bag, scale: 2,),
                    ),

                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.asset(Images.ic_shopping_bag, scale: 2,),
                    ),

                    Expanded(
                      child: Container(
                       padding: EdgeInsets.only(top: 90),
                          child: Image.asset(Images.ic_logout, scale: 2.5,)),
                    )
                  ],
                ),
              ),
            ),


            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(top: 70),
                color: Colors.black,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              ProfilePicAndName(),
                              SizedBox(height: 20),
                              DrawerList()
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*customDrawerController.isLoggedIn.value
                      ? logoutButton()
                      : loginButton(),*/

                  ],
                ),
              ),
            ),


          ],

        ),
      ),
    );
  }
}
