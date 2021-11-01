import 'package:flutter/material.dart';
import 'package:food_delivery/screens/add_address_screen/add_address_screen.dart';
import 'package:food_delivery/screens/auth_screen/auth_screen.dart';
import 'package:food_delivery/screens/contact_us_screen/contact_us_screen.dart';
import 'package:food_delivery/screens/index_screen/index_screen.dart';
import 'package:food_delivery/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'common/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appLightTheme(),
      home: AuthScreen(),

    );
  }
}

