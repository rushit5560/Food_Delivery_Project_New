import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_drawer/custom_drawer_widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 70),
        color: Colors.black87,
        child: Column(
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
    );
  }
}
