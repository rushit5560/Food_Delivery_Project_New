import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/my_settings_screen_controller/my_settings_screen_controller.dart';
import 'package:food_delivery/screens/my_settings_screen/settings_screen_widgets.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  //const SettingsScreen({Key? key}) : super(key: key);
  SettingsScreenController settingScreenController = Get.put(SettingsScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Settings'),

      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            Divider(),
            Sms(),
            Divider(),

            Divider(),
            InApp(),
            Divider(),

            Divider(),
            Email(),
            Divider(),


          ],
        ),
      ),
    );
  }
}
