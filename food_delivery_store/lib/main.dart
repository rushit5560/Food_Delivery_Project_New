import 'package:flutter/material.dart';
import 'package:food_delivery_admin/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import 'common/app_theme.dart';
import 'screens/earnings_screen/earnings_screen.dart';

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
      home: EarningsScreen(),
    );
  }
}

