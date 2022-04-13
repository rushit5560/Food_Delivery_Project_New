import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_admin/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'common/constants/app_theme.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Delivery Admin Application',
      debugShowCheckedModeBanner: false,
      theme: appLightTheme(),

      home: SplashScreen(),
    );
  }
}

