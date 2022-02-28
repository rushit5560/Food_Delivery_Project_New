import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/controllers/my_settings_screen_controller/my_settings_screen_controller.dart';
import 'package:get/get.dart';

class Sms extends StatelessWidget {
  //const Sms({Key? key}) : super(key: key);

  SettingsScreenController settingScreenController =
      Get.find<SettingsScreenController>();

  // Sms({required this.settingScreenController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Images.ic_sms,
                scale: 2,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "SMS",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Obx(
            () => Switch(
              value: settingScreenController.isSms.value,
              onChanged: (value) {
                //setState(() {
                settingScreenController.isSms.value = value;
                print(settingScreenController.isSms.value);
                //});
              },
              activeTrackColor: AppColors.colorLightPink,
              activeColor: AppColors.colorDarkPink,
            ),
          ),
        ],
      ),
    );
  }
}

class InApp extends StatelessWidget {
  //const Sms({Key? key}) : super(key: key);

  SettingsScreenController settingScreenController =
      Get.find<SettingsScreenController>();

  // InApp({required this.settingScreenController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Images.ic_inapp,
                scale: 2,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "IN APP",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Obx(
            () => Switch(
              value: settingScreenController.isInApp.value,
              onChanged: (value) {
                //setState(() {
                settingScreenController.isInApp.value = value;
                print(settingScreenController.isInApp.value);
                //});
              },
              activeTrackColor: AppColors.colorLightPink,
              activeColor: AppColors.colorDarkPink,
            ),
          ),
        ],
      ),
    );
  }
}

class Email extends StatelessWidget {
  //const Sms({Key? key}) : super(key: key);

  SettingsScreenController settingScreenController =
      Get.find<SettingsScreenController>();

  // Email({required this.settingScreenController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Images.ic_email,
                scale: 2,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "EMAIL",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Obx(
            () => Switch(
              value: settingScreenController.isEmail.value,
              onChanged: (value) {
                //setState(() {
                settingScreenController.isEmail.value = value;
                print(settingScreenController.isEmail.value);
                //});
              },
              activeTrackColor: AppColors.colorLightPink,
              activeColor: AppColors.colorDarkPink,
            ),
          ),
        ],
      ),
    );
  }
}
