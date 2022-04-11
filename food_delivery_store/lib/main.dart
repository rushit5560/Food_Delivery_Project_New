import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/constants/app_theme.dart';
import 'screens/delivery_man_screen/delivery_man_screen.dart';


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

      home: DeliveryManScreen(),
    );
  }
}

