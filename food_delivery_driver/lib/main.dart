import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_driver/screens/nextday_order_screen/nextday_order_screen.dart';
import 'package:food_delivery_driver/screens/splash_screen/splash_screen.dart';
import 'package:food_delivery_driver/screens/today_order_screen/today_order_screen.dart';
import 'package:get/get.dart';
import 'common/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SplashScreen(),
    );
  }
}

